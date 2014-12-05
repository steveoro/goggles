# encoding: utf-8
require 'spec_helper'

require 'begin_time_calculator'


describe BeginTimeCalculator, type: :strategy do

  it_behaves_like( "(the existance of a class method)", [
    :compute
  ] )
  #-- -------------------------------------------------------------------------
  #++

  describe "self.compute" do
    let(:scheduled_date_string)       { "#{ 2000 + ((rand * 100) % 15).to_i }-11-01" }
    let(:scheduled_date)              { Date.parse( scheduled_date_string ) }
    let(:event_order)                 { (1 + rand * 100).to_i }
    let(:athletes_tot)                { (1 + rand * 50).to_i }
    let(:base_time_mins)              { (rand * 10).to_i }
    let(:result) do
      subject.class.compute(
        scheduled_date,
        event_order,
        athletes_tot,
        base_time_mins
      )
    end

    let(:optimistic_duration_mins) do
      ( (event_order - 1) + (athletes_tot < 8 ? 8 : athletes_tot) / 8 ) *
      (base_time_mins.to_i < 2 ? 2 : base_time_mins.to_i)
    end
    let(:optimistic_duration_hours)   { optimistic_duration_mins / 60 + 8 }
    let(:pessimistic_duration_mins)   { optimistic_duration_mins * 3 + 2 }
    let(:pessimistic_duration_hours)  { pessimistic_duration_mins / 60 + 8 }

    let(:optimistic_guess) do
      Time.utc(
        scheduled_date.year, scheduled_date.month, scheduled_date.day + (optimistic_duration_hours/24),
        optimistic_duration_hours % 24,
        optimistic_duration_mins % 60
      )
    end
    let(:pessimistic_guess) do
      Time.utc(
        scheduled_date.year, scheduled_date.month, scheduled_date.day + (pessimistic_duration_hours/24),
        pessimistic_duration_hours % 24,
        pessimistic_duration_mins % 60
      )
    end

    it "always returns a Time instance" do
      expect( result ).to be_an_instance_of( Time )
    end

    it "returns a fair guess not below an optimistic guess" do
# DEBUG
#      puts "\r\nEvent ##{event_order}, athletes_tot: #{athletes_tot}, base_time_mins: #{base_time_mins}"
#      puts "=> result: #{result}, optimistic_guess: #{optimistic_guess}, pessimistic_guess: #{pessimistic_guess}"
      expect( result.to_f ).to be >= optimistic_guess.to_f
    end

    it "returns a fair guess not above a pessimistic guess" do
# DEBUG
#      puts "\r\nEvent ##{event_order}, athletes_tot: #{athletes_tot}, base_time_mins: #{base_time_mins}"
#      puts "=> result: #{result}, optimistic_guess: #{optimistic_guess}, pessimistic_guess: #{pessimistic_guess}"
      expect( result.to_f ).to be < pessimistic_guess.to_f
    end
    #-- -----------------------------------------------------------------------
    #++

    context "when given a previous begin time," do
      let(:previous_begin_time)         { Time.parse( scheduled_date_string + " #{ '%02d' % (8 + rand * 9).to_i }:00") }
      let(:result_with_prev_begin_time) do
        subject.class.compute(
          scheduled_date,
          event_order,
          athletes_tot,
          base_time_mins,
          previous_begin_time
        )
      end

      it "returns a guess that is not below the previous begin time" do
# DEBUG
#        puts "\r\nEvent ##{event_order}, athletes_tot: #{athletes_tot}, base_time_mins: #{base_time_mins}"
#        puts "=> result: #{result_with_prev_begin_time}, previous_begin_time: #{previous_begin_time}, optimistic_guess: #{optimistic_guess}, pessimistic_guess: #{pessimistic_guess}"
        expect( result_with_prev_begin_time.to_f ).to be > previous_begin_time.to_f
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
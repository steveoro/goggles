class AddMeetingScoreComputationTypeIdToMeeting < ActiveRecord::Migration
  def change
    # [Leega, 20131029]
    #
    # - meeting.individual_score_computation_type_id (existing)
    #   explains how to compute individual ranking scores;
    #   (tr.: spiega come calcolare il punteggio per la classifica individuale.)
    #
    # - meeting.relay_score_computation_type_id (existing)
    #   explains how to compute the relay scores (which have a ranking
    #   apart and are taken into account just for the team scores);
    #   (tr.: spiega come calcolare il punteggio per le staffette
    #   che non hanno una loro classifica e si considerano quindi
    #   solo per il calcolo del punteggio di squadra.)
    #
    # - meeting.team_score_computation_type_id (existing)
    #   explains how to compute the overall team score for the meeting; that
    #   is, how much a single event is worth for the team ranking among the
    #   season (see below).
    #   (tr.: spiega come calcolare il punteggio della prestazione per la
    #   classifica di squadra; ossia quanto vale la singola prova
    #   individuale per la classifica di società.)
    #
    # - meeting.meeting_score_computation_type_id (new)
    #   explains how to compute the ranking team scores;
    #   that is, how to use and combine each score computed with the
    #   previous methods.
    #   (tr.: spiega come calcolare il punteggio per la classifica di società,
    #   ossia nel caso come usare i vari punteggi calcolati con
    #   i metodi precedenti.)﻿

    # ----------------- MEETINGS ----------------------------------------------
    change_table(:meetings) do |t|
      t.belongs_to( :meeting_score_computation_type,
                  class_name: "ScoreComputationType", 
                  foreign_key: "meeting_score_computation_type_id"
      )
    end

    execute <<-SQL
      ALTER TABLE meetings
        ADD CONSTRAINT fk_meetings_score_meeting_score_computation_types
        FOREIGN KEY (meeting_score_computation_type_id)
        REFERENCES score_computation_types(id)
    SQL

    # ----------------- DATA IMPORT MEETINGS ----------------------------------
    change_table(:data_import_meetings) do |t|
      t.belongs_to( :meeting_score_computation_type,
                  class_name: "ScoreComputationType", 
                  foreign_key: "meeting_score_computation_type_id"
      )
    end
  end
end
 
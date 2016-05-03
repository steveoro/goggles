
#
# == DB performance benchmarks
#
# Utility benchmarks to test DB performance on different patterns
#
# @author   Leega
# @version  4.00.837
#
class DbBenchmark
  
  # Benchmark to decide what kind of data random is better
  # for spec purposes
  #
  def random_bench
    def random1
      rand_id = rand(Team.count)
      rand_record = Team.first(:conditions => [ "id >= ?", rand_id])
    end
    
    def random2
      if (c = Team.count) != 0
        Team.find(:first, :offset =>rand(c))
      end
    end
    
    def random3
      Team.find(Team.pluck(:id).sample)
    end
    
    def random4
      Team.all.sample
    end
    
    def random5
      Team.all[( rand * Team.count - 1).round(0)]
    end
    
    def random6
      Team.order('RAND()').first
    end
    
    def random7
      Team.all.sort{ rand - 0.5 }[0]
    end
    
    n = 10
    Benchmark.bm(7) do |x|
      x.report("next id:")  { n.times {|i| random1 } }
      x.report("offset :")  { n.times {|i| random2 } }
      x.report("pluck  :")  { n.times {|i| random3 } }
      x.report("sample :")  { n.times {|i| random4 } }
      x.report("rand   :")  { n.times {|i| random5 } }
      x.report("sort   :")  { n.times {|i| random6 } }
      x.report("steve  :")  { n.times {|i| random7 } }
    end
  end

end

class AddDefaultTags < ActiveRecord::Migration
  def up
    say 'Adding default Tags...'
    Tag.transaction do                              # -- START TRANSACTION --
      Tag.create!([
          { :name => 'allenamenti', :user_id=>1 },
          { :name => 'risultati', :user_id=>1 },
          { :name => 'classifiche', :user_id=>1 },
          { :name => 'recensioni', :user_id=>1 },
          { :name => 'collegiale', :user_id=>1 },
          { :name => 'sfida', :user_id=>1 },

          { :name => 'FIN', :user_id=>1 },
          { :name => 'CSI', :user_id=>1 },
          { :name => 'UISP', :user_id=>1 },
          { :name => 'FINA', :user_id=>1 },
          { :name => 'LEM', :user_id=>1 },
                                                    # Using multi-tagging for a single topic and adding also english tags here simplifies I18n management:  
          { :name => 'workout', :user_id=>1 },
          { :name => 'results', :user_id=>1 },
          { :name => 'charts', :user_id=>1 },
          { :name => 'reviews', :user_id=>1 },
          { :name => 'team workshop', :user_id=>1 },
          { :name => 'challenge', :user_id=>1 },
          { :name => 'achievements', :user_id=>1 }
      ])
    end
  end


  def down
    say 'Deleting all Tags...'
    Tag.delete_all
  end
end

class AddDefaultUsers < ActiveRecord::Migration
  def up
    say 'Adding default Users...'
    User.transaction do                             # -- START TRANSACTION --
      User.create!([
        { :name => 'steve', :email=>'steve.alloro@gmail.com', :description => 'Stefano Alloro', :password=>'password', :password_confirmation=>'password' },
        { :name => 'leega', :email=>'leegaweb@gmail.com', :description => 'Marco Ligabue', :password=>'password', :password_confirmation=>'password' }
      ])
    end
  end


  def down
    say 'Deleting all Users...'
    User.delete_all
  end
end

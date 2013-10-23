class AddDefaultAdmins < ActiveRecord::Migration
  def up
    say 'Adding default Admins...'
    Admin.transaction do                             # -- START TRANSACTION --
      Admin.create!([
        { :name => 'steve', :email=>'steve.alloro@gmail.com', :description => 'Stefano Alloro', :password=>'password', :password_confirmation=>'password' },
        { :name => 'leega', :email=>'leegaweb@gmail.com', :description => 'Marco Ligabue', :password=>'password', :password_confirmation=>'password' }
      ])
    end
  end


  def down
    say 'Deleting all Admins...'
    Admin.delete_all
  end
end

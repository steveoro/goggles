class AddDefaultAdmins < ActiveRecord::Migration
  def up
    say 'Adding default Admins...'
    Admin.transaction do                             # -- START TRANSACTION --
      Admin.create!([
        { :name => 'steve', :email=>'steve@wks-6.fasar', :description => 'Stefano Alloro', :password=>'password', :password_confirmation=>'password' },
        { :name => 'leega', :email=>'leega@wks-6.fasar', :description => 'Marco Ligabue', :password=>'password', :password_confirmation=>'password' }
      ])
    end
  end


  def down
    say 'Deleting all Admins...'
    Admin.delete_all
  end
end

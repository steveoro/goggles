# RailsAdmin config file. Generated on July 16, 2013 12:41
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Goggles', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_admin } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'Admin'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'Admin'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['AccreditationTimeType', 'Admin', 'Affiliation', 'AppParameter', 'Article', 'Badge', 'CategoryType', 'MeetingTeamScore', 'City', 'Comment', 'DataImportBadge', 'DataImportCity', 'DataImportMeeting', 'DataImportMeetingIndividualResult', 'DataImportMeetingProgram', 'DataImportMeetingSession', 'DataImportSeason', 'DataImportSession', 'DataImportSwimmer', 'DataImportTeam', 'EventType', 'EventsByPoolType', 'FederationType', 'GenderType', 'HairDryerType', 'IndividualAccreditation', 'LockerCabinetType', 'Meeting', 'MeetingIndividualResult', 'MeetingProgram', 'MeetingSession', 'OberCup', 'OberCupStandard', 'Passage', 'PassageType', 'PoolType', 'PresenceType', 'RelayType', 'ResultType', 'Season', 'SeasonType', 'Session', 'ShowerType', 'StrokeType', 'Swimmer', 'SwimmerResult', 'SwimmingPool', 'SwimmingPoolReview', 'Tag', 'Tag4Entity', 'Team', 'TimeStandard', 'User']

  # Include specific models (exclude the others):
  # config.included_models = ['AccreditationTimeType', 'Admin', 'Affiliation', 'AppParameter', 'Article', 'Badge', 'CategoryType', 'MeetingTeamScore', 'City', 'Comment', 'DataImportBadge', 'DataImportCity', 'DataImportMeeting', 'DataImportMeetingIndividualResult', 'DataImportMeetingProgram', 'DataImportMeetingSession', 'DataImportSeason', 'DataImportSession', 'DataImportSwimmer', 'DataImportTeam', 'EventType', 'EventsByPoolType', 'FederationType', 'GenderType', 'HairDryerType', 'IndividualAccreditation', 'LockerCabinetType', 'Meeting', 'MeetingIndividualResult', 'MeetingProgram', 'MeetingSession', 'OberCup', 'OberCupStandard', 'Passage', 'PassageType', 'PoolType', 'PresenceType', 'RelayType', 'ResultType', 'Season', 'SeasonType', 'Session', 'ShowerType', 'StrokeType', 'Swimmer', 'SwimmerResult', 'SwimmingPool', 'SwimmingPoolReview', 'Tag', 'Tag4Entity', 'Team', 'TimeStandard', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  # config.actions do
    # # root actions
    # dashboard                     # mandatory
# 
    # # collection actions 
    # index                         # mandatory
    # new
    # export
    # history_index
    # bulk_delete
# 
    # # member actions
    # show
    # edit
    # delete
    # history_show
    # show_in_app
  # end

  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.

  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:


  ###  AccreditationTimeType  ###

  config.model 'AccreditationTimeType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your accreditation_time_type.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :i18n_description   # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end

  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Admin  ###

  config.model 'Admin' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your admin.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :lock_version, :integer 
  #     configure :name, :string 
  #     configure :description, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Affiliation  ###

  config.model 'Affiliation' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your affiliation.rb model definition

  #   # Found associations:
  #     configure :team, :belongs_to_association 
  #     configure :season, :belongs_to_association 
  #     configure :swimmer, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :number, :string 
  #     configure :name, :string 
  #     configure :must_compute_ober_cup, :boolean 
  #     configure :team_id, :integer         # Hidden 
  #     configure :season_id, :integer         # Hidden 
  #     configure :swimmer_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
        sort_by :name           # Sort column (default is primary key)
        sort_reverse false     # Sort direction (default is true for primary key, last created first)
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  AppParameter  ###

  config.model 'AppParameter' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your app_parameter.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :integer 
  #     configure :controller_name, :string 
  #     configure :action_name, :string 
  #     configure :is_a_post, :boolean 
  #     configure :confirmation_text, :string 
  #     configure :a_string, :string 
  #     configure :a_bool, :boolean 
  #     configure :a_integer, :integer 
  #     configure :a_date, :datetime 
  #     configure :a_decimal, :decimal 
  #     configure :a_decimal_2, :decimal 
  #     configure :a_decimal_3, :decimal 
  #     configure :a_decimal_4, :decimal 
  #     configure :range_x, :integer 
  #     configure :range_y, :integer 
  #     configure :a_name, :string 
  #     configure :a_filename, :string 
  #     configure :tooltip_text, :string 
  #     configure :view_height, :integer 
  #     configure :code_type_1, :integer 
  #     configure :code_type_2, :integer 
  #     configure :code_type_3, :integer 
  #     configure :code_type_4, :integer 
  #     configure :free_text_1, :text 
  #     configure :free_text_2, :text 
  #     configure :free_text_3, :text 
  #     configure :free_text_4, :text 
  #     configure :free_bool_1, :boolean 
  #     configure :free_bool_2, :boolean 
  #     configure :free_bool_3, :boolean 
  #     configure :free_bool_4, :boolean 
  #     configure :description, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :code     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
        sort_by :code           # Sort column (default is primary key)
        sort_reverse false     # Sort direction (default is true for primary key, last created first)
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Article  ###

  config.model 'Article' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your article.rb model definition

  #   # Found associations:
  #     configure :user, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :title, :string 
  #     configure :entry_text, :text 
  #     configure :is_sticky, :boolean 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :title     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
        sort_by :updated_at           # Sort column (default is primary key)
        sort_reverse true     # Sort direction (default is true for primary key, last created first)
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Badge  ###

  config.model 'Badge' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your badge.rb model definition

  #   # Found associations:
  #     configure :season, :belongs_to_association 
  #     configure :swimmer, :belongs_to_association 
  #     configure :team, :belongs_to_association 
  #     configure :category_type, :belongs_to_association 
  #     configure :accreditation_time_type, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :meeting_individual_results, :has_many_association 
  #     configure :swimmer_results, :has_many_association 
  #     configure :passages, :has_many_association 
  #     configure :individual_accreditations, :has_many_association 
  #     configure :ober_cup_standards, :has_many_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :number, :string 
  #     configure :season_id, :integer         # Hidden 
  #     configure :swimmer_id, :integer         # Hidden 
  #     configure :team_id, :integer         # Hidden 
  #     configure :category_type_id, :integer         # Hidden 
  #     configure :accreditation_time_type_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :number     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
        sort_by :number           # Sort column (default is primary key)
        sort_reverse false     # Sort direction (default is true for primary key, last created first)
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  CategoryType  ###

  config.model 'CategoryType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your category_type.rb model definition

  #   # Found associations:
  #     configure :season_type, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :federation_code, :string 
  #     configure :description, :string 
  #     configure :short_name, :string 
  #     configure :group_name, :string 
  #     configure :age_begin, :integer 
  #     configure :age_end, :integer 
  #     configure :season_type_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :code     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
        sort_by :code           # Sort column (default is primary key)
        sort_reverse false     # Sort direction (default is true for primary key, last created first)
      end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  MeetingTeamScore  ###

  # config.model 'MeetingTeamScore' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your challenge_score.rb model definition

  #   # Found associations:
  #     configure :affiliation, :belongs_to_association 
  #     configure :meeting, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :total_individual_points, :decimal 
  #     configure :total_relay_points, :decimal 
  #     configure :affiliation_id, :integer         # Hidden 
  #     configure :meeting_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  City  ###

  # config.model 'City' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your city.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :name, :string 
  #     configure :zip, :string 
  #     configure :area, :string 
  #     configure :country, :string 
  #     configure :country_code, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Comment  ###

  # config.model 'Comment' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your comment.rb model definition

  #   # Found associations:

  #     configure :user, :belongs_to_association 
  #     configure :swimming_pool_review, :belongs_to_association 
  #     configure :comment, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :entry_text, :string 
  #     configure :user_id, :integer         # Hidden 
  #     configure :swimming_pool_review_id, :integer         # Hidden 
  #     configure :comment_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  DataImportBadge  ###

  # config.model 'DataImportBadge' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your data_import_badge.rb model definition

  #   # Found associations:
  #     configure :data_import_session, :belongs_to_association 
  #     configure :badge, :belongs_to_association 
  #     configure :swimmer, :belongs_to_association 
  #     configure :team, :belongs_to_association 
  #     configure :season, :belongs_to_association 
  #     configure :category_type, :belongs_to_association 
  #     configure :accreditation_time_type, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :data_import_session_id, :integer         # Hidden 
  #     configure :conflicting_id, :integer         # Hidden 
  #     configure :import_text, :string 
  #     configure :number, :string 
  #     configure :data_import_swimmer_id, :integer 
  #     configure :data_import_team_id, :integer 
  #     configure :data_import_season_id, :integer 
  #     configure :swimmer_id, :integer         # Hidden 
  #     configure :team_id, :integer         # Hidden 
  #     configure :season_id, :integer         # Hidden 
  #     configure :category_type_id, :integer         # Hidden 
  #     configure :accreditation_time_type_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  DataImportCity  ###

  # config.model 'DataImportCity' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your data_import_city.rb model definition

  #   # Found associations:
  #     configure :data_import_session, :belongs_to_association 
  #     configure :city, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :data_import_session_id, :integer         # Hidden 
  #     configure :conflicting_id, :integer         # Hidden 
  #     configure :import_text, :string 
  #     configure :name, :string 
  #     configure :zip, :string 
  #     configure :area, :string 
  #     configure :country, :string 
  #     configure :country_code, :string 
  #     configure :user_id, :integer         # Hidden 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  DataImportMeeting  ###

  # config.model 'DataImportMeeting' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your data_import_meeting.rb model definition

  #   # Found associations:
  #     configure :data_import_session, :belongs_to_association 
  #     configure :meeting, :belongs_to_association 
  #     configure :season, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :season_type, :has_one_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :data_import_session_id, :integer         # Hidden 
  #     configure :conflicting_id, :integer         # Hidden 
  #     configure :import_text, :string 
  #     configure :description, :string 
  #     configure :entry_deadline, :date 
  #     configure :has_warm_up_pool, :boolean 
  #     configure :is_under_25_admitted, :boolean 
  #     configure :reference_phone, :string 
  #     configure :reference_e_mail, :string 
  #     configure :reference_name, :string 
  #     configure :notes, :text 
  #     configure :tag, :string 
  #     configure :has_invitation, :boolean 
  #     configure :has_start_list, :boolean 
  #     configure :are_results_acquired, :boolean 
  #     configure :max_individual_events, :integer 
  #     configure :configuration_file, :string 
  #     configure :challenge_number, :integer 
  #     configure :data_import_season_id, :integer 
  #     configure :season_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  DataImportMeetingIndividualResult  ###

  # config.model 'DataImportMeetingIndividualResult' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your data_import_meeting_individual_result.rb model definition

  #   # Found associations:
  #     configure :data_import_session, :belongs_to_association 
  #     configure :meeting_individual_result, :belongs_to_association 
  #     configure :data_import_meeting_program, :belongs_to_association 
  #     configure :meeting_program, :belongs_to_association 
  #     configure :category_type, :belongs_to_association 
  #     configure :result_type, :belongs_to_association 
  #     configure :data_import_swimmer, :belongs_to_association 
  #     configure :data_import_team, :belongs_to_association 
  #     configure :data_import_badge, :belongs_to_association 
  #     configure :swimmer, :belongs_to_association 
  #     configure :team, :belongs_to_association 
  #     configure :badge, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :data_import_session_id, :integer         # Hidden 
  #     configure :conflicting_id, :integer         # Hidden 
  #     configure :import_text, :string 
  #     configure :athlete_name, :string 
  #     configure :team_name, :string 
  #     configure :athlete_badge_number, :string 
  #     configure :team_badge_number, :string 
  #     configure :year_of_birth, :integer 
  #     configure :rank, :integer 
  #     configure :is_play_off, :boolean 
  #     configure :is_out_of_race, :boolean 
  #     configure :is_disqualified, :boolean 
  #     configure :standard_points, :decimal 
  #     configure :meeting_points, :decimal 
  #     configure :minutes, :integer 
  #     configure :seconds, :integer 
  #     configure :hundreds, :integer 
  #     configure :data_import_meeting_program_id, :integer         # Hidden 
  #     configure :meeting_program_id, :integer         # Hidden 
  #     configure :category_type_id, :integer         # Hidden 
  #     configure :result_type_id, :integer         # Hidden 
  #     configure :data_import_swimmer_id, :integer         # Hidden 
  #     configure :data_import_team_id, :integer         # Hidden 
  #     configure :data_import_badge_id, :integer         # Hidden 
  #     configure :swimmer_id, :integer         # Hidden 
  #     configure :team_id, :integer         # Hidden 
  #     configure :badge_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  DataImportMeetingProgram  ###

  # config.model 'DataImportMeetingProgram' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your data_import_meeting_program.rb model definition

  #   # Found associations:
  #     configure :data_import_session, :belongs_to_association 
  #     configure :meeting_program, :belongs_to_association 
  #     configure :data_import_meeting_session, :belongs_to_association 
  #     configure :meeting_session, :belongs_to_association 
  #     configure :event_type, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :data_import_session_id, :integer         # Hidden 
  #     configure :conflicting_id, :integer         # Hidden 
  #     configure :import_text, :string 
  #     configure :event_order, :integer 
  #     configure :begin_time, :time 
  #     configure :data_import_meeting_session_id, :integer         # Hidden 
  #     configure :meeting_session_id, :integer         # Hidden 
  #     configure :event_type_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  DataImportMeetingSession  ###

  # config.model 'DataImportMeetingSession' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your data_import_meeting_session.rb model definition

  #   # Found associations:
  #     configure :data_import_session, :belongs_to_association 
  #     configure :meeting_session, :belongs_to_association 
  #     configure :data_import_meeting, :belongs_to_association 
  #     configure :meeting, :belongs_to_association 
  #     configure :swimming_pool, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :data_import_session_id, :integer         # Hidden 
  #     configure :conflicting_id, :integer         # Hidden 
  #     configure :import_text, :string 
  #     configure :session_order, :integer 
  #     configure :scheduled_date, :date 
  #     configure :warm_up_time, :time 
  #     configure :begin_time, :time 
  #     configure :notes, :text 
  #     configure :data_import_meeting_id, :integer         # Hidden 
  #     configure :meeting_id, :integer         # Hidden 
  #     configure :swimming_pool_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  DataImportSeason  ###

  # config.model 'DataImportSeason' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your data_import_season.rb model definition

  #   # Found associations:
  #     configure :dataimport_session, :belongs_to_association 
  #     configure :season, :belongs_to_association 
  #     configure :season_type, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :data_import_session_id, :integer         # Hidden 
  #     configure :conflicting_id, :integer         # Hidden 
  #     configure :import_text, :string 
  #     configure :description, :string 
  #     configure :begin_date, :date 
  #     configure :end_date, :date 
  #     configure :must_use_time_standards, :boolean 
  #     configure :max_points, :integer 
  #     configure :season_type_id, :integer         # Hidden 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  DataImportSession  ###

  # config.model 'DataImportSession' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your data_import_session.rb model definition

  #   # Found associations:
  #     configure :data_import_swimmers, :has_many_association 
  #     configure :data_import_teams, :has_many_association 
  #     configure :data_import_badges, :has_many_association 
  #     configure :data_import_cities, :has_many_association 
  #     configure :data_import_seasons, :has_many_association 
  #     configure :data_import_meetings, :has_many_association 
  #     configure :data_import_meeting_sessions, :has_many_association 
  #     configure :data_import_meeting_programs, :has_many_association 
  #     configure :data_import_meeting_individual_results, :has_many_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :file_name, :string 
  #     configure :source_data, :text 
  #     configure :phase, :integer 
  #     configure :user_id, :integer 
  #     configure :total_data_rows, :integer 
  #     configure :file_format, :string 
  #     configure :phase_1_log, :text 
  #     configure :phase_2_log, :text 
  #     configure :phase_3_log, :text 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  DataImportSwimmer  ###

  # config.model 'DataImportSwimmer' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your data_import_swimmer.rb model definition

  #   # Found associations:
  #     configure :data_import_session, :belongs_to_association 
  #     configure :swimmer, :belongs_to_association 
  #     configure :gender_type, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :data_import_session_id, :integer         # Hidden 
  #     configure :conflicting_id, :integer         # Hidden 
  #     configure :import_text, :string 
  #     configure :last_name, :string 
  #     configure :first_name, :string 
  #     configure :year_of_birth, :integer 
  #     configure :gender_type_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  DataImportTeam  ###

  # config.model 'DataImportTeam' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your data_import_team.rb model definition

  #   # Found associations:
  #     configure :data_import_session, :belongs_to_association 
  #     configure :team, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :data_import_session_id, :integer         # Hidden 
  #     configure :conflicting_id, :integer         # Hidden 
  #     configure :import_text, :string 
  #     configure :name, :string 
  #     configure :cities_id, :integer 
  #     configure :user_id, :integer         # Hidden 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  EventType  ###

  config.model 'EventType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your event_type.rb model definition

  #   # Found associations:
  #     configure :stroke_type, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :length_in_meters, :integer 
  #     configure :stroke_type_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :i18n_description     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  EventsByPoolType  ###

  # config.model 'EventsByPoolType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your events_by_pool_type.rb model definition

  #   # Found associations:
  #     configure :pool_type, :belongs_to_association 
  #     configure :event_type, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :pool_type_id, :integer         # Hidden 
  #     configure :event_type_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  FederationType  ###

  config.model 'FederationType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your federation_type.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :description, :string 
  #     configure :short_name, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :short_name    # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  GenderType  ###

  config.model 'GenderType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your gender_type.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :i18n_short   # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  HairDryerType  ###

  config.model 'HairDryerType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your hair_dryer_type.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :i18n_description   # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  IndividualAccreditation  ###

  # config.model 'IndividualAccreditation' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your individual_accreditation.rb model definition

  #   # Found associations:
  #     configure :meeting_program, :belongs_to_association 
  #     configure :badge, :belongs_to_association 
  #     configure :accreditation_time_type, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :swimmer, :has_one_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :minutes, :integer 
  #     configure :seconds, :integer 
  #     configure :hundreds, :integer 
  #     configure :notes, :text 
  #     configure :meeting_program_id, :integer         # Hidden 
  #     configure :badge_id, :integer         # Hidden 
  #     configure :accreditation_time_type_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  LockerCabinetType  ###

  config.model 'LockerCabinetType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your locker_cabinet_type.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :i18n_description  # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Meeting  ###

  # config.model 'Meeting' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your meeting.rb model definition

  #   # Found associations:
  #     configure :season, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :season_type, :has_one_association 
  #     configure :meeting_sessions, :has_many_association 
  #     configure :meeting_programs, :has_many_association 
  #     configure :meeting_individual_results, :has_many_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :description, :string 
  #     configure :entry_deadline, :date 
  #     configure :has_warm_up_pool, :boolean 
  #     configure :is_under_25_admitted, :boolean 
  #     configure :reference_phone, :string 
  #     configure :reference_e_mail, :string 
  #     configure :reference_name, :string 
  #     configure :notes, :text 
  #     configure :has_invitation, :boolean 
  #     configure :has_start_list, :boolean 
  #     configure :are_results_acquired, :boolean 
  #     configure :max_individual_events, :integer 
  #     configure :configuration_file, :string 
  #     configure :challenge_number, :integer 
  #     configure :season_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  MeetingIndividualResult  ###

  # config.model 'MeetingIndividualResult' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your meeting_individual_result.rb model definition

  #   # Found associations:
  #     configure :meeting_program, :belongs_to_association 
  #     configure :category_type, :belongs_to_association 
  #     configure :result_type, :belongs_to_association 
  #     configure :swimmer, :belongs_to_association 
  #     configure :team, :belongs_to_association 
  #     configure :badge, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :pool_type, :has_one_association 
  #     configure :season_type, :has_one_association 
  #     configure :event_type, :has_one_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :athlete_name, :string 
  #     configure :team_name, :string 
  #     configure :athlete_badge_number, :string 
  #     configure :team_badge_number, :string 
  #     configure :year_of_birth, :integer 
  #     configure :rank, :integer 
  #     configure :is_play_off, :boolean 
  #     configure :is_out_of_race, :boolean 
  #     configure :is_disqualified, :boolean 
  #     configure :standard_points, :decimal 
  #     configure :meeting_points, :decimal 
  #     configure :minutes, :integer 
  #     configure :seconds, :integer 
  #     configure :hundreds, :integer 
  #     configure :meeting_program_id, :integer         # Hidden 
  #     configure :category_type_id, :integer         # Hidden 
  #     configure :result_type_id, :integer         # Hidden 
  #     configure :swimmer_id, :integer         # Hidden 
  #     configure :team_id, :integer         # Hidden 
  #     configure :badge_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  MeetingProgram  ###

  # config.model 'MeetingProgram' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your meeting_program.rb model definition

  #   # Found associations:
  #     configure :meeting_session, :belongs_to_association 
  #     configure :event_type, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :pool_type, :has_one_association 
  #     configure :season_type, :has_one_association 
  #     configure :meeting_individual_results, :has_many_association 
  #     configure :teams, :has_many_association 
  #     configure :badges, :has_many_association 
  #     configure :swimmers, :has_many_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :event_order, :integer 
  #     configure :begin_time, :datetime 
  #     configure :meeting_session_id, :integer         # Hidden 
  #     configure :event_type_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  MeetingSession  ###

  # config.model 'MeetingSession' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your meeting_session.rb model definition

  #   # Found associations:
  #     configure :meeting, :belongs_to_association 
  #     configure :swimming_pool, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :pool_type, :has_one_association 
  #     configure :season_type, :has_one_association 
  #     configure :meeting_programs, :has_many_association 
  #     configure :meeting_individual_results, :has_many_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :session_order, :integer 
  #     configure :scheduled_date, :date 
  #     configure :warm_up_datetime, :datetime 
  #     configure :begin_datetime, :datetime 
  #     configure :notes, :text 
  #     configure :meeting_id, :integer         # Hidden 
  #     configure :swimming_pool_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  OberCup  ###

  # config.model 'OberCup' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your ober_cup.rb model definition

  #   # Found associations:
  #     configure :team, :belongs_to_association 
  #     configure :ober_cup_standards, :has_many_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :description, :string 
  #     configure :year, :integer 
  #     configure :max_points, :integer 
  #     configure :team_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  OberCupStandard  ###

  # config.model 'OberCupStandard' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your ober_cup_standard.rb model definition

  #   # Found associations:
  #     configure :ober_cup, :belongs_to_association 
  #     configure :badge, :belongs_to_association 
  #     configure :event_type, :belongs_to_association 
  #     configure :pool_type, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :minutes, :integer 
  #     configure :seconds, :integer 
  #     configure :hundreds, :integer 
  #     configure :ober_cup_id, :integer         # Hidden 
  #     configure :badge_id, :integer         # Hidden 
  #     configure :event_type_id, :integer         # Hidden 
  #     configure :pool_type_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Passage  ###

  # config.model 'Passage' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your passage.rb model definition

  #   # Found associations:
  #     configure :meeting_program, :belongs_to_association 
  #     configure :badge, :belongs_to_association 
  #     configure :passage_type, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :swimmer, :has_one_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :minutes, :integer 
  #     configure :seconds, :integer 
  #     configure :hundreds, :integer 
  #     configure :meeting_program_id, :integer         # Hidden 
  #     configure :badge_id, :integer         # Hidden 
  #     configure :passage_type_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  PassageType  ###

  config.model 'PassageType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your passage_type.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :length_in_meters, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :i18n_description     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  PoolType  ###

  config.model 'PoolType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your pool_type.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :length_in_meters, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
       object_label_method :i18n_short     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  PresenceType  ###

  config.model 'PresenceType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your presence_type.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :value, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :i18n_description  # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  RelayType  ###

  config.model 'RelayType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your relay_type.rb model definition

  #   # Found associations:
  #     configure :stroke_type, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :mixed_gender, :integer 
  #     configure :partecipants, :integer 
  #     configure :phases, :integer 
  #     configure :phase_length_in_meters, :integer 
  #     configure :stroke_type_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :i18n_short     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  ResultType  ###

  config.model 'ResultType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your result_type.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :default_value, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :i18n_description     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Season  ###

  config.model 'Season' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your season.rb model definition

  #   # Found associations:
  #     configure :season_type, :belongs_to_association 
  #     configure :meetings, :has_many_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :description, :string 
  #     configure :begin_date, :date 
  #     configure :end_date, :date 
  #     configure :must_use_time_standards, :boolean 
  #     configure :max_points, :integer 
  #     configure :season_type_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :description     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  SeasonType  ###

  config.model 'SeasonType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your season_type.rb model definition

  #   # Found associations:
  #     configure :federation_type, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :description, :string 
  #     configure :short_name, :string 
  #     configure :federation_type_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :short_name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Session  ###

  # config.model 'Session' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your session.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :session_id, :string 
  #     configure :data, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  ShowerType  ###

  config.model 'ShowerType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your shower_type.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :i18n_short     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  StrokeType  ###

  config.model 'StrokeType' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your stroke_type.rb model definition

  #   # Found associations:

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :code, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
      object_label_method :i18n_short     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end


  ###  Swimmer  ###

  # config.model 'Swimmer' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your swimmer.rb model definition

  #   # Found associations:
  #     configure :gender_type, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :associated_user, :has_one_association 
  #     configure :badges, :has_many_association 
  #     configure :teams, :has_many_association 
  #     configure :meeting_individual_results, :has_many_association 
  #     configure :swimmer_results, :has_many_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :last_name, :string 
  #     configure :first_name, :string 
  #     configure :year_of_birth, :integer 
  #     configure :phone_mobile, :string 
  #     configure :phone_number, :string 
  #     configure :e_mail, :string 
  #     configure :nickname, :string 
  #     configure :associated_user_id, :integer 
  #     configure :gender_type_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  SwimmerResult  ###

  # config.model 'SwimmerResult' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your swimmer_result.rb model definition

  #   # Found associations:
  #     configure :swimmer, :belongs_to_association 
  #     configure :badge, :belongs_to_association 
  #     configure :meeting_program, :belongs_to_association 
  #     configure :season_type, :belongs_to_association 
  #     configure :category_type, :belongs_to_association 
  #     configure :result_type, :belongs_to_association 
  #     configure :pool_type, :belongs_to_association 
  #     configure :meeting_individual_result, :belongs_to_association 
  #     configure :user, :belongs_to_association 
  #     configure :event_type, :has_one_association 
  #     configure :meeting_session, :has_one_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :standard_points, :decimal 
  #     configure :obercup_points, :decimal 
  #     configure :rank, :integer 
  #     configure :is_disqualified, :boolean 
  #     configure :minutes, :integer 
  #     configure :seconds, :integer 
  #     configure :hundreds, :integer 
  #     configure :swimmer_id, :integer         # Hidden 
  #     configure :badge_id, :integer         # Hidden 
  #     configure :meeting_program_id, :integer         # Hidden 
  #     configure :season_type_id, :integer         # Hidden 
  #     configure :category_type_id, :integer         # Hidden 
  #     configure :result_type_id, :integer         # Hidden 
  #     configure :pool_type_id, :integer         # Hidden 
  #     configure :meeting_individual_result_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  SwimmingPool  ###

  # config.model 'SwimmingPool' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your swimming_pool.rb model definition

  #   # Found associations:
  #     configure :city, :belongs_to_association 
  #     configure :pool_type, :belongs_to_association 
  #     configure :shower_type, :belongs_to_association 
  #     configure :hair_dryer_type, :belongs_to_association 
  #     configure :locker_cabinet_type, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :name, :string 
  #     configure :address, :string 
  #     configure :nick_name, :string 
  #     configure :phone_number, :string 
  #     configure :fax_number, :string 
  #     configure :e_mail, :string 
  #     configure :contact_name, :string 
  #     configure :maps_uri, :string 
  #     configure :lanes_number, :integer 
  #     configure :has_multiple_pools, :boolean 
  #     configure :has_open_area, :boolean 
  #     configure :has_bar, :boolean 
  #     configure :has_restaurant_service, :boolean 
  #     configure :has_gym_area, :boolean 
  #     configure :has_children_area, :boolean 
  #     configure :notes, :text 
  #     configure :city_id, :integer         # Hidden 
  #     configure :pool_type_id, :integer         # Hidden 
  #     configure :shower_type_id, :integer         # Hidden 
  #     configure :hair_dryer_type_id, :integer         # Hidden 
  #     configure :locker_cabinet_type_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  SwimmingPoolReview  ###

  # config.model 'SwimmingPoolReview' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your swimming_pool_review.rb model definition

  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :swimming_pool, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :title, :string 
  #     configure :entry_text, :text 
  #     configure :user_id, :integer         # Hidden 
  #     configure :swimming_pool_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Tag  ###

  # config.model 'Tag' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your tag.rb model definition

  #   # Found associations:
  #     configure :user, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :name, :string 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Tag4Entity  ###

  # config.model 'Tag4Entity' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your tag4_entity.rb model definition

  #   # Found associations:
  #     configure :tag, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :entity_name, :string 
  #     configure :entity_id, :integer 
  #     configure :tag_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Team  ###

  # config.model 'Team' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your team.rb model definition

  #   # Found associations:
  #     configure :city, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :name, :string 
  #     configure :address, :string 
  #     configure :phone_mobile, :string 
  #     configure :phone_number, :string 
  #     configure :fax_number, :string 
  #     configure :e_mail, :string 
  #     configure :contact_name, :string 
  #     configure :notes, :text 
  #     configure :city_id, :integer         # Hidden 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  TimeStandard  ###

  # config.model 'TimeStandard' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your time_standard.rb model definition

  #   # Found associations:
  #     configure :season, :belongs_to_association 
  #     configure :gender_type, :belongs_to_association 
  #     configure :pool_type, :belongs_to_association 
  #     configure :event_type, :belongs_to_association 
  #     configure :category_type, :belongs_to_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :minutes, :integer 
  #     configure :seconds, :integer 
  #     configure :hundreds, :integer 
  #     configure :season_id, :integer         # Hidden 
  #     configure :gender_type_id, :integer         # Hidden 
  #     configure :pool_type_id, :integer         # Hidden 
  #     configure :event_type_id, :integer         # Hidden 
  #     configure :category_type_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  User  ###

  # config.model 'User' do
  #   # You can copy this to a 'rails_admin do ... end' block inside your user.rb model definition

  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :swimmer, :has_one_association 
  #     configure :badge, :has_one_association 

  #   # Found columns:
  #     configure :id, :integer 
  #     configure :lock_version, :integer 
  #     configure :name, :string 
  #     configure :description, :string 
  #     configure :hashed_pwd, :string 
  #     configure :salt, :string 
  #     configure :authorization_level, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :swimmer_id, :integer 
  #     configure :badge_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :confirmation_token, :string 
  #     configure :confirmed_at, :datetime 
  #     configure :confirmation_sent_at, :datetime 
  #     configure :unconfirmed_email, :string 
  #     configure :failed_attempts, :integer 
  #     configure :unlock_token, :string 
  #     configure :locked_at, :datetime 

  #   # Cross-section configuration:
  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:
  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end

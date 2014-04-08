class AddAuthenticationTokenToUsers < ActiveRecord::Migration
    def change
        change_table :users do |t|
            # [Steve] This will be used only for API logins via JSON request;
            # standard HTTP/HTTPS request will go through the usual session registration
            # process using the session table.
            t.string  :authentication_token
            t.integer :outstanding_goggle_score_bias,   :null => false, :default => 800
            t.integer :outstanding_standard_score_bias, :null => false, :default => 800
        end
        add_index  :users, :authentication_token, :unique => true
    end
end

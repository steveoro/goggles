# encoding: utf-8


=begin

= SessionsController

  - version:  4.00.339.20140707
  - author:   Steve A.

=end
class SessionsController < Devise::SessionsController

  # TODO Add here future OmniAuth customizations

  # def create
    # resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
    # set_flash_message(:notice, :signed_in) if is_navigational_format?
    # sign_in(resource_name, resource)
# 
    # respond_to do |format|
      # format.html do
        # respond_with resource, location: redirect_location(resource_name, resource)
      # end
# 
      # format.json do
        # render json: { response: 'ok', token: current_user.authentication_token }.to_json, status: :ok
      # end
    # end
  # end

end

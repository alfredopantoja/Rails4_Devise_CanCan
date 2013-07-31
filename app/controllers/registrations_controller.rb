class RegistrationsController < Devise::RegistrationsController

  protected
    def after_sign_up_path_for(resource)
      resource
    end  

    def after_update_path_for(resource)
      resource
    end  
end    

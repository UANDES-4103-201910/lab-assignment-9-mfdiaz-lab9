class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
          new_user = User.new(registration_params)
          if new_user.save
            flash[:notice] = "User created successfully"
            redirect_to login_form_path
          else
            error_message = ""
            new_user.errors.full_messages.each do |message|
              error_message += message + ". "
            end
            flash[:notice] = "User creation failed: " + error_message
            redirect_to sign_in_url
          end
	end

  private

    def registration_params
      params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
    end
end

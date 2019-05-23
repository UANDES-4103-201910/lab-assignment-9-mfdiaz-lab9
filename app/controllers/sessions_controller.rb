class SessionsController < ApplicationController
	def new
	end

	def create
	  user = User.find_by({email: session_params[:email]})
          if user != nil && user.valid_password?(session_params[:password])
            session[:current_user_id] = user.id
            flash[:notice] = "Login successful"
            redirect_to root_path
          else
            flash[:notice] = "Incorrect email or password"
            redirect_to login_form_path
          end
	end

	def destroy
          session[:current_user_id] = nil
	  redirect_to root_path
	end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end

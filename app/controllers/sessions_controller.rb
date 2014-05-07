class SessionsController < ApplicationController
	def new
	end
	
	def create
	  user = User.authenticate(params[:username], params[:password])
	  if user
	    session[:user_id] = user.id
	    redirect_to home_path, notice: "You are logged into the chess camp system"
	  else
	    flash.now[:alert] = "Username or password is invalid"
	    render action: 'new'
	  end
	end
	
	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, notice: "Logged out!"
	end
end
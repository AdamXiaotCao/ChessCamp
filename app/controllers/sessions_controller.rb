class SessionsController < ApplicationController
	def new
	end
	# def show
	# 	date= Chonic.parse(session[:start_date])
	# 	@result=[]
	# 	@all_camps = Camp.all.to_a
	# 	if @all_camps
	# 		@all_camps.each do |c| 
	# 		if (date.1.year.since<c.start_date) && (date.1.year.from_now > c.start_date)
	# 			@result.push(c)
	# 		end
	# 	end
	# end

	# end

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

class HomeController < ApplicationController
  def index
    
    	@some_upcoming_camps = Camp.upcoming.active.chronological.limit(5).to_a

   if logged_in? && current_user.role=="instructor"
      Instructor.all.to_a.each do |i| 
        if (i.id == current_user.instructor_id)
          @instructor=i
        end
       end 
       @upcoming_camps = @instructor.camps.upcoming.chronological if !@instructor.nil?
       @past_camps = @instructor.camps.past.chronological if !@instructor.nil?
       @user = @instructor.user if !@instructor.nil?
   end


   if logged_in? && current_user.role =="admin"
   end

  end

  def about
  end

  def privacy
  end

  def contact
  end

end

class HomeController < ApplicationController
  def home
    
    	@upcoming_camps = Camp.upcoming.active.chronological.limit(5).to_a

    	# if @current_user.role('Instructor')
    		
    	# elsif (@current_user.role('Administrator'))
    	# 	# given camp, list all payments recieved
    	# 	# list all payments for a particular family for particular year
    	# 	# list camp for a givnen year and the total amount of payments recieved 
    	# end


      # get my projects
      # @projects = current_user.projects.alphabetical.to_a
      # project_ids = @projects.map(&:id)
      
      # # get my incomplete tasks
      # @incomplete_tasks = Task.by_priority.incomplete.map{|task| task if project_ids.include?(task.project_id)}
      
      # # get my completed tasks
      # @completed_tasks = Task.by_name.completed.map {|task| task if project_ids.include?(task.project_id) }
   if logged_in?
   end
  end

  def about
  end

  def privacy
  end

  def contact
  end

end

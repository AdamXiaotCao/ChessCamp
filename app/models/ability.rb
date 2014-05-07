class Ability
include CanCan::Ability
  
  def initialize(user)
    # set user to new User if not logged in
    user ||= User.new # i.e., a guest user
    
    # set authorizations for different user roles
    if user.role? :admin
      # they get to do it all
      can :manage, :all
      
    elsif user.role? :instructor
      # can see a list of all users
      can :index, User
      
      # they can read their own profile
      can :show, User do |u|  
        u.id == user.id
      end
      # they can update their own profile
      can :update, User do |u|  
        u.id == user.id
      end
      
      # they can read their own instructor' data
      can :read, Instructor do |instructor|  
        instructor.id == user.instructor_id
      end

      can :update, Instructor do |instructor|  
        instructor.id = user.instructor_id
      end

      # they can read their camp
      can :read, Camp do |this_camp|
        camps = user.instructor.camps
        camps.include? this_camp
      end
              
      # they can read their students
      can :read, Student do |this_student|  
        students = user.instructor.camps.map{|c| c.students.map(&:id)}.flatten
        students.include? this_student.id
      end

    else
      # guests can only read domains covered (plus home pages)
      can :read, Camp
    end
  end
end
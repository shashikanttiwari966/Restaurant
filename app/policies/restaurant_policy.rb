class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def create?
      @user.writer? # a writer is able to create a post
    end
   
    def edit?
      @user.writer? # a writer is able to edit a post
    end
   
    def update?
      @user.writer? # a writer can update a post
    end
   
    def delete?
      @user.writer? # a writer can delete a post
    end
  end
end

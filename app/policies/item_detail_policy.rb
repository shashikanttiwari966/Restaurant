class ItemDetailPolicy < ApplicationPolicy
  class Scope < Scope
    def create?
      @user.admin? # a writer is able to create a post
    end
   
    def edit?
      @user.admin? # a writer is able to edit a post
    end
   
    def update?
      @user.admin? # a writer can update a post
    end
   
    def delete?
      @user.admin? # a writer can delete a post
    end
  end
end

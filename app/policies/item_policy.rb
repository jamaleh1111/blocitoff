Class ItemPolicy < ApplicationPolicy
  
  def destroy?
    user.present?
  end 
end 
 class CommentPolicy < ApplicationPolicy
 
  def new
    user.present?
  end
 end
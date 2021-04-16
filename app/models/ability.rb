# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, :all if user.admin?

    if user.persisted? # logged in
      can :read, :all

      can :create, Post
      can :create, Like
      can :create, Comment

      can %i[destroy update], Post, user_id: user.id
      can %i[destroy update], Comment, user_id: user.id
      can %i[destroy], Like, user_id: user.id
    end
  end
end

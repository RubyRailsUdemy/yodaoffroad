class Ability
  include CanCan::Ability

  def initialize(user)
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    user ||= User.new #guest user
    
    alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :create, :read, :to => :author
    
    if user.role == "admin"
      can :manage, :all
    elsif user.role == "moderator"
      can :crud, [Article, Category, User, Comment]
      cannot :destroy, [Category]
      cannot :create, :destroy, [User]
    elsif user.role == "author"
      can :author, [Article]
    else
      can :read, :all
    end
  end
end

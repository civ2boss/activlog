class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # Guest user
    if user
      can :manage, :all
    else
      can :read, :all
      can :create, Log
    end
  end
end
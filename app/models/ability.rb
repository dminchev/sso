class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, User, :id => user.id
    
    if user.is_admin?
      can :manage, :all
    else
      can :read, User
    end
  end
end

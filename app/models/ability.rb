class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Category, user_id: user.id
    can :read, :create, Transaction, user_id: user.id
    can :Detroy, Category, user_id: user.id
    can :manage, Category, user_id: user.id
  end
end

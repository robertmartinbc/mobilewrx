class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_role? :admin
      can :manage, :all
    end

    if user.has_role? :platinum
      can :view, :platinum
      can :manage, Promotion, :user_id => user.id
    end

    if user.has_role? :silver
      can :view, :silver
      can :manage, Promotion, :user_id => user.id
    end

    if user.has_role? :gold
      can :view, :gold
      can :manage, Promotion, :user_id => user.id
    end

    if user.has_role? :standard
      can :view, :standard
    end

    if user.has_role? :premium
      can :view, :premium
    end

    if user.has_role? :vip
      can :view, :vip
    end

    can :read, :all
  end
end

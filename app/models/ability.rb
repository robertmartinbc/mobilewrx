class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :view, :silver if user.has_role? :silver
      can :view, :gold if user.has_role? :gold
      can :view, :platinum if user.has_role? :platinum
      can :view, :standard if user.has_role? :standard
      can :view, :premium if user.has_role? :premium
      can :view, :vip if user.has_role? :vip
    end
  end
end

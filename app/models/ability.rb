class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.is? :admin
        can :execute, Intent
    elsif user.is? :super
        can :execute, Intent
    elsif user.is? :regular
        can :execute, Intent
    elsif user.is? :guest
        cannot :execute, Intent
    end
  end
end

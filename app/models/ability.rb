class Ability
  include CanCan::Ability

  def initialize(user, num_queries)

    user ||= User.new

    if user.is? :admin
      can :execute, Intent
    elsif user.is? :super
      can :execute, Intent do |intent|
        intent.is_executable_by? :super
      end
    elsif user.is? :regular
      can :execute, Intent do |intent|
        intent.is_executable_by? :regular
      end
    elsif user.is? :guest and num_queries <= 10
      can :execute, Intent do |intent|
        intent.is_executable_by?(:guest)
      end
    end
  end
end

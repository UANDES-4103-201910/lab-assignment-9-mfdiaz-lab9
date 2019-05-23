# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Ticket
    can :read, Event
    if user.registered?
      can :buy, Ticket 
      if user.admin?
        can :manage, :all
      end
    end
  end

end

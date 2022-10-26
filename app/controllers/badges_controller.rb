class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def my
    @badges = current_user.badges.group('id')
    render 'index'
  end
end

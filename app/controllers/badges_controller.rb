class BadgesController < ApplicationController

  def user_index
    @badges = current_user.badges.length
  end

  def index
    @badges = Badge.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

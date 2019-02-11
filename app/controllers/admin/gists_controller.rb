class Admin::GistsController < ApplicationController
  def index
    @gists = Gist.all
  end
end

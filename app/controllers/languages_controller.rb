class LanguagesController < ApplicationController
  def index
  end

  def all
  	render json: @alllanguages
  end

  def enabled
  	render json: @enabledlabuages
  end
end

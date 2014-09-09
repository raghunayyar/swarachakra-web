class LanguagesController < ApplicationController
  def index
  end

  def all
  end

  def enabled
  	@data = CSV.read("uploads/languages/malayalamLayout.csv")
  	render json: @data
  end
end

class LanguagesController < ApplicationController
  def index
  end

  def all
  end

  def enabled
    enabledlanguages = {
      :id => "32",
      :name => "hindi"
    }
    CSV.foreach("uploads/languages/malayalamLayout.csv") do |row|
      enabledlanguages[:csv] = [
        {
          :keycode => row[0],
          :unicode => row[1],
          :chakra => row[2]
        }
      ]
      puts enabledlanguages[:csv]
    end
    @data = JSON.pretty_generate(enabledlanguages)
    render json: @data
  end
end

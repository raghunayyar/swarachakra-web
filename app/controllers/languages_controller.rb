class LanguagesController < ApplicationController
  
  def index
  end

  def all
    alllanguages = {
      :id => "32",
      :name => "hindi",
      :csv => []
    }

    CSV.foreach("uploads/languages/malayalamLayout.csv") do |row|
      alllanguages[:csv] << {
        :keycode => row[0],
        :unicode => row[1],
        :chakra => row[2]
      }
    end
    @data = JSON.pretty_generate(alllanguages)
    puts @data
    render json: @data 
  end

  def enabled
    enabledlanguages = {
      :id => "32",
      :name => "hindi",
      :csv => []
    }

    CSV.foreach("uploads/languages/malayalamLayout.csv") do |row|
      enabledlanguages[:csv] << {
        :keycode => row[0],
        :unicode => row[1],
        :chakra => row[2]
      }
    end
    @data = JSON.pretty_generate(enabledlanguages)
    puts @data
    render json: @data 
  end
end

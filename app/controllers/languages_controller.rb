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
    availablelanguages = {
      :languages => []
    }
    @language = Language.all.each do |eachlanguage|
      if eachlanguage.enabled
        availablelanguages[:languages] << {
          :id => eachlanguage.id,
          :name => eachlanguage.languagename,
          :csv => []
        }
        @data = JSON.pretty_generate(availablelanguages)
      end
    end
    puts @data
    render json: @data
  end
end

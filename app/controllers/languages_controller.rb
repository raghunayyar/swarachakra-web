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
    @language = Language.all.each do |eachlanguage|
      if eachlanguage.enabled
        enabledlanguages = {
          :id => eachlanguage.id,
          :name => eachlanguage.languagename,
          :csv => []
        }

        CSV.foreach(eachlanguage.path) do |row|
          enabledlanguages[:csv] << {
            :keycode => row[0],
            :unicode => row[1],
            :chakra => row[2]
          }
        end
        @data = JSON.pretty_generate(enabledlanguages)
      end
    end
    puts @data
    render json: @data
  end
end

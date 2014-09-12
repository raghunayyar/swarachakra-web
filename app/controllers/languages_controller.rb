class LanguagesController < ApplicationController
  
  def index
  end

  def all
    availablelanguages = {
      :languages => []
    }
    @language = Language.all.each do |eachlanguage|
      availablelanguages[:languages] << {
        :id => eachlanguage.id,
        :name => eachlanguage.languagename,
        :csv => []
      }
      CSV.foreach(eachlanguage.path) do |row|
        availablelanguages[:languages].each do |single|
          single[:csv] << {
            :keycode => row[0],
            :unicode => row[1],
            :chakra => row[2]
          }
        end
      end
      @data = JSON.pretty_generate(availablelanguages)
    end
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
        CSV.foreach(eachlanguage.path) do |row|
          availablelanguages[:languages].each do |single|
            single[:csv] << {
              :keycode => row[0],
              :unicode => row[1],
              :chakra => row[2]
            }
          end
        end
        @data = JSON.pretty_generate(availablelanguages)
      end
    end
    render json: @data
  end
end

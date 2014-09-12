class LanguagesController < ApplicationController
  
  def index
  end

  def all
    availablelanguages = {
      :data => []
    }
    @language = Language.all.each do |eachlanguage|
      availablelanguages[:data] << {
        :id => eachlanguage.id,
        :name => eachlanguage.languagename,
        :csv => []
      }
      CSV.foreach(eachlanguage.path) do |row|
        availablelanguages[:data].each do |single|
          single[:csv] << {
            :keycode => row[0],
            :unicode => row[1],
            :chakra => row[2]
          }
        end
      end
      @data = JSON.pretty_generate(availablelanguages[:data])
    end
    render json: @data
  end

  def enabled
    availablelanguages = {
      :data => []
    }
    @language = Language.all.each do |eachlanguage|
      if eachlanguage.enabled
        availablelanguages[:data] << {
          :id => eachlanguage.id,
          :name => eachlanguage.languagename,
          :csv => []
        }
        CSV.foreach(eachlanguage.path) do |row|
          availablelanguages[:data].each do |single|
            single[:csv] << {
              :keycode => row[0],
              :unicode => row[1],
              :chakra => row[2]
            }
          end
        end
        @data = JSON.pretty_generate(availablelanguages[:data])
      end
    end
    render json: @data
  end
end

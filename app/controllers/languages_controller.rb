class LanguagesController < ApplicationController
  def index
  end

  def all
  end

  def enabled
    # @data = CSV.read("uploads/languages/malayalamLayout.csv")
    my_json = {
      :id => "32",
      :name => "hindi",
      :csv => [
        {
           :keycode => "1",
            :unicode => "u0D15",
            :chakra => "1"
        },{
           :keycode => "1",
            :unicode => "u0D15",
            :chakra => "1"
        },{
           :keycode => "1",
            :unicode => "u0D15",
            :chakra => "1"
        }
      ]
    }
    @data = JSON.pretty_generate(my_json)
    render json: @data
  end
end

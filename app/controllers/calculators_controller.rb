class CalculatorsController < ApplicationController
  WEEKDAY_COST = 1750
  WEEKEND_COST = 2500
  
  def show; end

  def calculate

    @checkin_date = (params[:calculator][:checkin_date]).to_date
    @days = (params[:calculator][:days]).to_i

    period = Array( @checkin_date..(@checkin_date + @days.days) )
    
    @cost = period.reduce(0) { |total , day| day.on_weekday? ? total + WEEKDAY_COST : total + WEEKEND_COST }

     
  end


  private

  def calculator_params
    params.require(:calculator).permit(:checkin_date, :days)
  end
  
end

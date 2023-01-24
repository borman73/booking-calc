class CalculatorsController < ApplicationController
  WEEKDAY_COST = 1750
  WEEKEND_COST = 2500

  def show; end

  def calculate
    @form = CalculatorForm.new(calculator_params)

    @checkin_date = (params[:calculator_form][:checkin_date]).to_date
    days = (params[:calculator_form][:days]).to_i
    @checkout_date = (@checkin_date + days.days)

    period = Array(@checkin_date..@checkout_date)
    period.shift

    @cost = period.reduce(0) { |total, day| day.on_weekday? ? total + WEEKDAY_COST : total + WEEKEND_COST }

    if @form.valid?
      render(:result)
    else
      render(:errors)
    end
  end

  private

  def calculator_params
    params.require(:calculator_form).permit(:checkin_date, :days)
  end
end

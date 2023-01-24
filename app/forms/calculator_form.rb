# frozen_string_literal: true

class CalculatorForm
  include ActiveModel::Model

  attr_accessor :checkin_date, :days

  def initialize(params = {})
    super(params)
    @days = days
    @checkin_date = checkin_date
    @errors = {}
  end

  validates :checkin_date, :days, presence: true
  validate :checkin_date_valid?
  validate :days_valid?

  private

  def checkin_date_valid?
    return unless @checkin_date.to_date < Date.today

    @errors[:checkin_date_error] = 'Жизнь невозможно повернуть назад ...'
  end

  def days_valid?
    return unless @days.to_i < 1

    @errors[:days_error] = 'Минимальный срок пребывания - 1 день'
  end
end

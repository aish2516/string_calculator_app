class CalculatorsController < ApplicationController

  def index
  end

  def calculate
    input = params[:numbers] || ""
    calculator = StringCalculator.new

    negative_number = input.split(',').any? { |num| num.to_i < 0 }
    if negative_number
      render json: { error: "Negative numbers are not allowed" }, status: :unprocessable_entity
      return
    end

    begin
      result = calculator.add(input)
      render json: { result: result }, status: :ok
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end
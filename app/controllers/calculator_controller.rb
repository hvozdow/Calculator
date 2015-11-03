class CalculatorController < ApplicationController
  def show
    @@calc = Calc.new()
    @result = @@calc.result
  end

  def clear
    @@calc.clear
    renderView
  end

  def operator
    @@calc.operator(params[:op])
    renderView
  end

  def number
    @@calc.number(params[:num])
    renderView
  end

  def eval
    @@calc.eval
    renderView
  end

  def renderView
    @result = @@calc.result
    render "calculator/show"
  end
end

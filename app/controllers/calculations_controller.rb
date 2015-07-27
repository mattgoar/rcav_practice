class CalculationsController < ApplicationController
  def instructions
    render("instructions.html.erb")
  end

  def square
    @calc_type = "Square"
    number = params[:number]
    if is_number?(number)
      @results = "The square of " + number.to_s + " is " + (number.to_i ** 2).to_s + "."
    else
      @results = "You can only square a number!"
    end
    render("results.html.erb")
  end

  def square_root
    @calc_type = "Square Root"
    number = params[:number]
    stored_result = '%.2f' % (number.to_i ** 0.5)
    if is_number?(number)
      @results = "The square root of " + number.to_s + " is " + stored_result.to_s + "."
    else
      @results = "You can only square root a number!"
    end
    render("results.html.erb")
  end

  def random
    @calc_type = "Random Number"
    min = params[:min]
    max = params[:max]
    if is_number?(min) && is_number?(max)
      @results = "A random number between " + min.to_s + " and " + max.to_s + " is " + (rand(min.to_i..max.to_i)).to_s + "."
    else
      @results = "You can only enter numbers!"
    end
    render("results.html.erb")
  end

  def loan
    @calc_type = "Payment"
    int = params[:int]
    nper = params[:nper]
    val = params[:val]
    if is_number?(int) && is_number?(nper) && is_number?(val)
      effective = int.to_f/100/100/12
      periods = nper.to_i*12

      puts effective
      puts periods
      puts val

      payment = '%.2f' % (val.to_i * ( effective / (1 - (1 + effective)**-periods)))

      puts payment
      @results =
          "A " + nper.to_s + " year loan of $" + val.to_s + ", with an annual interest rate of " + (int.to_f/100).to_s + "%, requires a monthly payment of $" + payment.to_s + "."

    else
      @results = "You can only enter numbers!"
    end



    render("results.html.erb")
  end

  def is_number? string
  true if Float(string) rescue false
  end

end

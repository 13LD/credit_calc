class CreditCalc
  attr_reader :payment, :month_percent, :all_payment, :credit, :percent

  def initialize(percent, credit, term)
    @percent = percent.to_f
    @credit = [credit.to_f]
    @term = term.to_i
  end
end
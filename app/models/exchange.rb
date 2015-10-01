class Exchange < ActiveRecord::Base
  validates :recipient, presence: true
  validates :amount, presence: true

  def self.sum_exchanges
    self.all.reduce(0) {|sum, exchange| sum + exchange.amount}
  end

  def self.number_exchanges
    self.count
  end

  def self.largest_expense
    Exchange.order(:amount).first.amount
  end

  def self.expensive_company
    self.where("amount < 0").group(:recipient).order("sum(amount)").first.recipient
  end

  def self.number_exchanges_this_month
    self.where("created_at BETWEEN ? AND ?",
      Time.now.beginning_of_month, Time.now.end_of_month).count
    # month_start = Time.now.beginning_of_month.strftime("%Y-%m-%d")
    # month_end = Time.now.end_of_month.strftime("%Y-%m-%d")
    # self.where("#{month_start} < created_at < #{month_end}").count
  end

  def self.negative_balance
    if self.all.reduce(0) {|sum, exchange| sum + exchange.amount} < 0
      "You are SO irresponsible."
    end
  end

end

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

  def self.number_exchanges_this_month
    # self.where("created_at = Time.now.strftime("%m")").count
    # Time.now.strftime("%m")
    self.where("2015-09-01 > created_at > 2015-09-30").count
  end

  def self.negative_balance
    if self.all.reduce(0) {|sum, exchange| sum + exchange.amount} < 0
      "You are SO irresponsible."
    end
  end

end

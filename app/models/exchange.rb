class Exchange < ActiveRecord::Base
  validates :recipient, presence: true
  validates :amount, presence: true

  def self.sum_exchanges
    # sum = 0
    # Exchange.all.each do |e|
    #   sum += e.amount
    # end
    # sum
    # #
    # #
    self.all.reduce(0) {|sum, exchange| sum + exchange.amount}
  end

  def self.number_exchanges
    self.count
  end

  # def self.number_exchanges_this_month
  #   self.where("created_at" > "2014")
  # end



end

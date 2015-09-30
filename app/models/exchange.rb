class Exchange < ActiveRecord::Base
  validates :recipient, presence: true
  validates :amount, presence: true

  def self.sum_exchanges
    self.all.reduce(0) {|sum, exchange| sum + exchange.amount}
  end

  def self.number_exchanges
    self.count
  end

  # def self.number_exchanges_this_month
  #   self.where("created_at" > "2014")
  # end


  def self.largest_expense
    Exchange.order(:amount).first.amount
  end


#Ruby way:employees.sort_by {|e| e.salary}.first

  # end



end

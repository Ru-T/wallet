class Exchange < ActiveRecord::Base
  validates :recipient, presence: true
  validates :amount, presence: true

  def sum_exchanges
    amount.sum
  end

  def number_transactions
    self.count
  end

end

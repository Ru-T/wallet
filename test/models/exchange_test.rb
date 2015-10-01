require 'test_helper'

class ExchangeTest < ActiveSupport::TestCase

  def test_create_new_exchange
    salary = Exchange.new(recipient: "salary", amount: 5000)
    assert salary.save
    assert_raises(ArgumentError) do
      Exchange.create!(1, 2, 3)
    end
  end

  def test_sum_exchanges
    assert_equal 200.72, Exchange.sum_exchanges
  end

  def test_number_transactions
    assert_equal 4, Exchange.number_exchanges
  end

  def test_transactions_this_month
    assert_equal 2, Exchange.number_exchanges_this_month
  end

  def test_biggest_expense_ever
    assert_equal -1600.03, Exchange.largest_expense
  end

end

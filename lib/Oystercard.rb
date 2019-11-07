
class Oystercard
attr_reader :balance
MAX_BALANCE = 90
ZERO_BALANCE = 0

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Maximum balance of #{MAX_BALANCE} exceeded" if money + balance > MAX_BALANCE
    @balance += money
  end

  def deduct(money)
    # fail 'You need to top up your card for this journey' if balance - money < ZERO_BALANCE
    @balance -= money
  end
end

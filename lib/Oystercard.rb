
class Oystercard
attr_reader :balance
attr_accessor :journey


MAX_BALANCE = 90
ZERO_BALANCE = 0

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(money)
    fail "Maximum balance of #{MAX_BALANCE} exceeded" if money + balance > MAX_BALANCE
    @balance += money
  end

  def deduct(money)
    # fail 'You need to top up your card for this journey' if balance - money < ZERO_BALANCE
    @balance -= money
  end

  def in_journey?
    @journey
  end

  def touch_in
    @journey = true
  end

  def touch_out
    @journey = false
  end

end

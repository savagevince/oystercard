require './lib/Oystercard'

describe Oystercard do

  it { is_expected.to respond_to(:balance) }

  it "should have a balance" do
    expect(subject.balance).to eq 0
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }


  it "should deposit money put in by the user" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

# This code sets variable maximum_balance to the defined CONSTANT value within the class, and tests that
# increasing the balance (via top_up) by 1 introduces the error message without explicitly testing the CONSTANT value
  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAX_BALANCE
    subject.top_up maximum_balance
    expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end

  it { is_expected.to respond_to(:deduct).with(1).argument }

  it 'should allow money to be deducted from the balance' do
    subject.top_up(10)
    subject.deduct(5)
    expect(subject.balance).to eq 5
  end

  # it 'raises an error if the balance is < 0' do
  #   zero_balance = Oystercard::ZERO_BALANCE
  #   subject.deduct zero_balance
  #   expect{ subject.deduct 1 }.to raise_error 'You need to top up your card for this journey'
  # end

end

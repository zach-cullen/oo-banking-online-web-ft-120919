class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end
  
  def execute_transaction
    if valid? && @sender.balance >= @amount && @status == 'pending'
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = 'complete'
    elsif !valid?
      @status = 'Transaction rejected. Please check your account balance.'
    elsif @sender.balance < @amount
      @status = 'Insufficient funds'
    elsif @status != 'pending'
      @status = 'only one transfer'
    end
  end
end

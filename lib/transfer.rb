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
    if valid? && @status == 'pending' && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = 'complete'
    else 
      @status = 'Transaction rejected. Please check your account balance.'
    end
  end
end

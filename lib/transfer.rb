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
    case when valid? && @status == 'pending' && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = 'complete'
    else 
      case
    
    end
  end
end

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
    error_msg = 'Transaction rejected. Please check your account balance.'
    if valid? && @sender.balance >= @amount && @status == 'pending'
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = 'complete'
    elsif !valid?
      @status = 'rejected'
      error_msg
    elsif @sender.balance < @amount
      @status = 'rejected'
      error_msg
    elsif @status != 'pending'
      @status = 'only one transfer'
    end
  end
end

class BankAccount
	def initialize
		@amount_available = 0
		@loan_balance = 0
	end
	def deposit_money amount
		@amount_available += amount
	end
	def withdraw_money amount
		@amount_available -= amount
	end
	def get_balance
		puts @amount_available
		return @amount_available
	end

	def take_loan amount
		@loan_balance += amount
		@amount_available += amount
	end
	def repay_loan amount
		@loan_balance -= amount
	end
	def accrue_interest
		interest = @loan_balance * 0.06
		@loan_balance += interest
	end
	def get_outstanding_loan
		puts @loan_balance
		return @loan_balance
	end
end

boa = BankAccount.new
boa.deposit_money(500)
boa.withdraw_money(100)
boa.get_balance
boa.take_loan(500)
boa.repay_loan(400)
boa.accrue_interest
boa.get_outstanding_loan
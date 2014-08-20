class BankAccount
	def initialize
		@amount_available = 0
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
end
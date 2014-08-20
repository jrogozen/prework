class BankAccount
	attr_accessor :name
	attr_reader :amount_available

	@@deposited = 0
	@@withdrawn = 0

	@@all_banks = []

	def self.transfer_money(params = {})
		bank1 = params[:bank1]
		bank2 = params[:bank2]
		amount = params[:amount]

		bank1.withdraw_money(amount)
		bank2.deposit_money(amount)

		puts "#{bank1.name} withdrew $#{amount} and deposited it to #{bank2.name}."
		puts "#{bank1.name}'s current balance is $#{bank1.get_balance}."
		puts "#{bank2.name}'s current balance is $#{bank2.get_balance}."
	end
	def self.total_money_in_accounts
		puts "Total Lifetime Deposited: #{@@deposited}."
		puts "Total Lifetime Withdrawn: #{@@withdrawn}."

		total_money = 0
		@@all_banks.each do |bank|
			total_money += bank.amount_available
		end
		puts "Total Money in Banks: #{total_money}."
	end

	def initialize (name=nil)
		@name = name
		@amount_available = 0
		@loan_balance = 0
		@@all_banks << self
	end
	def deposit_money amount
		@amount_available += amount
		@@deposited += amount
	end
	def withdraw_money amount
		@amount_available -= amount
		@@withdrawn += amount
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

boa = BankAccount.new("Bank of America")
jp = BankAccount.new("JP Morgan")
boa.deposit_money(500)
boa.withdraw_money(100)
boa.get_balance
boa.take_loan(500)
boa.repay_loan(400)
boa.accrue_interest
boa.get_outstanding_loan
jp.deposit_money(5000)
BankAccount.transfer_money({:bank1 => jp, :bank2 => boa, :amount => 300})
BankAccount.total_money_in_accounts
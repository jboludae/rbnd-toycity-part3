class Customer
	@@customers = []
	attr_reader :name

	def initialize(options = {})
		@name = options[:name]
		add_to_customers(@name)
	end
	# FEATURE 1: I ALLOWED THE USERS TO BUY MULTIPLE PRODUCTS AT ONCE
	def purchase(*products)
		products.each { |product| Transaction.new(self, product)}
	end
	# FEATURE 2: WITH THIS FEATURE IT IS POSSIBLE TO RECOVER ALL THE TRANSACTIONS
	# FROM A SPECIFIC CUSTMOER
	def show_transactions
		return Transaction.all.select{|transaction| transaction.customer.name == self.name}
	end

	def self.all
		@@customers
	end

	def self.find_by_name(name)
		@@customers.each do |customer|
			if customer.name == name
				return customer
			end
		end
		puts "Customer does not exists"
	end

	private

	def add_to_customers(name)
		@@customers.each do |customer|
			if customer.name == name
				raise DuplicateCustomerError, "#{customer.name} already exists"
			end
		end
		@@customers << self
	end

end

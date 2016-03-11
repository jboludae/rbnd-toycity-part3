class Customer
	@@customers = []
	attr_reader :name

	def initialize(options = {})
		@name = options[:name]
		add_to_customers(@name)
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

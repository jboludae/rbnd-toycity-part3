class Transaction
	@@id = 1
	@@transactions = []
	attr_reader :customer, :product, :id

	def initialize(customer, product)
		if product.in_stock?
			@id = @@id
			@@id += 1
			@customer = customer
			@product = product
			product.decrease_stock
			add_transaction
		else
			raise OutOfStockError, "#{product.title} is out of stock"
		end
	end

	def self.all
		@@transactions
	end

	def self.find(id)
		@@transactions.each do |transaction|
			if transaction.id == id
				return transaction
			end
		end
	end

	private

	def add_transaction
		@@transactions << self
	end
end

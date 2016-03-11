class Product
	@@products = []
	attr_reader :title, :price, :stock

	def initialize(options= {})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products(@title)
	end

	def self.all
		@@products
	end

	def self.find_by_title(title)
		@@products.each do |product|
			if product.title == title
				return product
			end
		end
		puts "Product does not exist"
	end

	def self.in_stock
		return @@products.select {|item| item.in_stock?}
	end

	def in_stock?
		if @stock>0
			return true
		end
		return false
	end

	private

	def add_to_products(title)
		@@products.each do |item|
			if item.title == title
				raise  DuplicateProductError, "#{item.title} already"
			end
		end
		@@products << self
	end

end
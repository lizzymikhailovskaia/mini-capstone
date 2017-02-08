class Order < ActiveRecord::Base
  has_many :carted_products
  has_many :products, through: :carted_products
  belongs_to :users

  def calculate_totals
   subtotal = 0

    carted_products.each do |carted_product|
     subtotal += carted_product.product.price * carted_product.quantity
    end

   tax = subtotal * 0.09
   total = subtotal + tax

   update(subtotal: subtotal, tax: tax, total: total)
  end
end

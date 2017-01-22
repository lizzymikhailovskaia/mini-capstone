class ProductsController < ApplicationController

  def get_products
    @products = Product.all
    render "products.html.erb"
  end

end



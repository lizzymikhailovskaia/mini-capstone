class ProductsController < ApplicationController
    def index
        @products = Product.all
        sort_attr = params[:sort]
        sort_order = params[:sort_order] ? params[:sort_order] : 'asc'
        if sort_attr
            @products = Product.all.order(sort_attr => sort_order)
        end
    end

    def new

    end

    def create
        @product = Product.create(
        name: params["name"],
        price: params["price"],
        description: params["description"],
        image: params["image"])
        flash[:message] = "Your product has been successfully created!"
        redirect_to "/products/#{@product.id}"

    end

    def show
      @product = Product.find_by(id: params[:id])
      @supplier = @product.supplier
      @images = @product.images
    end

    def edit
        @product = Product.find_by(id: params[:id])
    end

    def update
      @product = Product.find_by(id: params[:id])
      @product.update(
       name: params[:name],
       description: params[:description],
       image: params[:image],
       price: params[:price],
       supplier_id: params[:supplier_id]
      )
    flash[:message] = "Your product has been successfully updated!"
    redirect_to "/products/#{@product.id}"
    end

    def destroy
     @product = Product.find_by(id: params[:id])
     @product.destroy
    flash[:message] = "Your product has been successfully deleted!"
    redirect_to "/"
    end

end

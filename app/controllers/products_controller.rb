class ProductsController < ApplicationController
    def index
        @products = Product.all
        sort_attr = params[:sort]
        sort_order = params[:sort_order] ? params[:sort_order] : 'asc'
        if sort_attr
            @products = Product.all.order(sort_attr => sort_order)
        end
        render "index.html.erb"
    end

    def new
        render "new.html.erb"
    end

    def create
        product = Product.create(name: params["name"], price: params["price"], description: params["description"], image: params["image"])
        flash[:message] = "Your product has been successfully created!"
        redirect_to "/products/#{product.id}"
    end

    def show
        product_id = params[:id]
        @product = Product.find_by(id:product_id)
        render "show.html.erb"
    end

    def edit
        product_id = params[:id]
        @product = Product.find_by(id:product_id)
        render "edit.html.erb"
    end

    def update
        products_id = params[:id]
        product = Product.find_by(id:products_id)
        product.update(name: params["name"], price: params["price"], description: params["description"], image: params["image"])
        product.save
        flash[:message] = "Your product has been successfully updated!"
        redirect_to "/products/#{product.id}"
    end

    def destroy
        product_id = params[:id]
        product = Product.find_by(id: product_id)
        product.destroy
        flash[:message] = "Your product has been successfully deleted!"
        redirect_to "/products"
    end

end

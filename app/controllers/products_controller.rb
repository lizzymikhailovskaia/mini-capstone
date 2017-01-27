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
        redirect_to "/products/#{product.id}"

    end

    def show
        product_id = params[:id]
        @product = Product.find_by(id:product_id)
        render "show.html.erb"
    end

    def edit
        render "edit.html.erb"
    end

    def update
        products_id = params [:id]
        product = Products.find_by(id:products_id)
        product.update(name: params["name"], price: param["price"], description: params["description"], image: params["image"])
        products.save
        flash[:message] = "Update"
        redirect_to "/products/#{product_id}"

    end

    def destroy
        product_id = params[:id]
        product = Product.find_by(id: product_id)
        product.destroy
        redirect_to "/products"
    end

end

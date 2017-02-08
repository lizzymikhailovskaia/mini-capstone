class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :search]
    def index
      if session[:count] == nil
      session[:count] = 0
      end
    session[:count] += 1
    @visit_count = session[:count]
    @products = Product.all
    if params[:category]
     @products = Category.find_by(name: params[:category]).products
    end
    sort_attr = params[:sort]
    sort_order = params[:sort_order] ? params[:sort_order] : 'asc'
      if sort_attr
        @products = Product.all.order(sort_attr => sort_order)
      end
    end

    def new
    @product = Product.new
    end

    def create
        @product = Product.create(
        name: params["name"],
        price: params["price"],
        description: params["description"],
        supplier_id: params["supplier_id"]
        )
        @product.images.create(url: params[:image], product_id: @product.id)
        if @product.save
          flash[:message] = "Your product has been successfully created!"
          redirect_to "/products/#{@product.id}"
        else
          render :new
        end
    end

  def search
   search_term = params[:search]
   #ping database to find products that are similar to search term
   @products = Product.where("title LIKE ?", "%#{search_term}%")
   render :index
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
       #image: params[:image],
       price: params[:price],
       supplier_id: params[:supplier_id]
      )
      if @product.save
        flash[:success] = "Product Updated"
        redirect_to "/products/#{@product.id}"
     else
      render :edit
     end
    end

    def destroy
     @product = Product.find_by(id: params[:id])
     @product.destroy
    flash[:message] = "Your product has been successfully deleted!"
    redirect_to "/"
    end

end

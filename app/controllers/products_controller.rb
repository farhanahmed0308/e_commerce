class ProductsController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    before_action :ability, only: [:new, :edit]
    before_action :finder_method, only: [:show, :edit, :update, :destroy]
    def show
        
    end
    def index    
        @products = Product.all
    end
    def new
        @product = Product.new
    end
    def create   
        @user = current_user
        @product = @user.products.new(set_params)
        if @product.save
            redirect_to products_path
        else
            render "new"
        end 
    end
    def edit
    end
    def update 
        if @product.update(set_params)
            redirect_to products_path
        else
            render "edit"
        end
    end
    def destroy
        if @product.destroy
            redirect_to root_path
        else
            render "destroy"
        end
    end
    private
    def ability
        redirect_to root_path unless current_user.status == "admin"
    end
    def finder_method
        @product = Product.find(params[:id])
    end
    def set_params
        params.require(:product).permit(:title, :price, :quantity, :main_image)
    end
end

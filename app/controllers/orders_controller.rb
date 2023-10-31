class OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])
    end
  
    def create
        @product = Product.find(params[:id])
        @order = current_user.orders.build(product_id: @product, order_date: Date.today)
        if @order.save
            flash[:notice] = "order successfully done"
            redirect_to root_path
        else
            render products_path
        end
    end
end

class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
        @cart_items = current_end_user.cart_items
    end
    def confirm
        @cart_items = current_end_user.cart_items
        if  params[:order][:address_option] == "0"
           @order=Order.new(order_params1)
           @order.end_user_id=current_end_user.id
           @order.shipping_name = params[:shipping_name]
           @order.shipping_address = params[:shipping_address]
           @order.shipping_number = params[:shipping_number]
           @order.shipping_price = 800
        elsif params[:order][:address_option] == "1"
            @order=Order.new(order_params1)
            @order.end_user_id=current_end_user.id
            @address = Address.find_by(post_code:params[:address_id])
            @order.shipping_address = @address.street_address
            @order.shipping_number = @address.post_code  
            @order.shipping_price = 800  
            @order.shipping_name = @address.name
        elsif params[:order][:address_option] == "2"
            @order=Order.new(order_params)
            @order.end_user_id=current_end_user.id
            @order.shipping_price = 800
        elsif
            render 'confirm' 
        end

    end
    def create
        @cart_items = current_end_user.cart_items
        if  params[:order][:address_option] == "0"
            @order=Order.new(order_params1)
            @order.end_user_id=current_end_user.id
            @order.shipping_name = params[:shipping_name]
            @order.shipping_address = params[:shipping_address]
            @order.shipping_number = params[:shipping_number]
            @order.shipping_price = 800
         elsif params[:order][:address_option] == "1"
             @order=Order.new(order_params1)
             @order.end_user_id=current_end_user.id
             @address = Address.find_by(id:params[:address_id])
             @order.shipping_name = @address.name
             @order.shipping_address = @address.street_address
             @order.shipping_number = @address.post_code  
             @order.shipping_price = 800  
         elsif params[:order][:address_option] == "2"
             @order=Order.new(order_params)
             @order.end_user_id=current_end_user.id
             @order.shipping_price = 800
         elsif
             render 'confirm' 
         end
    end
    def finish
    end
    private
    def order_params1
		params.require(:order).permit(:billing_price,:payment_method)
    end
    def order_params
        params.require(:order).permit(:billing_price,:payment_method,:shipping_address,:shipping_name,:shipping_number)
    end
end

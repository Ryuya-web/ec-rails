class Public::OrdersController < ApplicationController
    def new
        @order = Order.new
        @cart_items = current_end_user.cart_items
    end
    def confirm
        @order = Order.new(order_params)
        @cart_items = current_end_user.cart_items
        if  params[:order][:address_option] == "0"
           @order.end_user_id=current_end_user.id
           @order.shipping_name = params[:shipping_name]
           @order.shipping_address = params[:shipping_address]
           @order.shipping_number = params[:shipping_number]
           @order.shipping_price = 800
        elsif params[:order][:address_option] == "1"
            @order.end_user_id=current_end_user.id
            @address = Address.find_by(post_code:params[:address_id])
            @order.shipping_address = @address.street_address
            @order.shipping_number = @address.post_code  
            @order.shipping_price = 800  
            @order.shipping_name = @address.name
        elsif params[:order][:address_option] == "2"
            @order.end_user_id=current_end_user.id
            @order.shipping_price = 800
        elsif
            render 'confirm' 
        end

    end
    def create
        @order = Order.new(order_params)
        @order.end_user_id = current_end_user.id
        @order.save
        cart_items = current_end_user.cart_items
		cart_items.each do |cart_item|
            @order_detail = OrderDetail.new
            @order_detail.order_id = @order.id
            @order_detail.item_id = cart_item.item_id
            @order_detail.quantity = cart_item.amount
            @order_detail.include_price = (cart_item.item.tax_excluded_price * 1.1).floor
            @order_detail.save
        end
       
		cart_items.destroy_all
        redirect_to order_finish_path
    end
    def finish
    end
    private
    def order_params
        params.require(:order).permit(:billing_price,:payment_method,:shipping_address,:shipping_name,:shipping_number,:shipping_price)
    end
end

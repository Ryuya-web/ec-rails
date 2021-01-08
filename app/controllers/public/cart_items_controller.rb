class Public::CartItemsController < ApplicationController
    def index
        @cart_items = current_end_user.cart_items
    end
    def create
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.end_user_id = current_end_user.id
        if  current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
            cart_item = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
            cart_item.amount += params[:cart_item][:amount].to_i
            flash[:notice] = "Item was successfully added to cart."
            cart_item.save
            redirect_to cart_items_path
        elsif @cart_item.save
            flash[:notice] = "New Item was successfully added to cart."
            redirect_to cart_items_path
        else
            redirect_back(fallback_location: root_path)
        end
    end
    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.end_user_id = current_end_user.id
        if @cart_item.update(cart_item_params)
          redirect_to cart_items_path
        else
          render 'index'
        end
    end
    def all_destroy
        cart_item = current_end_user.cart_items
        cart_item.destroy_all
        redirect_to cart_items_path
    end
    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_items_path
    end
    
    private
        def cart_item_params
            params.require(:cart_item).permit(:item_id, :amount)
        end

end

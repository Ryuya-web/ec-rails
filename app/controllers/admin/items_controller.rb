class Admin::ItemsController < ApplicationController
    def index
        @items = Item.all
    end
    def new
        @item = Item.new
    end
    def create
        @item = Item.new(item_params)
        if @item.save
          redirect_to admin_item_path(@item)
        else
          @items = Item.all
          render 'new'
        end
      end
    private
    def item_params
        params.require(:item).permit(:genre_id, :image, :tax_excluded_price, :name, :description, :is_unsaled)
    end
    
end

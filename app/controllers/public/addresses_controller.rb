class Public::AddressesController < ApplicationController
    def index
        @addresses = Address.all
        @address = Address.new
    end
    def create
        @address = Address.new(address_params)
        @address.end_user_id = current_end_user.id
        if @address.save
          redirect_to addresses_path
        else
          @addresss = Address.all
          render 'index'
        end
    end
  
    private
    def address_params
        params.require(:address).permit(:post_code, :street_address, :name)
    end
  
end

class Admin::OrdersController < ApplicationController
def index
    @orders = Order.all

end
def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
end

def update
    @order = Order.find(params[:id]) 
    @order_details = @order.order_details #注文から紐付く商品の取得
    @order.update(order_params) #注文ステータスの更新


    if @order.order_status == "入金確認" #注文ステータスが入金確認なら下の事をする
        @order_details.update_all(make_status: 1) #製作ステータスを「製作待ちに」　更新
     end
        redirect_to  admin_order_path(@order) #注文詳細に遷移
    end

end
def order_params
    params.require(:order).permit(:order_status)
end
class Admin::OrderDetailsController < ApplicationController
    def update
		@order_detail = OrderDetail.find(params[:id]) #　特定
		@order = @order_detail.order #注文商品から注文テーブルの呼び出し（何度も呼び出すのは処理が増える為）
		@order_detail.update(order_detail_params) #　製作ステータスの更新

		if @order_detail.make_status == "製作中" 
			@order.update(order_status: 2) #注文ステータスを「製作中」　に更新

	#数が一致すれば、全ての商品の製作ステータスが「製作完了」だとわかる
		elsif @order.order_details.count ==  @order.order_details.where(make_status: "製作完了").count
			@order.update(order_status: 3) 
		end
		redirect_to admin_order_path(@order_detail.order)
	end


	private

	  def order_detail_params
      params.require(:order_detail).permit(:make_status)
      end
end

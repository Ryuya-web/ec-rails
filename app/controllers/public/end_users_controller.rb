class Public::EndUsersController < ApplicationController
  def show
    @end_user = current_end_user
  end
  def edit
    @end_user = current_end_user
  end
  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to end_user_path(@end_user)
    else
      render 'edit'
    end
  end
  def confirm
    @end_user = EndUser.find(params[:id])
  end
  def hide
    @end_user = EndUser.find(params[:id])
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @end_user.update(is_unsubscribed: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
end
  private
  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :street_address, :post_code, :phone_number, :email)
  end


end

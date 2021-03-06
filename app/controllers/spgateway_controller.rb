class SpgatewayController < ActionController::Base
  skip_before_action :verify_authenticity_token
  
  def return
    payment = Payment.find_and_process(spgateway_params)
    if payment&.save
      flash[:notice] = "#{payment.sn} paid"
    else
      flash[:alert] = "Something wrong!!!"
    end

    # 動作完成，導回訂單索引頁
    redirect_to orders_path
  end

  def notify
    payment = Payment.find_and_process(spgateway_params)
    if payment&.save
      # send paid email
      render text: "1|OK"
    else
      render text: "0|ErrorMessage"
    end
  end

  private

  # 取出必要參數
  def spgateway_params
    params.slice("Status", "MerchantID", "Version", "TradeInfo", "TradeSha")
  end
end
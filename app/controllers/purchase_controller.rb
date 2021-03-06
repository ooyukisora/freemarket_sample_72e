class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_card, :set_item

  def index
    @item = Item.all
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:payjp_private_key]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key =  Rails.application.credentials[:payjp][:payjp_private_key]
    Payjp::Charge.create(
      amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
      customer: @card.customer_id, #顧客ID
      currency: 'jpy', #日本円
    )
    @item.buyer_id = @card.user_id
    if @item.save
      redirect_to action: 'done', id: @item.id #完了画面に移動
    end
  end

  def done
  end

  private

  def set_card
    @card = Card.where(user_id: current_user).first
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

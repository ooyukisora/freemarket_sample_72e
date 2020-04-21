class CardsController < ApplicationController
  require 'payjp'
  before_action :set_card

  def index
    #テーブルからpayjpの顧客IDを検索
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials[payjp][:payjp_private_key]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
      redirect_to action: "delete"
    end
  end

  def new
    redirect_to action: "index" if @card.present?
  end

  def pay
    Payjp.api_key = Rails.application.credentials[payjp][:payjp_private_key]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      # payjp上の表示
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'], #必要
      metadata: {user_id: current_user.id} #なくてもOK
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        # クレジットカード登録成功時、マイページへ遷移
        redirect_to controller: "users", action: "show", id: current_user.id
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除
    if @card.present?
      Payjp.api_key = Rails.application.credentials[payjp][:payjp_private_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出す
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials[payjp][:payjp_private_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

end

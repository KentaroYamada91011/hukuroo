class ChargesController < Spree::StoreController
  def new
  end
  
  def create
    form = Spree::UserBilling.find_or_initialize_by(user_id:current_spree_user.id)
    form = form.update(user_billing_params)
    @amount = 4000#引き落とす金額
    product = Stripe::Product.create({
      name: 'My SaaS Platform',
      type: 'service',
    })
    plan = Stripe::Plan.create({
      product: product.id,
      nickname: 'フクロー定期支払い',
      interval: 'day',
      currency: 'jpy',
      amount: @amount,
    })
    customer = Stripe::Customer.create(
      email:  params[:stripeEmail], #emailは暗号化されずに受け取る
      source: params[:stripeToken] #めちゃめちゃな文字列
    )


    subscription = Stripe::Subscription.create({
      customer: customer.id,
      items: [{plan: plan.id}],
    })

    flash[:success] = "サブスクリプション会員の登録が完了しました！"
    return redirect_to spree_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path

  end

  private

  def user_billing_params
    data = params.fetch(:user_billing, {}).permit(:user_id,:is_billing,:ticket_number, :expired_date)
    data[:user_id]        = current_spree_user.id
    data[:is_billing]     = true
    data[:ticket_number]  = 2
    data[:expired_date]   = (Date.today >> 1).strftime
    data
  end
end

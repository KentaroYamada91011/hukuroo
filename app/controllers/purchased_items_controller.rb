class PurchasedItemsController < Spree::StoreController
  def new
    @product = Spree::Product.find(params[:product_id])
    @amount = @product.price.to_i
  end

  def create
    @product = Spree::Product.find(params[:product_id])
    @amount = Spree::Product.find(params[:product_id]).price.to_i
    form = Spree::PurchasedItem.new(purchased_items_params)
    form.save

    product = Stripe::Product.create({
      name: 'My SaaS Platform',
      type: 'service',
    })
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "商品ID:#{@product.id} 商品名:#{@product.name}",
      currency: "jpy",
    })

    flash[:success] = "購入が完了しました！準備が出来次第、メールが届きます"
    return redirect_to spree_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path

  end

  private

  def purchased_items_params
    data = params.fetch(:user_billing, {}).permit(:user_id,:product_id, :state, :price)
    data[:user_id]             = current_spree_user.id
    data[:product_id]          = @product.id
    data[:state]               = "購入されました"
    data[:price]               = @amount
    data
  end
end
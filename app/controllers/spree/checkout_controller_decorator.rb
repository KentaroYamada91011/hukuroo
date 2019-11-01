Spree::CheckoutController.class_eval do
  def update
    if update_order

      assign_temp_address

      # spree_order_mutexes

      # unless transition_forward
      #   redirect_on_failure
      #   return
      # end

      # if @order.completed?
      p "ヤマダ"
      p @order
      @order.state = "confirm"
      p Spree::OrderMutex.create(order_id: @order.id)
      Spree::OrderMutex.create(order_id: @order.id)
      # finalize_order
      redirect_to checkout_state_path(@order.state)
      # else
      #   send_to_next_state
      # end

    else
      render :edit
    end
  end
end
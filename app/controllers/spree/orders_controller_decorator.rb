Spree::OrdersController.class_eval do
    # Shows the current incomplete order from the session
    def edit
      @cart_page = true
      @user = current_spree_user
      @order = current_order || Spree::Order.incomplete.find_or_initialize_by(guest_token: cookies.signed[:guest_token])
      authorize! :read, @order, cookies.signed[:guest_token]
      associate_user
      if !current_spree_user&.user_billing&.is_billing? || current_spree_user.nil?
        if @order = current_order
          authorize! :update, @order, cookies.signed[:guest_token]
          @order.empty!
        end
      end
    end
end
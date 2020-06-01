class AddressesController < Spree::StoreController
  def index
    @account_page = true
    @user = spree_current_user
  end
  def edit
  end
  def update 
  end
  def show
    @account_page = true
    @user = spree_current_user
  end
  def new
    @account_page = true
    @user = spree_current_user
    @shipment_address = @user&.bill_address || @user&.addresses&.last || Spree::Address.new()
  end
  def create
    user = spree_current_user
    @shipment_address = Spree::Address.new(address_params)
    p address_params
    p update
    p "井口"
    p @shipment_address
    p @shipment_address.valid?
    if @shipment_address.valid? && user.valid?
      @shipment_address.save
      user = Spree::User.find(user.id).update(bill_address_id: @shipment_address.id, ship_address_id:@shipment_address.id)
      redirect_to @shipment_address
    else
      render :new
    end
  end

  private
  def address_params 
    data = params.fetch(:address, {}).permit(:user_id,:firstname,:lastname, :address1,:city, :address2, :zipcode, :state_name, :alternative_phone, :state_id, :country_id, :phone)
    # data[:city] = ""
    data
  end
end

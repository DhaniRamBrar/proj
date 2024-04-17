class OrdersController < ApplicationController
  before_action :initialize_cart, only: [:create] 
  before_action :authenticate_user! 
  def summary
    if session[:cart].present?
      @items = []
      @subtotal = 0
      session[:cart].each do |product_id, quantity|
        product = Product.find(product_id)
        @subtotal += product.price * quantity
        @items << { product: product, quantity: quantity }
      end
      @user = current_user
      @provinces = Province.all
    else
      
    end
  end

  def index
    @orders = current_user.orders.includes(:order_items, :province).order(created_at: :desc)
 end


    def create
      ActiveRecord::Base.transaction do
        @order = current_user.orders.new(order_params)
        current_user.update!(full_address: order_params[:address], province_id: order_params[:province_id])
        if @order.save
       
          product_ids = params[:product_ids]
          quantities = params[:quantities]
    
          product_ids.zip(quantities).each do |product_id, quantity|
            @order.order_items.create!(product_id: product_id, quantity: quantity)
          end
          session[:cart] = nil
          redirect_to index_orders_path, notice: 'Order was successfully placed.'
        else
          render :new, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordInvalid => e
        logger.error "Order creation failed: #{e.message}"
        redirect_to new_order_path, alert: "Order could not be processed: #{e.message}"
      end
    end
    
  
    private


    def order_params
      params.require(:order).permit(:address, :province_id, :subtotal, :gst, :pst, :hst, :grand_total)
    end
    

    def initialize_cart
      session[:cart] ||= {}
    end

end
  

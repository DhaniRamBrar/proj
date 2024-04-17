class CartsController < ApplicationController
  
  def show
    @cart_items = session[:cart].map do |product_id, quantity|
      product = Product.find(product_id)
      { product: product, quantity: quantity }
    end
  rescue ActiveRecord::RecordNotFound

    session[:cart].delete(product_id)
    redirect_to cart_path, alert: "A product in your cart is no longer available."
  end

  def add
    product_id = params[:product_id].to_s
    quantity = params[:quantity].to_i
  
    # Initialize the cart session if it doesn't exist
    
    session[:cart] ||= {}
    session[:cart] = Hash(session[:cart])
    # Add the product to the cart or update its quantity
    if session[:cart].has_key?(product_id)
      session[:cart][product_id] += quantity
    else
      session[:cart][product_id] = quantity
    end
  
    # Redirect to the cart page with feedback to the user
    redirect_to cart_path, notice: "Added #{quantity} #{'unit'.pluralize(quantity)} of #{Product.find(product_id).name} to your cart."
  end
  


  def update_quantity
    product_id = params[:product_id]
    new_quantity = params[:quantity].to_i

    if new_quantity > 0
      session[:cart][product_id] = new_quantity
      flash[:notice] = "Cart updated successfully."
    else
      flash[:alert] = "Invalid quantity."
    end

    redirect_to cart_path
  end


  def remove
    session[:cart].delete(params[:product_id].to_s)
    redirect_to cart_path, notice: 'Product removed from cart successfully.'
  end

  private

  def initialize_cart
    session[:cart] ||= {}
  end
      

end
class CartsController < ApplicationController
  # GET /carts/:id
  before_action :authenticate_user!
  before_action :set_cart, only: [:show, :close]
  def show
    @cart = current_user.cart
    @cart = Cart.find(params[:id])
    @line_items = @cart.line_items
    @total = @line_items.sum do |item|
      (item.quantity || 0) * (item.price || 0)
    end
  end

  def close
    if @cart.update(status: 'closed')  # Asegúrate de tener un campo 'status' en tu modelo Cart
      redirect_to @cart, notice: 'Cart was successfully closed.'
    else
      redirect_to @cart, alert: 'Unable to close the cart.'
    end
  end

  private

  def set_cart
    @cart = Cart.find_by(id: params[:id])
    unless @cart
      flash[:alert] = "Cart not found."
      redirect_to root_path  # O a una página apropiada en caso de que no haya un carrito
    end
  end
end

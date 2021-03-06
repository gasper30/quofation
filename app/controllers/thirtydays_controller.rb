class ThirtydaysController < ApplicationController
  before_action :authenticate_user!
  def index
    @category = []
    Category.all.each do |cc|
      @category.push(cc)  if cc.products.where(thirtydays_status: true).size > 0
    end
  end
  
  def show
    @product = Product.find(params[:id])
    if @product.thirtydays_status == false
      redirect_to designer_product_path(designer_id: @product.designer.id, id: @product.id)
    end
    @comment = Comment.new
    @cart_item = CartItem.new
    @products = Product.where(thirtydays_status: true).sample(6)
    @designer_products = @product.designer.products.sample(6)
    @category_products = @product.category.products.sample(6)
  end

  def category
    @category = Category.find(params[:id])
    @products = @category.products.where(thirtydays_status: true).order("RANDOM()")
  end
  
end

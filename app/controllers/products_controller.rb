class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
    @user = user_logged_in?
    @rating = reviews_rating
  end

  private

  def user_logged_in?
    session[:user_id]
  end

  def reviews_rating
    if @product.reviews.size > 0
      return @product.reviews.average(:rating).round(1)
    end
  end

end

class ReviewsController < ApplicationController
  before_filter :autorized_user?

  def create
    @product = Product.find(params[:product_id].to_i)
    @review = @product.reviews.create(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product), notice: 'Review created!'
    else
      redirect_to product_path(@product), notice: 'Could not create review'
    end
  end

  def destroy
    @product = Product.find(params[:product_id].to_i)
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to product_path(@product), notice: "Review deleted!"

  end


  private
    def review_params
      params.require(:review).permit(
        :product_id,
        :description,
        :rating,
      )
    end

    def autorized_user?
      if !logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to "/login"
      end
    end

end

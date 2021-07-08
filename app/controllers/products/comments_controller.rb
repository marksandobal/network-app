module Products
  class CommentsController < ApplicationController
    def create
      comment = Comment.new(comment_parameters)
      if comment.save
        redirect_to product_path(product)
      else
        redirect_to product_path(product), flash[:error] = 'Ocurrio un error al intentar agregar el comentario.'
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:comment)
    end

    def comment_parameters
      comment_params.merge(user: current_user, product: product)
    end

    def product
      @product ||= Product.find(params[:product_id])
    end
  end
end

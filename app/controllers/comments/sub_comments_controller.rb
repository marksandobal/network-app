module Comments
  class SubCommentsController < ApplicationController
    def create
      sub_comment = SubComment.new(sub_comment_params)
      if sub_comment.save
        redirect_to product_path(comment.product)
      else
        redirect_to product_path(comment.product), flash[:error] = 'No se pudo guardar el comentario'
      end
    end

    private

    def sub_comment_params
      params.require(:comment).permit(:sub_comment).merge(comment: comment, user: current_user)
    end

    def comment
      Comment.find(params[:comment_id])
    end
  end
end

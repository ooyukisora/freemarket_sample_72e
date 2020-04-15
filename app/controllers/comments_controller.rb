class CommentsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
  
    @comment = item.comments.build(comment_params)
    @comment.save
    @comment.user_id = current_user.id
    respond_to do |format|
      format.html { redirect_to items_path(params[:item_id]) , notice: "コメントを送信しました" }
      format.json 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

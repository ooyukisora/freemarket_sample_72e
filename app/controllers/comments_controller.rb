class CommentsController < ApplicationController

  def create
    #コメントした際の処理
    Comment.create(comment_params)
    redirect_to show_items_path(@item)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

end

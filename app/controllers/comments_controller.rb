class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:success] = "コメントが作成されました"
      redirect_back(fallback_location: root_path)
    else
     redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
    flash[:success] = "コメントを削除しました"
    redirect_back(fallback_location: root_path)
  end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :user_id, :onsenpost_id, :rate, average_rates_attributes: [:average_rate,:onsenpost_id ])
  end
end

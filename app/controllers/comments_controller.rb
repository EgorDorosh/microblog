class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: :destroy
  before_action :find_micropost, except: :destroy
  after_action :create_notification, only: :create

  def create
    @comment = @micropost.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to @micropost
    else
      render 'microposts/show'
    end
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  private

  def create_notification
    return if @comment.micropost.user == current_user

    NotificationsCreator.call(@comment.micropost.user, current_user, @comment)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end

  def find_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end
end

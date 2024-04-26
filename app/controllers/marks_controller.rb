class MarksController < ApplicationController
  before_action :find_post

  def create
    @micropost.marks.create(user_id: current_user.id)
    redirect_to micropost_path(@micropost)
  end

  def destroy
    @mark.destroy
  end

  private

  def find_post
    @micropost = Micropost.find(params[:post_id])
  end

  def find_mark
    @mark = Mark.find(params[:id])
  end
end

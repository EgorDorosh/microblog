class MarksController < ApplicationController
  before_action :logged_in_user
  before_action :find_markable
  before_action :correct_user, only: :destroy

  def create
    mark_type = params[:mark_type]
    current_user.marks.where(markable: @markable).where.not(mark_type:).destroy_all
    @mark = current_user.marks.create!(markable: @markable, mark_type:)

    redirect_to request.referrer || root_url
  end

  def destroy
    @mark.destroy
    redirect_to request.referrer || root_url
  end

  private

  def find_markable
    @markable = params[:comment_id] ? Comment.find(params[:comment_id]) : Micropost.find(params[:micropost_id])
  end

  def correct_user
    @mark = current_user.marks.find_by(markable: @markable, mark_type: params[:mark_type])
    redirect_to root_url if @markable.nil?
  end
end

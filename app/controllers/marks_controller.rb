class MarksController < ApplicationController
  before_action :find_micropost, only: :create

  def create
    @micropost.marks.where(user_id: current_user.id).destroy_all
    @micropost.marks.create(user_id: current_user.id, mark_type: params[:type])
    redirect_to request.referrer || root_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    @mark = micropost.marks.find(params[:id])
    @mark.destroy
    redirect_to request.referrer || root_url
  end

  private

  def find_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end
end

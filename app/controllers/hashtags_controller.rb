# frozen_string_literal: true

class HashtagsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only: [:destroy]

  def index
    @hashtags = Hashtag.paginate(page: params[:page])
  end

  def destroy
    Hashtag.find(params[:id]).destroy
    flash[:success] = 'Hashtag was deleted'
    redirect_to hashtags_url
  end
end

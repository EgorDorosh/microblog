# frozen_string_literal: true

class HashtagSubscriptionsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: :destroy

  # Подписаться на хештег
  def create
    hashtag = Hashtag.find_by(name: params[:hashtag_name])
    current_user.hashtag_subscriptions.create(hashtag: hashtag)
    redirect_to request.referrer || root_url
  end

  def destroy
    @subscription.destroy
    redirect_to request.referrer || root_url
  end

  private

  def correct_user
    @subscription = current_user.hashtag_subscriptions.find_by(hashtag_id: params[:id])
    redirect_to root_url if @subscription.nil?
  end
end

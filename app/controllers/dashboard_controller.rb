class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
  	@followings = current_user.followings
  	@followers = current_user.followers

    conditions = "id != #{current_user.id} AND (email rlike '#{params[:search_term]}' OR first_name rlike '#{params[:search_term]}' OR last_name rlike '#{params[:search_term]}')"
  	@searched_users = User.where(conditions) if params[:search_term]
  end

  def follow
    Fellowship.create({ user_id: current_user.id, following_id: params[:user_id].to_i })
    redirect_to authenticated_root_path
  end

  def unfollow
    f = Fellowship.where("user_id = #{current_user.id} AND following_id = #{params[:user_id].to_i}")
    f.first.destroy
    redirect_to authenticated_root_path
  end
end

module ApplicationHelper
  def user_full_name
    "#{current_user.first_name} #{current_user.last_name}"
  end

  def follow_or_unfollow(su_id = nil)
  	followings_ids = @followings.map(&:id)
  	if followings_ids.include?(su_id)
      link_to "unfollow", unfollow_path(su_id), style: "margin-left: 20px;"
    else
      link_to "follow", follow_path(su_id), style: "margin-left: 20px;"
    end
  end
end
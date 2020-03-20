class RelationshipsController < ApplicationController
	before_action :authenticate_user!
	def follow
		current_user.follow(params[:id])
		redirect_back(fallback_location: follow_path)
	end

	def unfollow
		current_user.unfollow(params[:id])
		redirect_back(fallback_location: unfollow_path)
	end
	def follower_index
		@user = User.find(params[:id])
	end
	def following_index
		@user = User.find(params[:id])
	end
	def user_params
    	params.require(:user).permit(:name, :introduction, :profile_image)
    end
end

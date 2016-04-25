class EpicenterController < ApplicationController
  before_filter :authenticate_user!, except: [:show_user]

  def feed
  	#start with an empty array
  	@following_tweets = []
  	#look at users that we're following, if they have tweets
  	#put them into the following_tweets array
  	Tweet.all.each do |t|
  		if current_user.following.include?(t.user_id)
  			@following_tweets.push(t)
  		end
  	end
  end

  def show_user
  	@user = User.find(params[:id])
  end

  def now_following
  	#put the user id number that we passed into the following array
  	current_user.following.push(params[:id].to_i)
  	current_user.save
  	redirect_to :back
  end

  def unfollow
  	current_user.following.delete(params[:id].to_i)
  	current_user.save
  	redirect_to :back
  end
end

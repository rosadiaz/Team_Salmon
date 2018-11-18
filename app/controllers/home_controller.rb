class HomeController < ApplicationController

  def leaderboard
    @lb_results = {}
    @current_user_nickname = current_user.nickname
    users = User.all.each do |u|
      @lb_results[u.nickname] = u.results.sum(:score)
    end
    @lb_results = Hash[@lb_results.sort_by{|key, val| val}.reverse]
  end
end

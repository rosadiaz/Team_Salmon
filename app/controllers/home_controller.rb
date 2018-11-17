class HomeController < ApplicationController

  def leaderboard
    results = Result.all
    @lb_results = {}
    results.each do |r|
      user = User.find_by_id(r.user_id)
      if @lb_results[user&.nickname]
        val = @lb_results[user&.nickname] + r.score
        @lb_results[user&.nickname] = val
      else
        @lb_results[user&.nickname] = r.score
      end
    end
    @lb_results = Hash[@lb_results.sort_by{|key, val| val}.reverse]
  end
end

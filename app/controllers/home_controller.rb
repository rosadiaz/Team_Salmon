class HomeController < ApplicationController

  def leaderboard
    results = Result.all
    lb_results = {}
    results.each do |r|
      if lb_results[r.user_id]
        val = lb_results[r.user_id] + r.score
        lb_results[r.user_id] = val
      else
        lb_results[r.user_id] = r.score
      end
    end
  end
end

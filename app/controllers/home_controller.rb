class HomeController < ApplicationController

  def leaderboard
    results = Result.all
    leaderboard_results = {}
    results.each do |r|
      leaderboard_results[r.user_id] = r.score
    end
  end
end

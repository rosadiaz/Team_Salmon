class HomeController < ApplicationController

  def leaderboard
    results = Result.all
    results.each do |r|
      
    end
  end
end

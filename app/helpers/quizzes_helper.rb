module QuizzesHelper

  def evaluate_quiz(solution, tips)
    score = solution.map.with_index{|val, index| val === tips[index] }
  end
end

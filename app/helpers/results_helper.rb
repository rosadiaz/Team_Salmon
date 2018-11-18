module ResultsHelper

  def calculate_score(answers)
    quiz_id = answers.quiz_id
    submitted_answers = clear_data(answers)
    correct_answes = get_correct_answers(quiz_id)
    hits = compare_answers(correct_answers, submitted_answers)
    score = get_score(hits) # we can add the difficoulty here
  end

  def clear_data(answers)
    to_reject = [ :authenticity_token, :controller, :action, :quiz_id]
    answers.reject { |k| to_reject.include?(k) }
  end

  def get_correct_answers(id)
    Quiz.find(id).questions.each_with_object({}) { |q, hash| hash.store(q.id, q.correct_answer) }
  end

end

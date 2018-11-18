class ResultsController < HomeController

    before_action :find_quiz, only: [ :create, :show ]
    before_action :authorize_user!, only: [ :create ]
  
    def create
        @score = helpers.calculate_score(params)

        @result = Result.new(user: current_user, quiz: @quiz, score: @score)
        if !@quiz.questions
            flash[:danger] = "No Questions on this quiz!"
            redirect_to quiz_path(@quiz)
        end
        if @result.save
            flash[:success] = "Answers Submited"
            redirect_to quiz_result_path(@quiz.id, @result.id)	
        else
            flash[:danger] = @result.errors.full_messages.join(", ");
            redirect_to quizzes_path
        end
    end
    
    def show
        @result = Result.find params[:id]
        @max_score = @quiz.questions.length
        @leaderboard_score = User.find(current_user.id).results.sum(:score)
    end

    private
    def find_quiz
        @quiz = Quiz.find params[:quiz_id]
    end

    def authorize_user!
        unless can?(:take, @quiz)
            flash[:danger] = "Can't take your own quiz"
            redirect_to quiz_path(@quiz)
        end
    end 

end

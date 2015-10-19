class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :questions

  def grade_for(user)
    scores = []
    self.questions.each do |question|
      answer = user.answer(question)
      if answer.correct
        scores << 1
      elsif answer.score
        scores << answer.score
      else
        return nil
      end
    end
  end

  def mark(user)
    self.questions.each do |question|
      if question.computer_marked
        if user.answer(question).answer == question.correct
          user.answer(question).update(correct: true)
        else
          user.answer(question).update(correct: false)
        end
      end
    end
  end
end

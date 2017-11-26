class Question
  attr_accessor :title, :body, :author_id, :id 
  
  def initialize(options)
    @title= options['title']
    @body = options['body']
    @author_id = options['author_id']
    @id = options['id']
  end

  def save
    return self.update if @id
    
    QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.author_id)
    INSERT INTO
      questions(title, body, author_id)
    VALUES 
      (?, ?, ?)
    SQL
    
    @id = QuestionsDatabase.instance.last_insert_row_id
  end
  
  def update 
    raise "#{self} not in questions" unless @id 
    QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.author_id, self.id)
      UPDATE 
        questions 
      SET 
        title = ?, body = ?, author_id = ?
      WHERE 
        questions.id = ?
    SQL
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        questions 
      WHERE 
        questions.id = ?
    SQL
    
    return nil if question.empty? 
    question = Question.new(question.first)
  end
  
  def self.find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT 
        * 
      FROM 
        questions 
      WHERE 
        questions.author_id = ?
    SQL
    
    return nil if questions.empty? 
    questions = questions.map { |question| Question.new(question) }
  end
  
  def author 
    User.find_by_id(self.author_id)
  end
  
  def replies
    Reply.find_by_user_id(self.author_id)
  end
  
  def followers 
    QuestionFollow.followers_for_question_id(self.id)
  end
  
  def self.most_followed(n) 
    QuestionFollow.most_followed_questions(n)
  end
  
  
  def likers
    QuestionLike.likers_for_question_id(self.id)
  end
  
  def num_likes
    QuestionLike.num_likes_for_question_id(self.id)
  end
  
  def self.most_liked(n)
    liked_questions = QuestionLike.most_liked_questions(n)
    raise 'too few questions' if liked_questions.length < n
    liked_questions.last
  end
end 
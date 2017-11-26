class QuestionLike 
  attr_accessor :user_id, :question_id, :id
  
  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
    @id = options['id']
  end
  
  def save
    self.update if @id
    
    QuestionsDatabase.instance.execute(<<-SQL, self.user_id, self.question_id)
    INSERT INTO
      question_likes(user_id, question_id)
    VALUES 
      (?, ?)
    SQL
    
    @id = QuestionsDatabase.instance.last_insert_row_id
  end
  
  def update 
    raise "#{self} not in question likes" unless @id 
    QuestionsDatabase.instance.execute(<<-SQL, self.user_id, self.question_id, self.id)
      UPDATE 
        question_likes 
      SET 
        user_id = ?, question_id = ?
      WHERE 
        question_likes.id = ?
    SQL
  end
  
  def self.find_by_id(id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        question_likes
      WHERE 
        question_likes.id = ?
    SQL
    
    return nil if question_like.empty? 
    question_like = QuestionLike.new(question_like.first)
  end
  
  def self.likers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        users.*
      FROM
        users
      JOIN
        question_likes ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = ?
    SQL
    
    return nil if users.empty? 
    users = users.map { |user| User.new(user) }
  end
  
  def self.num_likes_for_question_id(question_id)
    
    likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(question_likes.question_id) AS num_likes
      FROM
        question_likes
      WHERE
        question_likes.question_id = ?
      GROUP BY 
        question_likes.question_id
    SQL
    return nil if likes.empty?
    likes.first['num_likes'] 
  end
  
  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*  
      FROM
        questions
      JOIN 
        question_likes ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?
    SQL
    
    return nil if questions.empty?
    questions = questions.map { |question| Question.new(question) }
  end
  
  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
      questions.*
    FROM 
      questions
    JOIN 
      question_likes ON questions.id = question_likes.question_id
    GROUP BY
      questions.id
    ORDER BY
      COUNT(question_likes.question_id) DESC
    LIMIT
      ?
    SQL
    
    return nil if questions.empty?
    questions = questions.map { |question| Question.new(question) }
  end
  
end 












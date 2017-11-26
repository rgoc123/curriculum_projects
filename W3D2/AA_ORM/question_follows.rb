class QuestionFollow
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
      question_follows(user_id, question_id)
    VALUES 
      (?, ?)
    SQL
    
    @id = QuestionsDatabase.instance.last_insert_row_id
  end
  
  def update 
    raise "#{self} not in question follows" unless @id 
    QuestionsDatabase.instance.execute(<<-SQL, self.user_id, self.question_id, self.id)
      UPDATE 
        question_follows 
      SET 
        user_id = ?, question_id = ?
      WHERE 
        question_follows.id = ?
    SQL
  end

  def self.find_by_id(id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        question_follows
      WHERE 
        question_follows.id = ?
    SQL
    
    return nil if question_follow.empty? 
    question_follow = QuestionFollow.new(question_follow.first)
  end
  
  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        users.fname, users.lname, users.id
      FROM 
        users
      JOIN 
        question_follows ON users.id = question_follows.user_id 
      WHERE 
        question_follows.question_id = ?
    SQL
    
    return nil if followers.empty?
    followers = followers.map { |follower| User.new(follower) }
  end
  
  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN 
        question_follows ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?
    SQL
    
    return nil if questions.empty? 
    questions = questions.map { |question| Question.new(question) }
  end
  
  def most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*  
      FROM
        questions
      JOIN 
        question_follows ON questions.id = question_follows.question_id
      GROUP BY 
        questions.id
      ORDER BY
        COUNT(question_follows.question_id) DESC
      LIMIT
        ?
    SQL
    
    return nil if questions.empty? 
    questions = questions.map { |question| Question.new(question) }
  end
end 










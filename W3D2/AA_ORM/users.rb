class User 
  attr_accessor :fname, :lname, :id 
  
  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
    @id = options['id']
  end
  
  def save
    return self.update if @id
    
    QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
    INSERT INTO
      users(fname, lname)
    VALUES 
      (?, ?)
    SQL
    
    @id = QuestionsDatabase.instance.last_insert_row_id
  end
  
  def update 
    raise "#{self} not in users" unless @id 
    QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname, self.id)
      UPDATE 
        users 
      SET 
        fname = ?, lname = ?
      WHERE 
        users.id = ?
    SQL
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        users 
      WHERE 
        users.id = ?
    SQL
    
    return nil if user.empty? 
    user = User.new(user.first)
  end
  
  def self.find_by_name(fname, lname)
    users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE 
        users.fname = ? AND 
        users.lname = ?
    SQL
    
    return nil if users.empty?
    
    users = users.map { |user| User.new(user) }
  end
  
  def authored_questions
    Question.find_by_author_id(self.id)
  end
  
  def authored_replies
    Reply.find_by_user_id(self.id)
  end
  
  def followed_questions
    QuestionFollow.followed_questions_for_user_id(self.id)
  end
  
  def liked_questions 
    QuestionLike.liked_questions_for_user_id(self.id)
  end
  
  def average_karma
    karma = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT
        CAST(karma_table.total_likes AS FLOAT) / karma_table.total_questions AS average_karma
      FROM
        (SELECT 
         COUNT(COALESCE(question_likes.id, 0)) AS total_likes, COUNT(DISTINCT questions.id) AS total_questions
        FROM
          questions 
        LEFT JOIN
          question_likes ON question_likes.question_id = questions.id 
        WHERE
          questions.author_id = ?
        ) AS karma_table
    SQL
    
    karma.last['average_karma']
  end
  
end 
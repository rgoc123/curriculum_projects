
class Reply
  attr_accessor :question_id, :parent_reply_id, :user_id, :body, :id
  
  def initialize(options)
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @user_id = options['user_id']
    @body = options['body']
    @id = options['id']
  end
  
  def save
    self.update if @id
    
    QuestionsDatabase.instance.execute(<<-SQL, self.question_id, self.parent_reply_id, self.user_id, self.body)
    INSERT INTO
      replies(question_id, parent_reply_id, user_id, body)
    VALUES 
      (?, ?, ?, ?)
    SQL
    
    @id = QuestionsDatabase.instance.last_insert_row_id
  end
  
  def update 
    raise "#{self} not in question follows" unless @id 
    QuestionsDatabase.instance.execute(<<-SQL, self.question_id, self.parent_reply_id, self.user_id, self.body, self.id)
      UPDATE 
        replies 
      SET 
        question_id = ?, parent_reply_id = ?, user_id = ?, body = ?
      WHERE 
        replies.id = ?
    SQL
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        replies 
      WHERE 
        replies.id = ?
    SQL
    
    return nil if reply.empty? 
    reply = Reply.new(reply.first)
  end
  
  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        *
      FROM 
        replies
      WHERE 
        replies.user_id = ? 
    SQL
    return nil if replies.empty?
    replies = replies.map { |reply| Reply.new(reply) }
  end
  
  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        *
      FROM 
        replies 
      WHERE 
        replies.question_id = ? 
    SQL
    
    return nil if replies.empty?
    replies = replies.map { |reply| Reply.new(reply) }
  end
  
  def author
    User.find_by_id(self.user_id)
  end
  
  def question 
    Question.find_by_id(self.question_id)
  end
  
  def parent_reply
    Reply.find_by_id(self.parent_reply_id)
  end
  
  def child_replies
    replies = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT 
        * 
      FROM 
        replies 
      WHERE 
        replies.parent_reply_id = ? 
    SQL
    
    return nil if replies.empty?
    replies = replies.map { |reply| Reply.new(reply) }
  end
  
end 
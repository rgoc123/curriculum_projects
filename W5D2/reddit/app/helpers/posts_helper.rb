module PostsHelper
  def commments_to_parse(comment, depth = 0)
    return [comment.content, depth] if comment.comments.empty?
    family = []
    comment.comments.each do 
      family += commments_to_parse(comment, depth + 1)
    end
    return family
  end
end

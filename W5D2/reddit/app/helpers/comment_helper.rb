module CommentHelper
  
  def dfs_comment(comment)
    return "<li>#{render '_comment', comment: comment}</li>".html_safe unless comment.comments
    comment.comments.each do |comment|
      "<ul>#{dfs_comment(comment)}</ul>".html_safe
    end
  end
  
end

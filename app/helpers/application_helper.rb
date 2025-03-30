module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Microblog'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def mark_polymorphic_path(markable, options = {})
    case markable
    when Micropost then micropost_mark_path(markable, options)
    when Comment then micropost_comment_mark_path(markable.micropost, markable, options)
    else
      raise "Unknown markable type"
    end
  end
end

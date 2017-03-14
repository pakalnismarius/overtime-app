module PostsHelper
  
  def status_label status
    status_spam_generator status
  end

  private

  def status_spam_generator status
    case status
      when "submitted"
      content_tag(:spam, status.titleize, class: 'label label-primary')
      when "approved"
      content_tag(:spam, status.titleize, class: 'label label-success')
      when "rejected"
      content_tag(:spam, status.titleize, class: 'label label.titleize-danger')
    end
  end
end

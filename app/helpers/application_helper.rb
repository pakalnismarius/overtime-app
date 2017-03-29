module ApplicationHelper
  def active?(path)
    "active" if current_page?(path)
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
      when "pending"
      content_tag(:spam, status.titleize, class: 'label label-primary')
      when "confirmed"
      content_tag(:spam, status.titleize, class: 'label label-success')
    end
  end

end

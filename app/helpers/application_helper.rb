module ApplicationHelper
  
  def admin_types
    ['AdminUser']
  end

  def active?(path)
    "active" if current_page?(path)
  end

  def employee?
    current_user.type == 'Employee'
  end

  def admin?
    admin_types.include?(current_user.type)
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

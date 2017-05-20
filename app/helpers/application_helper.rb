module ApplicationHelper
  def title(page_title, show_sub_title = true, options={})
    content_for(:title) { page_title }

    fa_icon = options.slice(:fa_icon)
    if show_sub_title
      sub_title(page_title, fa_icon)
    end
  end

  def sub_title(sub_title, options={})
    content_for(:sub_title) { sub_title }
    fa_icon = options.slice(:fa_icon)
    if fa_icon.present?
      content_for(:fa_icon) { fa_icon[:fa_icon] }
    end
  end

  def pl(datetime, options={})
    if datetime.is_a?(String)
      datetime = Time.zone.parse(datetime)
    end

    unavailable = options.try(:[], :na)
    unavailable ||= "N/A"
    if datetime.present?
      I18n.l(datetime, options.slice(:format))
    else
      unavailable
    end
  end
  def current_customer
    unless session[:current_customer].blank?
      Customer.find(session[:current_customer]["id"])
    else
      "No Customer Defined"
    end
  end
end

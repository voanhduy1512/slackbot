module ApplicationHelper
  def service_url service
    DOMAIN + callback_path(service.slug)
  end
end

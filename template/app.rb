class Controller < ActionController::Base
  layout 'layout'

  before_filter do
    prepend_view_path 'views'
  end

  def index
  end
end

Rails.application.routes.append do
  root to: Controller.action(:index)
end
class Controller < RailsFrontend::Controller
  def index
  end
end

Rails.application.routes.append do
  root to: Controller.action(:index)
end

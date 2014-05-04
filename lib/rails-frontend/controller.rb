module RailsFrontend
  class Controller < ActionController::Base
    layout 'layout'

    before_filter do
      prepend_view_path 'views'
    end
  end
end

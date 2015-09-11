require 'react_webpack_rails/view_helpers'

module ReactWebpackRails
  class Railtie < Rails::Railtie
    initializer 'react_webpack_rails.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end

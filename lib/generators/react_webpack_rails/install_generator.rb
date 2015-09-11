module ReactWebpackRails
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    class_option :example, type: :boolean, default: true, desc: 'Include example component and test files.'

    def generate_layout
      copy_file 'webpack.config.js', 'webpack.config.js'
      copy_file 'webpack/dev.config.js', 'webpack/dev.config.js'
      copy_file 'webpack/production.config.js', 'webpack/production.config.js'
      copy_file 'karma.conf.js', 'karma.conf.js'
      copy_file 'webpack/tests.config.js', 'webpack/tests.config.js'
      template 'react/index.js.erb', 'app/react/index.js'
      if options.example
        copy_file 'react/components/hello-world.jsx', 'app/react/components/hello-world.jsx'
        copy_file 'react/components/hello-world-test.jsx', 'app/react/components/hello-world-test.jsx'
      else
        create_file 'app/react/components/.keep'
      end
      template 'package.json.erb', 'package.json'
    end

    private

    def file_name
      layout_name.underscore
    end
  end
end

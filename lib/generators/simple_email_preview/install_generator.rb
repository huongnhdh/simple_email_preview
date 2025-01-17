module SimpleEmailPreview
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'creates an initializer file at config/initializers/simple_email_preview.rb and adds REP route to config/routes.rb'
      source_root File.expand_path('../../..', __dir__)

      def generate_initialization
        copy_file 'config/initializers/simple_email_preview.rb', 'config/initializers/simple_email_preview.rb'
      end

      def generate_routing
        route "mount SimpleEmailPreview::Engine, at: 'emails'"
        log "# You can access REP urls like this: simple_email_preview.rep_emails_url #=> '/emails'"
      end
    end
  end
end

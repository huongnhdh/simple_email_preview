module ::SimpleEmailPreview
  class Engine < Rails::Engine
    isolate_namespace SimpleEmailPreview
    load_generators

    initializer 'simple_email_preview.setup_assets' do
      SimpleEmailPreview::Engine.config.assets.precompile += %w[
        simple_email_preview/application.js
        simple_email_preview/application.css
        simple_email_preview/favicon.png
      ]
    end
  end
end

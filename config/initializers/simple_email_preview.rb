require 'simple_email_preview'
require 'breadcrumbs_on_rails'

Rails.application.config.to_prepare do
  # Render REP inside a custom layout (set to 'application' to use app layout, default is REP's own layout)
  # This will also make application routes accessible from within REP:
  # SimpleEmailPreview.layout = 'admin'

  # Set UI locale to something other than :en
  SimpleEmailPreview.locale = :en

  # Auto-load preview classes from:
  SimpleEmailPreview.preview_classes = SimpleEmailPreview.find_preview_classes('app/mailer_previews')
end

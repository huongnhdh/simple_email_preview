require 'simple_email_preview'

SimpleEmailPreview.view_hooks.add_render :headers_and_nav, :before, partial: 'simple_email_preview/my_hook', locals: { pos: 'before headers_and_nav' }
SimpleEmailPreview.view_hooks.add_render :headers_content, :after, partial: 'simple_email_preview/my_hook', locals: { pos: 'after headers_content' }

Rails.application.config.to_prepare do
  SimpleEmailPreview.preview_classes = SimpleEmailPreview.find_preview_classes(Rails.root.join('app/mailer_previews'))
end

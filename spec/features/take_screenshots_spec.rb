require 'spec_helper'
unless ENV['TRAVIS']
  describe 'Take screenshots', type: :feature, driver: :poltergeist do
    it 'list page' do
      visit simple_email_preview.rep_root_path
      screenshot! 'list'
    end

    it 'list page in de' do
      begin
        SimpleEmailPreview.locale = :de
        visit simple_email_preview.rep_root_path
        screenshot! 'list-de'
      ensure
        SimpleEmailPreview.locale = nil
      end
    end

    it 'show email page' do
      visit simple_email_preview.rep_email_path(preview_id: 'auth_mailer_preview-email_confirmation')
      screenshot! 'show'
    end
  end
end

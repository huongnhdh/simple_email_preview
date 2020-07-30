require 'spec_helper'

describe 'email show', type: :feature do
  let(:url_args) { { preview_id: 'auth_mailer_preview-email_confirmation' } }
  it 'shows email' do
    visit simple_email_preview.rep_email_path(url_args)
    expect(page).to have_content('Dummy Email Confirmation')
    expect(page).to have_content I18n.t('simple_email_preview.emails.show.breadcrumb_list', locale: :en)
    expect(page).to have_content 'Hook before headers_and_nav'
    expect(page).to have_content 'Hook after headers_content'
  end

  it 'shows email in de' do
    begin
      SimpleEmailPreview.locale = :de
      visit simple_email_preview.rep_email_path(url_args)
      expect(page).to have_content('Dummy Email Confirmation')
      expect(page).to have_content I18n.t('simple_email_preview.emails.show.breadcrumb_list',
                                          locale: :de)
    ensure
      SimpleEmailPreview.locale = nil
    end
  end

  it 'falls back to en on unknown locale' do
    begin
      SimpleEmailPreview.locale = :fr
      visit simple_email_preview.rep_email_path(url_args)
      expect(page).to have_content 'Dummy Email Confirmation'
      expect(page).to have_content I18n.t('simple_email_preview.emails.show.breadcrumb_list',
                                          locale: :en)
    ensure
      SimpleEmailPreview.locale = nil
    end
  end

  it 'shows locale links' do
    visit simple_email_preview.rep_email_path(url_args)
    %w[en es].each do |locale|
      simple_email_preview.rep_email_path(url_args.merge(email_locale: locale))
    end
  end
end

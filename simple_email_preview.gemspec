require File.expand_path('lib/simple_email_preview/version', __dir__)

Gem::Specification.new do |s|
  s.name = 'simple_email_preview'
  s.author = 'HUONGNHDH'
  s.email = 'huong.nhdh@gmail.com'
  s.homepage = 'https://github.com/huongnhdh/simple_email_preview'
  s.license = 'MIT'

  s.summary = 'Simple preview emails in browser (rails engine)'
  s.description = 'A Rails Engine to preview plain text and html email in your browser'

  s.files = Dir['{app,lib,config}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'Gemfile', 'README.md']

  if s.respond_to?(:metadata=)
    s.metadata = { 'issue_tracker' => 'https://github.com/huongnhdh/simple_email_preview/issues' }
  end

  s.add_dependency 'breadcrumbs_on_rails', '~> 3.0', '>= 3.0.1'
  s.add_dependency 'rails', '>= 4.2'
  s.add_dependency 'request_store', '>= 1.0.0'
  s.add_dependency 'sassc-rails', '>= 1.3.0'
  s.add_dependency 'turbolinks', '>= 5.0.1'
  s.add_development_dependency 'capybara', '>= 3.8.2'
  s.add_development_dependency 'i18n-tasks', '>= 0.9.25'
  s.add_development_dependency 'poltergeist', '>= 1.0.0'
  s.add_development_dependency 'puma', '>= 3.12.0'
  s.add_development_dependency 'rspec-rails', '>= 3.8.0'

  s.version = SimpleEmailPreview::VERSION
end

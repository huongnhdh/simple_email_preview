Dummy::Application.routes.draw do
  mount SimpleEmailPreview::Engine, at: 'rep-emails'
  root to: redirect('/rep-emails')
end

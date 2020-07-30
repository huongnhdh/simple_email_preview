# Simple Email Preview
Preview email in the browser with this Rails engine. Compatible with Rails 4.2+.

*This gem base on [rails_email_preview](https://github.com/glebm/rails_email_preview), but prune for simple purpose (just preview)*

## Installation

Add [![Gem Version][gem-badge]][gem] to Gemfile:

```ruby
gem 'simple_email_preview', '~> 1.0.0'
```

Add an initializer and the routes:

```console
$ rails g simple_email_preview:install
```

Generate preview classes and method stubs in app/mailer_previews/

```console
$ rails g simple_email_preview:update_previews
```

## Usage

The last generator above will add a stub for each of your emails, then you populate the stubs with mock data:

```ruby
# app/mailer_previews/user_mailer_preview.rb:
class UserMailerPreview
  # preview methods should return Mail objects, e.g.:
  def invitation
    UserMailer.invitation mock_user('Alice'), mock_user('Bob')
  end

  def welcome
    UserMailer.welcome mock_user
  end

  private
  # You can put all your mock helpers in a module
  # or you can use your factories, just make sure you are not creating anything
  def mock_user(name = 'Me')
    fake_id User.new(name: name, email: "user#{rand 100}@test.com")
  end

  def fake_id(obj)
    # overrides the method on just this object
    obj.define_singleton_method(:id) { 123 + rand(100) }
    obj
  end
end
```

### Parameters as instance variables

All parameters in the search query will be available to the preview class as instance variables.
For example, if URL to mailer preview looks like:

/emails/user_mailer_preview-welcome?**user_id=1**

The method `welcome` in `UserMailerPreview` have a `@user_id` instance variable defined:

```ruby
class UserMailerPreview
  def welcome
    user = @user_id ? User.find(@user_id) : mock_user
    UserMailer.welcome(user)
  end
end
```

Now you can preview or send the welcome email to a specific user.

### Routing

You can access REP urls like this:

```ruby
# engine root:
simple_email_preview.rep_root_url
# list of emails (same as root):
simple_email_preview.rep_emails_url
# email show:
simple_email_preview.rep_email_url('user_mailer-welcome')
```


### Views

By default REP views will render inside its own layout.

To render all REP views inside your app layout, first set the layout to use in the initializer:

```ruby
Rails.application.config.to_prepare do
  # Use admin layout with REP (this will also make app routes accessible within REP):
  SimpleEmailPreview.layout = 'admin'
end
```

Then, import REP styles into your `application.css.scss`:

```scss
@import "simple_email_preview/application";
```

Alternatively, if you are using Bootstrap 3, `@import "simple_email_preview/bootstrap3"`, and add the following
to the initializer:

```ruby
config.style.merge!(
    btn_active_class_modifier: 'active',
    btn_danger_class:          'btn btn-danger',
    btn_default_class:         'btn btn-default',
    btn_group_class:           'btn-group btn-group-sm',
    btn_primary_class:         'btn btn-primary',
    form_control_class:        'form-control',
    list_group_class:          'list-group',
    list_group_item_class:     'list-group-item',
    row_class:                 'row',
)
```

You can also override any individual view by placing a file with the same path in your project's `app/views`,
e.g. `app/views/simple_email_preview/emails/index.html.slim`.

#### Hooks

You can add content around or replacing REP UI elements by registering view hooks in the initializer:

```ruby
# Pass position (before, after, or replace) and render arguments:
SimpleEmailPreview.view_hooks.add_render :list, :before, partial: 'shared/hello'

# Pass hook id and position (before, after, or replace):
SimpleEmailPreview.view_hooks.add :headers_content, :after do |mail:, preview:|
  raw "<dt>ID</dt><dd>#{h mail.header['X-APP-EMAIL-ID']}</dd>"
end
```

All of the available hooks can be found [here](/lib/simple_email_preview/view_hooks.rb#L10).



## Development

Run the tests:

```console
$ rspec
```

Start a development web server on [localhost:9292](http://localhost:9292):

```console
$ rake dev
```

This project rocks and uses MIT-LICENSE.

# Video notes

## 1. Installing RoR

Added a couple of extensions recommended by Chris

- Rails vscode extension (top hit if you search "rails")
- vscode-gemfile

I added both of these to devcontainer.json

## 2. How to create a new rails app

- Use `rails new .` to create the app in the current directory. App is named after current directory.
- My rails new command looked like: `rails new . --database=postgresql`.

## 11. Creating the user model

- I wonder why we are not using devise here, but excited to see how we handroll our own user sign up flow
- Nice to lean on `has_secure_password` instead of hashing passwords ourselves

# 12. Validations

- `rails db:migrate:redo` to go down then back up
- In `rails console`, use `reload!` to get latest models loaded into your session

# 14. Handling sign up errors

- I've always struggled with how strong params work but now I see it is quite simple. `registrations_controller#user_params` is a nice simple example.

# 15. Login with session cookie

- Rails has built-in support for session and signed cookies
- Session cookies can be set server-side but are tamper-proof client-side

# 16. Logging out

- Use `button_to` for logout. It will generate a form around the button. Links should not result in a delete!

# 20. Reset passwork token mailer

- Rails has [`globalid`](https://github.com/rails/globalid) feature that will allow us to generate expiring, single-use tokens without creating database records. (It is for more than this use case but will allow us to do this).
  - Models respond to `to_global_id` to get an identifier that can be used to retrieve the model. (Try `User.first.to_global_id.to_s` in the console)
  - You can generated a signed version of the global id. ActiveModels respond to [`signed_id`](https://blog.saeloun.com/2020/05/20/rails-6-1-adds-support-for-signed-ids-to-active-record.html), which can take a hash with things like `expires_at`, `purpose`, and other arbitrary data.
- Finally learned the difference between `some_path` and `some_url` helpers. The `_url` version is fully qualified. So creating a link inside an email is a good use case. When linking within the app to the app, `_path` helpers are preferred.

# 22. Password reset update

- You can drop `binding.irb` in your code to get a debugger that will drop you into an interactive session

# 27. Twitter accounts page

- `link_to` and `button_to` helpers can take an active record instance as their second argument. They will figure out the correct URL for it from there. Does this only work when using `resources` in `routes.rb`?
- I thought I could achieve this same thing with `twitter_accounts_path(twitter_account)`. However, that generated `/twitter-accounts.3`, with a period instead of a slash. Not sure what I was doing wrong there.

# 31. Tweet partial

- Rails has a localization helper, which you can simply invoke to with `l`. You can use this to localize a date.

# 32. Edit and destroy tweets

- I am realizing why you would render versus redirect_to from within a controller. If you have errors on an object that you want to be available after the submit, then you render. This lets you control the state available to the template from within the particular controller. If you don't need state to carry over, then redirect. So because of this, redirect_to should be the default to avoid creating unnecessary dependencies on data in controllers that are not directly related to a view. In other words - create will likely render to new on an error. Update will likely render to edit on an error. Beyond that, try not to do this!

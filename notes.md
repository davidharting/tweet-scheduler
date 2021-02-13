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

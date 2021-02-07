ARG VARIANT=3
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}

# Rails setup
COPY ./Gemfile /usr/src/Gemfile
RUN bundle install --gemfile=/usr/src/Gemfile
RUN rails db:create
RUN rails db:migrate
RUN rails db:test:prepare

# Node setup
ARG NODE_VERSION="lts/*"
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"

# OS-level dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql-client-11


# May need to git add remote origin ""?
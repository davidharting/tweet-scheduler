ARG VARIANT=3
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}

COPY ./Gemfile /usr/src/Gemfile
RUN bundle install --gemfile=/usr/src/Gemfile
RUN rails db:create

ARG NODE_VERSION="lts/*"
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"



FROM nacyot/elixir-elixir:0.14.1
MAINTAINER Eric West <esw9999@gmail.com>

# Set locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install base package
RUN apt-get update
RUN apt-get install -y unzip wget git curl

# Install Elixir
RUN mkdir -p /opt/phoenix
WORKDIR /opt/phoenix
RUN git clone https://github.com/phoenixframework/phoenix.git /opt/phoenix
RUN git checkout v0.2.10
RUN mix local.hex --force
RUN mix local.rebar
RUN mix do deps.get, compile

# Set default WORKDIR
WORKDIR /source

# Base the image off of Debian testing.
FROM debian:testing

# Getting the prerequisite packages.
RUN apt-get -y update && apt-get -y install ruby-dev gem-dev gem ruby xvfb firefox-esr git bundler libgl1-mesa-dri build-essential --no-install-recommends

# Update gem base and install prerequisite gems.
RUN gem update --system
RUN gem install selenium-webdriver ci_reporter cucumber selenium rspec addressable win32-service selenium-cucumber --no-rdoc --no-ri

# Setting up xvfb as a daemon.
COPY xvfb /etc/init.d/
RUN chmod a+x /etc/init.d/xvfb

# Make the base directory for our testfiles.
RUN mkdir /usr/app

# Copy the xvfb-cucumber.sh script.
COPY xvfb-cucumber.sh /usr/app
RUN chmod a+x /usr/app/xvfb-cucumber.sh

# Set our working directory.
WORKDIR /usr/app

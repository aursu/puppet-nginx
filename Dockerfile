# MANAGED BY MODULESYNC
# https://voxpupuli.org/docs/updating-files-managed-with-modulesync/

ARG rocky=9.6.20250531
FROM aursu/rockylinux:${rocky}-ruby33-puppet

WORKDIR /opt/puppet

# https://github.com/puppetlabs/puppet/blob/06ad255754a38f22fb3a22c7c4f1e2ce453d01cb/lib/puppet/provider/service/runit.rb#L39
RUN mkdir -p /etc/sv

ARG PUPPET_GEM_VERSION="~> 7.0"
ARG PARALLEL_TEST_PROCESSORS=4

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

# Cache gems
COPY Gemfile .
RUN bundle install --without system_tests development release --path=${BUNDLE_PATH:-vendor/bundle}

COPY . .

RUN bundle install
# RUN bundle exec rake release_checks

# # Container should not saved
# RUN exit 1

# MANAGED BY MODULESYNC
# https://voxpupuli.org/docs/updating-files-managed-with-modulesync/

ARG rocky=9.6.20250531
FROM aursu/rockylinux:${rocky}-ruby33-puppet

ARG platform=puppet8
ARG DNF_ENV_FILE=/dev/null
ARG AGENT_VERSION="8.15.0"
ARG BOLT_VERSION="4.0.0"
ARG PDK_VERSION="3.5.1.1"

RUN --mount=type=secret,id=forge_key,required \
        rpm -ivh https://yum-puppetcore.puppet.com/public/${platform}-release-el-9.noarch.rpm \
                https://yum.puppet.com/puppet-tools-release-el-9.noarch.rpm \
        && echo username=forge-key >> /etc/yum.repos.d/${platform}-release.repo \
        && echo 'password=$API_KEY' >> /etc/yum.repos.d/${platform}-release.repo \
        && source ${DNF_ENV_FILE} \
    && microdnf -y install \
                puppet-agent-${AGENT_VERSION} \
                puppet-bolt-${BOLT_VERSION} \
                pdk-${PDK_VERSION}

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

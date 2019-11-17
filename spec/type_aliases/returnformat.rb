require 'spec_helper'

describe 'Nginx::ReturnFormat' do
  it { is_expected.to allow_value('https://www.domain.com') }
  it { is_expected.to allow_value('http://www.domain.com') }
  it { is_expected.to allow_value(301 => 'https://www.domain.com') }
  it { is_expected.to allow_value(302 => 'http://www.domain.com') }
  it { is_expected.to allow_value(404 => 'not found') }
  it { is_expected.to allow_value(404) }

  it { is_expected.not_to allow_value('permanent redirect') }
  it { is_expected.not_to allow_value(301 => 'redirect') }
  it { is_expected.not_to allow_value(310 => 'http://www.domain.com') }
  it { is_expected.not_to allow_value(600 => 'http://www.domain.com') }
end

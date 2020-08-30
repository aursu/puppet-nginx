require 'spec_helper'

describe 'Nginx::Time' do
  it { is_expected.to allow_value('10ms') }
  it { is_expected.to allow_value('10s') }
  it { is_expected.to allow_value('10m') }
  it { is_expected.to allow_value('10h') }
  it { is_expected.to allow_value('1d') }
  it { is_expected.to allow_value('1M') }
  it { is_expected.to allow_value('1y') }

  it { is_expected.not_to allow_value(:undef) }

  # A value without a suffix means seconds. It is recommended to always specify a suffix.
  # http://nginx.org/en/docs/syntax.html
  # it { is_expected.not_to allow_value(1) }
  # it { is_expected.not_to allow_value(10) }

  it { is_expected.not_to allow_value('') }
  it { is_expected.not_to allow_value('10S') }
  it { is_expected.not_to allow_value('10.0s') }
  it { is_expected.not_to allow_value('10,0s') }
end

require 'spec_helper'

describe 'nginx::resource::config' do
  let(:title) { 'namevar' }
  let(:params) do
    {
      template: Dir.pwd + '/spec/fixtures/files/hsts.epp',
    }
  end
  let(:pre_condition) { ['include ::nginx'] }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it {
        is_expected.to contain_file('/etc/nginx/conf.d/namevar.conf')
          .with_ensure('file')
          .with_content(%r{"" "max-age=15768000";})
          .that_requires('File[/etc/nginx/conf.d]')
          .that_notifies('Service[nginx]')
      }

      context "when content is provided" do
        let :params do
          {
            content: '<html><body>It works!</body></html>',
          }
        end

        it {
          is_expected.to contain_file('/etc/nginx/conf.d/namevar.conf')
            .with_ensure('file')
            .with_content('<html><body>It works!</body></html>')
            .that_requires('File[/etc/nginx/conf.d]')
            .that_notifies('Service[nginx]')
        }
      end
    end
  end
end

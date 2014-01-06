require 'spec_helper'

describe 'ngircd' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "ngircd class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('ngircd::params') }

        it { should contain_class('ngircd::install').that_comes_before('ngircd::config') }
        it { should contain_class('ngircd::config') }
        it { should contain_class('ngircd::service').that_subscribes_to('ngircd::config') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'ngircd class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end

require 'spec_helper_acceptance'

# tomcat-3333

describe 'initscript context' do

  context 'cmd only' do

    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      initscript::service { 'democmd':
        cmd   => 'sleep 1337m',
        debug => '/democmd.log',
      }

      ->

      service { 'democmd':
        ensure => 'running',
        enable => true,
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    it "debug service" do
     expect(shell("cat /etc/init.d/democmd").exit_code).to be_zero
    end

    it "debug log" do
     expect(shell("cat /democmd.log").exit_code).to be_zero
    end

    it "process started" do
     expect(shell("ps -fea | grep [1]337m").exit_code).to be_zero
    end

  end
end

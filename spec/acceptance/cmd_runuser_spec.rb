require 'spec_helper_acceptance'

# tomcat-3333

describe 'initscript context' do

  context 'cmd with run_user' do

    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      user { 'evil':
        shell      => '/bin/bash',
        managehome => true,
      }

      ->

      initscript::service { 'evilcmd':
        cmd            => 'sleep 666m',
        run_user       => 'evil',
        debug          => '/evilcmd.log',
        define_service => true,
      }


      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    it "debug service" do
     expect(shell("cat /etc/init.d/evilcmd").exit_code).to be_zero
    end

    it "debug log" do
     expect(shell("cat /evilcmd.log").exit_code).to be_zero
    end

    it "process started" do
     expect(shell("ps -fea | grep sleep | grep [6]66 | grep evil").exit_code).to be_zero
    end

  end
end

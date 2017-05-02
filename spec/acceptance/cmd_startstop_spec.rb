require 'spec_helper_acceptance'

# tomcat-3333

describe 'initscript context' do

  context 'cmd start/stop' do

    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      initscript::service { 'democmdstart':
        cmd_start => 'nohup sleep 31173m &',
        cmd_stop  => 'pkill sleep',
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    #/etc/init.d/democmdstart
    it "debug service" do
     expect(shell("cat /etc/init.d/democmdstart").exit_code).to be_zero
    end

    it "start service" do
     expect(shell("bash -x /etc/init.d/democmdstart start").exit_code).to be_zero
    end

    it "ps started" do
     expect(shell("ps auxf").exit_code).to be_zero
    end

    it "sleep started" do
     expect(shell("ps -fea | grep [3]1173m").exit_code).to be_zero
    end

    it "stop service" do
     expect(shell("bash -x /etc/init.d/democmdstart stop").exit_code).to be_zero
    end

    it "sleep stopped" do
     expect(shell("! ps -fea | grep [3]1173m").exit_code).to be_zero
    end

  end
end

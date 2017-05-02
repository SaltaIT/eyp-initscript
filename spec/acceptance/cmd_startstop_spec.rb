require 'spec_helper_acceptance'

# tomcat-3333

describe 'initscript context' do

  context 'cmd start/stop' do

    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      initscript::service { 'democmdstart':
        cmd_start => 'sleep 31173m',
        cmd_stop  => 'pkill sleep',
      }

      ->

      service { 'democmdstart':
        ensure => 'running',
        enable => true,
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    it "sleep started" do
     expect(shell("ps -fea | grep 31173m").exit_code).to be_zero
    end

    it 'should work with no errors' do
      pp = <<-EOF

      initscript::service { 'democmdstart':
        cmd_start => 'sleep 31173m',
        cmd_stop  => 'pkill sleep',
      }

      ->

      service { 'democmdstart':
      ensure => 'stopped',
        enable => false,
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    it "sleep stopped" do
     expect(shell("! ps -fea | grep 31173m").exit_code).to be_zero
    end

  end
end

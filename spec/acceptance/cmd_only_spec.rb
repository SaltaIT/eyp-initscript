require 'spec_helper_acceptance'

# tomcat-3333

describe 'initscript context' do

  context 'cmd only' do

    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      initscript::service { 'democmd':
        cmd => 'sleep 1337m',
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

    it "process started" do
     expect(shell("ps -fea | grep 1337m").exit_code).to be_zero
    end

  end
end

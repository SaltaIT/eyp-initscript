require 'spec_helper'
describe 'initscript' do

  context 'with defaults for all parameters' do
    it { should contain_class('initscript') }
  end
end

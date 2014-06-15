require 'spec_helper'

describe 'chef server' do
  it 'passes pedant tests' do
    expect(command 'chef-server-ctl test').to return_exit_status(0)
  end
end

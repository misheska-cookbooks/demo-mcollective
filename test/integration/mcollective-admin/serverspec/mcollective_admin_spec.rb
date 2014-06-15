require 'spec_helper'

describe 'mcollective admin server' do
  it 'is running activemq' do
    expect(service 'activemq').to be_enabled
    expect(service 'activemq').to be_running
  end

  it 'listens on port 61613' do
    expect(command 'netstat -an | grep 61613').to return_stdout(/.LISTEN./)
  end

  it 'is running mcollective' do
    expect(service 'mcollective').to be_enabled
    expect(service 'mcollective').to be_running
  end
end

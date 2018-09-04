require 'messenger'

describe Messenger do

  let(:fake_client) { double(:client) }
  let(:fake_messages) { double(:messages) }
  subject(:messenger) { described_class.new(fake_client) }

  it 'send a text message to a phone number' do
    allow(fake_client).to receive(:messages).and_return(fake_messages)
    expect(fake_messages).to receive(:create)
    messenger.send_message
  end
end

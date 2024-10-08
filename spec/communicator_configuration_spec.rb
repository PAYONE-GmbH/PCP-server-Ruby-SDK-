require 'spec_helper'
require_relative '../lib/PCP-server-Ruby-SDK.rb'

RSpec.describe PCPServerSDK::CommunicatorConfiguration do
  let(:api_key) { 'test_api_key' }
  let(:api_secret) { 'test_api_secret' }
  let(:host) { 'test_host' }
  let(:config) { PCPServerSDK::CommunicatorConfiguration.new(api_key, api_secret, host) }

  describe '#initialize' do
    it 'sets api_key' do
      expect(config.api_key).to eq(api_key)
    end

    it 'sets api_secret' do
      expect(config.api_secret).to eq(api_secret)
    end

    it 'sets host' do
      expect(config.host).to eq(host)
    end
  end
end

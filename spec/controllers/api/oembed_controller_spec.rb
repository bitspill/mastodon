require 'rails_helper'

RSpec.describe Api::OEmbedController, type: :controller do
  let(:mus)  { Fabricate(:account, username: 'mus') }
  let(:status) { Fabricate(:status, text: 'Hallo world', account: mus) }

  describe 'GET #show' do
    before do
      get :show, params: { url: account_stream_entry_url(mus, status.stream_entry) }, format: :json
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end

require 'rails_helper'

RSpec.describe Service::AmazonCloudFrontController, type: :controller do

    context 'index' do
      it 'should return an empty list' do
        get :index
        assert_response 400

      end
      it 'should get product variants records' do
    		product_variant = create(:product_variant)
        get :index
        assert_response 200
        expect(response).to have_http_status(:success)
      end
    end
end

require 'swagger_helper'

describe 'Users API' do
  path '/api/users/:id/posts' do
    get 'Displays a user posts' do
      tags 'Posts'
      consumes 'application/json', 'application/xml'
      parameter user: :id, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer }
        },
        required: ['id']
      }

      response '201', 'post created' do
        let(:post) { { id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:post) { { id: 3 } }
        run_test!
      end
    end
  end
end

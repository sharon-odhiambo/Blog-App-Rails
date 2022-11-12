require 'swagger_helper'

describe 'Comments API' do
  path '/api/users/:id/posts/:id/comments' do
    post 'Creates a comment' do
      tags 'Comments'
      consumes 'application/json', 'application/xml'
      parameter user: :post, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          post_id: { type: :integer },
          text: { type: :string }
        },
        required: %w[user_id post_id text]
      }

      response '201', 'pet created' do
        let(:comment) { { user_id: 1, post_id: 1, text: 'Awesome stuff' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { text: 'Wow' } }
        run_test!
      end
    end
  end

  path '/api/users/:id/posts/:id/comments' do
    get 'Retrieves a comment' do
      tags 'Comments'
      produces 'application/json', 'application/xml'
      parameter user: :post, in: :path, type: :integer

      response '200', 'name found' do
        schema type: :object,
               properties: {
                 user_id: { type: :integer },
                 post_id: { type: :integer }
               },
               required: %w[user_id post_id]

        let(:comment) { Comment.create(user_id: 1, post_id: 1, text: 'Hi there') }
        run_test!
      end

      response '404', 'pet not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end

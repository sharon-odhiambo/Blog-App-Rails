require 'rails_helper'

RSpec.describe User, type: :model do
  the_user = User.new(
    name: 'Sharon',
    photo: 'https://via.placeholder.com/150',
    bio: 'This is my bio!',
    posts_counter: 0
  )

  context 'user validation tests' do
    it 'it should not be blank' do
      the_user.name = nil
      expect(the_user).to_not be_valid
    end

    it 'it should not be blank' do
      the_user.name = '    '
      expect(the_user).to_not be_valid
    end

    it 'accepts a string' do
      the_user.name = 'Sharon'
      expect(the_user).to be_valid
    end
  end

  context 'user posts counter test' do
    it 'it should have a value' do
      the_user.posts_counter = nil
      expect(the_user).to_not be_valid
    end

    it 'it is a positive integer' do
      the_user.posts_counter = -20.5
      expect(the_user).to_not be_valid
    end

    it 'it acccepts only integers' do
      [0, 10].each do |counter|
        the_user.posts_counter = counter
        expect(the_user).to be_valid
      end
    end
  end
end

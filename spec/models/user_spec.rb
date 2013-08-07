require 'spec_helper'

describe User do

  let(:user) { build(:user) }

  it 'is a valid instance of a user' do
    expect(user.valid?).to be_true
  end

  it 'is invalid if email is missing' do
    user.email = nil
    expect(user.invalid?).to be_true
  end

  describe 'hosted meetings' do
    let(:organizer) { create(:user) }

    it 'responds to hosted_meetings' do
      expect(organizer.hosted_meetings).to_not be_nil
    end

    context 'with no meetings hosted' do
      it 'has no meetings' do
        expect(organizer.hosted_meetings).to be_empty
      end
    end

    context 'with some meetings hosted' do
      before do
        5.times do |idx|
          Meeting.create(name: "meeting_#{idx}", start_time: Time.now, organizer_id: organizer.id)
        end
      end

      it 'has 5 hosted meetings' do
        expect(organizer.hosted_meetings.count).to eq(5)
      end
    end
  end
end
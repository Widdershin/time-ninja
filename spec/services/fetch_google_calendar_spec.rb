require 'rails_helper'

describe FetchGoogleCalendar do
  let(:user) do
    User.create(
      :email => 'ncwjohnstone@gmail.com',
      :password => 'blahblah',
      :password_confirmation => 'blahblah',
    )
  end

  before do
    allow(user).to receive(:google_ical_url).and_return("")
  end

  it "takes a user" do
    expect { FetchGoogleCalendar.new(user) }.to_not raise_error
  end

  it "returns an array of calendar events" do
    events = FetchGoogleCalendar.new(user).get
    expect(events).to be_an Array
    first_event = events[0]
    expect(first_event.summary).to be_a String
    expect(first_event.start_time).to be_a DateTime
  end
end

require 'rails_helper'

describe Calendar do
  before do
    Timecop.freeze(Date.today)
  end

  let(:appointment) { Calendar::Appointment.new(name: 'test', start_time: Time.now, duration: 30.minutes) }
  let(:appointments) { [appointment] }

  let(:calendar) do
    Calendar.new(appointments)
  end

  it "can be created" do
    expect { Calendar.new }.to_not raise_error
  end

  it "has an array of appointments" do
    expect(calendar.appointments).to eq appointments
  end

  it "can give you the next free slot" do
    appointment = calendar.next_free_time(duration: 30)
  end
end

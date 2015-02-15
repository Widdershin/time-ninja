class Calendar
  class Appointment
    attr_accessor :start_time, :duration

    def initialize(opts)
      @name = opts.fetch(:name)
      @start_time = opts.fetch(:start_time)
      @duration = opts.fetch(:duration).minutes
    end

    def overlaps?(time, duration)
      time_range.overlaps? time..time+duration
    end

    def end_time
      start_time + duration
    end

    def time_range
      start_time..end_time
    end
  end

  attr_accessor :appointments

  def initialize(appointments = [])
    @appointments = appointments
  end

  def next_free_time(duration:)
    time_to_check = Time.now

    until time_is_free?(time_to_check, duration) || time_to_check > Time.now + 7.days
      time_to_check += 10.minutes
    end

    time_to_check
  end

  private

  def time_is_free?(time, duration)
    @appointments.all? do |appointment|
      !appointment.overlaps?(time, duration)
    end
  end
end


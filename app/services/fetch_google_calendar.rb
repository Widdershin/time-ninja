require 'open-uri'

class FetchGoogleCalendar
  def initialize(user)
    @user = user
  end

  def get
    RiCal.parse(open(@user.google_ical_url)).first.events.map(&method(:map_event))
  end

  class Event
    attr_accessor :summary, :start_time, :end_time

    def initialize(opts)
      @summary = opts.fetch(:summary)
      @start_time = opts.fetch(:start_time)
      @end_time = opts.fetch(:end_time)
    end

    def time_range
      start_time..end_time
    end

    def overlaps?(time, duration)
      time_range.overlaps? time..time+duration
    end

    def to_json
      {
        title: summary,
        start: start_time,
        end: end_time,
      }
    end
  end

  private

  def map_event(raw_event)
    Event.new(
      summary: raw_event.summary,
      start_time: raw_event.start_time,
      end_time: raw_event.finish_time,
    )
  end
end


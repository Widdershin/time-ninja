class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :activities
  has_many :occurrences, through: :activities

  def google_ical_url
    "https://www.google.com/calendar/ical/ncwjohnstone%40gmail.com/private-1608baa517370be96acbc6f807f79e4d/basic.ics"
  end
end

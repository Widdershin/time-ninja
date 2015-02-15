As a user, I can have my spare time automatically managed
           I can add activities to be scheduled
           I can reschedule things and let the system figure out the rest

Models:

User
  has_many activities
  can register/login
  links with google

Activity
  A user created activity, to have occurrences scheduled
  belongs_to user
  has_many occurences

Occurence
  A scheduled activity, to be managed by the system


Services:
  ScheduleActivities
  FetchCalendar
  PushCalendar


Workflow for scheduling:
  Fetch the user's google calendar
  For a given week
    Create a number of timeblocks from the user's activities
    Fit them into the calendar (?)
    Schedule the occurences in the user's calendar
    Persist the occurences


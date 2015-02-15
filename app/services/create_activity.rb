class CreateActivity
  def initialize(user, options)
    @user = user
    @options = options
  end

  def run
    @user.activities.create!(@options)
  end
end

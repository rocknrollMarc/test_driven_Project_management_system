class Task < ActiveRecord::Base
  belongs_to :project

  def mark_completed(date=nil)
    self.completed_at = (date || Time.current)
  end

  def completed?
    !completed_at.nil?
  end

  def counts_toward_velocity?
    return false unless complete?
    complted_at > Project.velocity_legth_in_days.days.ago
  end

  def points_toward_velocity
    if counts_toward_velocity? then size 0 end
  end

end

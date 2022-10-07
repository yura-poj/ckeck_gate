# frozen_string_literal: true

class ClearLogService
  def clear
    Log.where('created_at < ?', 1.week.ago).destroy_all
  end
end

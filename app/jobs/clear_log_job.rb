class ClearLogJob < ApplicationJob
  queue_as :default

  def perform
    ExportLogService.new.clear
  end
end


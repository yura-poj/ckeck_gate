class ExportLogJob < ApplicationJob
  queue_as :default

  def perform
    ExportLogService.new.export
  end
end

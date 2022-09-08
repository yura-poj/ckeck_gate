# frozen_string_literal: true

require 'zip'

class ExportLogService
  def export
    source_path = Rails.root.join('log', "#{Rails.env}.log")
    shared_path = Rails.root.join('log', "#{Rails.env}_shared.zip")
    Zip::File.open(shared_path, create: true) { |zipfile| zipfile.add('file', File.open(source_path)) }
    File.write(source_path, '')
    Log.create.file.attach(io: File.open(shared_path),
                           filename: "Log-#{DateTime.now}.zip")
    File.delete(shared_path)
  end

  def clear
    logs = Log.where('created_at < ?', 1.week.ago)
    return false unless logs

    logs.find_each do |log|
      log.file.purge
      log.destroy
    end
  end
end

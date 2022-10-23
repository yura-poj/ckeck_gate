# frozen_string_literal: true

require 'zip'

class ExportLogService
  SOURCE_PATH = Rails.root.join('log', "#{Rails.env}.log")
  SHARED_PATH = Rails.root.join('log', "#{Rails.env}_shared.zip")

  def export
    delete_zip_file
    create_zip
    clear_source_file
    export_file
    delete_zip_file
  end

  private

  def create_zip
    Zip::File.open(SHARED_PATH, create: true) { |zipfile| zipfile.add('file', File.open(SOURCE_PATH)) }
  end

  def clear_source_file
    File.write(SOURCE_PATH, '')
  end

  def export_file
    Log.create.file.attach(io: File.open(SHARED_PATH),
                           filename: "Log-#{DateTime.now}.zip")
  end

  def delete_zip_file
    FileUtils.rm_f(SHARED_PATH)
  end
end

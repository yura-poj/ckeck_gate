# frozen_string_literal: true

require 'zip'

class ExportLogService
  def initialize
    @source_path = Rails.root.join('log', "#{Rails.env}.log")
    @shared_path = Rails.root.join('log', "#{Rails.env}_shared.zip")
  end

  def export
    create_zip
    clear_source_file
    export_file
    delete_zip_file
  end

  private

  def create_zip
    Zip::File.open(@shared_path, create: true) { |zipfile| zipfile.add('file', File.open(@source_path)) }
  end

  def clear_source_file
    File.write(@source_path, '')
  end

  def export_file
    Log.create.file.attach(io: File.open(@shared_path),
                           filename: "Log-#{DateTime.now}.zip")
  end

  def delete_zip_file
    File.delete(@shared_path)
  end
end

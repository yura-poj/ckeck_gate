class ExportLogService
  def export
    source_path = Rails.root.join('log', "#{Rails.env}.log")
    shared_path = Rails.root.join('log', "#{Rails.env}_shared.log")
    File.write(shared_path, File.read(source_path) )
    # File.delete(source_path)
  end
end

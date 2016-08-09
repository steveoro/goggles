
=begin

= Clearing tasks for internal dirs

Clears output dir (auto-generated PDF reports and so on) and upload dir.

  - Goggles framework vers.:  5.00
  - author: Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end
#-- ---------------------------------------------------------------------------
#++


namespace :clear do

  desc "Clears the app 'output' directory (if existing) contained inside /public."
  task(:output) do
    if File.directory?(ODT_OUTPUT_DIR)              # Output Directory found existing?
      puts "Clearing temp output directory..."
      FileUtils.rm( Dir.glob("#{ODT_OUTPUT_DIR}/*") )
    else                                            # Processing a file?
      puts "Temp output directory not found, nothing to do."
    end
    puts 'Done.'
  end


  desc "Clears the app 'uploads' directory (if existing) contained inside /public."
  task(:uploads) do
    if File.directory?(UPLOADS_DIR)                 # Uploads Directory found existing?
      puts "Clearing temp uploads directory..."
      FileUtils.rm( Dir.glob("#{UPLOADS_DIR}/*") )
    else                                            # Processing a file?
      puts "Temp uploads directory not found, nothing to do."
    end
    puts 'Done.'
  end
  #-- -------------------------------------------------------------------------
  #++
end

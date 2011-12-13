Dir.glob(File.dirname(__FILE__) + '/*.rb').each do |file|
  require(file)
end

Dir.glob(File.dirname(__FILE__) + '/*/*.rb').each do |controller|
  require(controller)
end
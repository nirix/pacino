Sequel::Model.plugin(:validation_helpers)
Sequel::Model.plugin(:validation_class_methods)
Sequel::Model.plugin(:hook_class_methods)
Sequel::Model.plugin(:association_pks)

Sequel.extension(:pagination)
Sequel.extension(:inflector)

Dir.glob(File.dirname(__FILE__) + '/*.rb').each do |file|
  require(file)
end
require 'dragonfly'

app = Dragonfly[:images]

# Configure to use ImageMagick, Rails defaults, and the Mongo data store
app.configure_with(:imagemagick)
app.configure_with(:rails) do |c|
  c.datastore = Dragonfly::DataStorage::MongoDataStore.new :db => Mongoid.database
end

# Allow all mongoid models to use the macro 'image_accessor'
app.define_macro_on_include(Mongoid::Document, :image_accessor)

app.datastore = Dragonfly::DataStorage::S3DataStore.new

app.datastore.configure do |c|
  c.bucket_name = 'bigbluebucket'
  c.access_key_id = 'AKIAIH2EBFOTFZM32TTA'
  c.secret_access_key = '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'
end
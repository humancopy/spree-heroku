Image.class_eval do
  attachment_definitions[:attachment] = (attachment_definitions[:attachment] || {}).merge({
    :styles => { :mini => '48x48>', :small => '100x100>', :product => '240x240>', :large => '600x600>' },
    :path => 'assets/products/:id/:style/:basename.:extension',
    :storage => 's3',
    :s3_credentials => Rails.root.join('config', 's3.yml')
  })
end

Taxon.class_eval do
  before_save :ensure_trailing_slash

  attachment_definitions[:attachment] = (attachment_definitions[:attachment] || {}).merge({
    :path => Rails.env.production? ? 'assets/taxons/:id/:style/:basename.:extension' : ':rails_root/public/assets/taxons/:id/:style/:basename.:extension',
    :storage => Rails.env.production? ? 's3' : 'filesystem',
    :s3_credentials => Rails.root.join('config', 's3.yml')
  })

  private
  def ensure_trailing_slash
    set_permalink if self.permalink.blank?
    self.permalink += "/" unless self.permalink[-1..-1] == "/"
  end
end
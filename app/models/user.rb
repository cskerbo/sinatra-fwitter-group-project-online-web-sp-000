class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  def slug
    artist_name = self.name
      slug = artist_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    self.all.detect {|u| u.slug == slug}
  end

end

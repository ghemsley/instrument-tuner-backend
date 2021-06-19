class UnsplashSearch
  attr_accessor :image_link, :image_artist, :image_artist_link

  def initialize(instrument_name)
    result = Unsplash::Photo.search(instrument_name, per_page = 1)
    self.image_link = result.first.urls.small
    self.image_artist = result.first.user.name
    self.image_artist_link = result.first.user.links.html
  end
end

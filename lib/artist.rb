class Artist
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    Artist.all << self
  end
  
  def self.all
    @@all
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(name)
    self.all.each do |ele|
      return ele if ele.name == name
    end
    self.new(name)
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end
end
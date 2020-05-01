class Artist

  attr_accessor :name

  @@all = []
  def initialize(name)
    @name = name
    @song = []
    @@all << self
  end

  def add_song(song)
   @songs << song
   song.artist = self
 end

  def self.all
    @@all
  end


end

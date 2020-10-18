class Artist
    @@all = []
    attr_accessor :name, :songs # name and songs are default attributes of each instance in the class
  
    def initialize(name)
      @name = name # initialises with artist's name
      @@all << self # stores all instances of Artist in @@all array
    end
  
    def self.all
      @@all # produces whole array of artist instances
    end
  
    def add_song(song)
      song.artist = self # argument is passed into add_song through the Song class. Before this, the Song class makes sure the Song instance belongs to the artist.
    end
  
    def songs
      Song.all.select {|song| song.artist == self} # summons the @@all from within Song, and selects all songs where the artist is the same as the Artist instance.
    end
  
    def self.find_or_create_by_name(name)
      self.find(name) ? self.find(name) : self.new(name) # self is an instance of Artist, and if the artist name can be found already, then it finds the name, otherwise creates a new one.
    end
  
    def self.find(name)
      self.all.find {|artist| artist.name == name }
    end
  
    def print_songs
      songs.each {|song| puts song.name}
    end

  end
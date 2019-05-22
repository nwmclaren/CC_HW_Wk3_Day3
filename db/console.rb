require("pry")
require_relative("../models/artist")
require_relative("../models/album")

artist1 = Artist.new({'name' => 'Depeche Mode'})
artist1.save()
artist2 = Artist.new({'name' => 'Oasis'})
artist2.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'album_name' => 'Violator',
  'album_genre' => 'Electronic'
  })
album1.save()

album2 = Album.new({
  'artist_id' => artist1.id,
  'album_name' => 'Playing the Angel',
  'album_genre' => 'Electronic'
  })
album2.save()

album3 = Album.new({
  'artist_id' => artist2.id,
  'album_name' => 'Standing on the Shoulders of Giants',
  'album_genre' => 'Rock'
  })
album3.save()

binding.pry
nil

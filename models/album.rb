class Album

  attr_accessor :album_name, :album_genre, :artist_id
    attr_reader :id

    def initialize(options)
      @album_name = options['album_name']
      @album_genre = options['album_genre']
      @id = options['id'].to_i if options['id']
      @artist_id = options['artist_id'].to_i
    end

    def save()
    sql = "INSERT INTO albums
    (
      album_name,
      album_genre,
      artist_id
    ) VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@album_name, @album_genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums_hashes = SqlRunner.run(sql)
    albums = albums_hashes.map { |album| Album.new(album) }
    return albums.map
  end

  def find_by_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    return results.map{|artist| Customer.new(artist)}
  end

  def update()
    sql = "
    UPDATE albums SET (
      album_name,
      album_genre,
      artist_id
    ) =
    (
      $1,$2, $3,
    )
    WHERE id = $4"
    values = [@album_name, @album_genre,@artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE from albums"
    SqlRunner.run(sql)
  end

end

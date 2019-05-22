require('pg')
require_relative('../db/sql_runner')

class Artist
  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id_string = result[0]['id']
    @id = id_string.to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map{ |band| Artist.new(band)}
  end

  def find_by_album()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    artist_by_album = results.map{|album| Album.new(album)}
    return artist_by_album
  end

  def update_artist()
    sql = "
    UPDATE artists SET (
      name,
    ) =
    (
      $1,
    )
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end


end

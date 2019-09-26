class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id
  

  def initialize(params = {name: name, type: type,db: db, id: id=nil})
    @name = params[:name]
    @type = params[:type]
    @id = params[:id]
    @db = params[:db]
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?,?);"
    db.execute(sql, name, type)
    
  end

  def self.find(poke_id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?;"
    pokemon = db.execute(sql, poke_id)[0]
    id = pokemon[0]
    name = pokemon[1]
    type = pokemon[2]
    params = {name: name, type: type, db: db, id: id}
    self.new(params)
  end
end


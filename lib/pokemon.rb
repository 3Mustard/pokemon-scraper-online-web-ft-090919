class Pokemon
  attr_accessor :name, :type, :id, :db
  
  def initialize(id:,name:,type:,db:)
    @name = name 
    @type = type 
    @id = id 
    @db = db
  end 
  
  def self.save(name,type,db) 
    db.execute( "INSERT INTO pokemon (name,type) VALUES ( ?, ? )", [name, type])
  end 
  
  def self.find(id,db)
    pokemon = db.execute("SELECT* FROM pokemon WHERE id = ?", id)
    self.new(id: pokemon)
  end 
end

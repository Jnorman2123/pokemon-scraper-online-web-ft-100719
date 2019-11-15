class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name =name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
<<<<<<< HEAD
    result = db.execute(sql, id)[0]
    Pokemon.new(id: result[0], name: result[1], type: result[2], db: db)
=======
    result = db.execute(sql, id)
    Pokemon.new(result[0], result[1], result[2], db)
>>>>>>> 76872fe3194a245ebfa7aafbc7dd72c501c5e945
  end
end

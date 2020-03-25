require('pg')

class Property

  attr_reader :id
  attr_accessor :address, :no_bedrooms, :status, :value

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @address = info['address']
    @no_bedrooms = info['no_bedrooms']
    @status = info['status']
    @value = info['value']
  end

  def save()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "INSERT INTO properties (address, no_bedrooms, status, value)
           VALUES ($1, $2, $3, $4)
           RETURNING *"
    values = [@address, @no_bedrooms, @status, @value]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    db.close()
  end

  def Property.all()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "SELECT * FROM properties"
    db.prepare("all", sql)
    properties = db.exec_prepared("all")
    db.close()
    return properties.map {|property| Property.new(property)}
  end

  def Property.find_by_id(id)
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "SELECT * FROM properties
           WHERE id = $1"
    values = [id]
    db.prepare("find_by_id", sql)
    properties_array = db.exec_prepared("find_by_id", values)
    db.close()
    return nil if properties_array.first() == nil
    properties_hash = properties_array[0]
    found_property = Property.new(properties_hash)
    return found_property
  end


  #OR
  # def Property.find_by_id(id)
  #   db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
  #   sql = "SELECT * FROM properties
  #          WHERE id = $1"
  #   values = [id]
  #   db.prepare("find_by_id", sql)
  #   properties = db.exec_prepared("find_by_id", values)
  #   db.close()
  #   return properties.map {|property| Property.new(property)}[0]
  # end

  def Property.find_by_address(address)
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "SELECT * FROM properties
           WHERE address = $1"
    values = [address]
    db.prepare("find_by_address", sql)
    properties_array = db.exec_prepared("find_by_address", values)
    db.close()
    return nil if properties_array.first() == nil
    properties_hash = properties_array[0]
    found_property = Property.new(properties_hash)
    return found_property
  end

  #OR
  # def Property.find_by_address(address)
  #   db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
  #   sql = "SELECT * FROM properties
  #          WHERE address = $1"
  #   values = [address]
  #   db.prepare("find_by_address", sql)
  #   properties = db.exec_prepared("find_by_address", values)
  #   db.close()
  #   return properties.map {|property| Property.new(property)}[0]
  # end

  def Property.find_by_status(status)
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "SELECT * FROM properties
           WHERE status = $1"
    values = [status]
    db.prepare("find_by_status", sql)
    properties_array = db.exec_prepared("find_by_status", values)
    db.close()
    return nil if properties_array.first() == nil
    properties_hash = properties_array[0]
    found_property = Property.new(properties_hash)
    return found_property
  end

  #OR
  # def Property.find_by_status(status)
  #   db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
  #   sql = "SELECT * FROM properties
  #          WHERE status = $1"
  #   values = [status]
  #   db.prepare("find_by_status", sql)
  #   properties = db.exec_prepared("find_by_status", values)
  #   db.close()
  #   return properties.map {|property| Property.new(property)}[0]
  # end

  def Property.find_by_value_range(value1, value2)
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "SELECT * FROM properties
           WHERE value >= $1
           AND value <= $2"
    values = [value1, value2]
    db.prepare("find_by_value_range", sql)
    properties = db.exec_prepared("find_by_value_range", values)
    db.close()
    return properties.map {|property| Property.new(property)}
  end

  def update()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "UPDATE properties
           SET (address, no_bedrooms, status, value)
           = ($1, $2, $3, $4)
           WHERE id = $5"
    values = [@address, @no_bedrooms, @status, @value, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def Property.delete_all()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "DELETE FROM properties"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def delete()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "DELETE FROM properties
           WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

end

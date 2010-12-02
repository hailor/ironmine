class Irm::DataStorage
  include Singleton

  def get(key)
    storage[key.to_sym]
  end

  def put(key,value)
    storage[key.to_sym] =  value
  end

  private
  def storage
    $storage ||={}
  end
end
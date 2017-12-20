class Collection
  attr_accessor :name

  attr_accessor :description

  attr_accessor :id

  attr_accessor :collection_id


  def initialize(id, name, description)
    @name = name
    @description = description
  end

  def set_api_id(id)
    @id = id
  end
end
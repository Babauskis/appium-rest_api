require 'date'

class Project
  attr_accessor :name

  attr_accessor :type

  attr_accessor :id


  def initialize(id, name, type)
    if name == ''
      @name = 'REST_API' + DateTime.now.strftime('%Q')
    else
      @name = name
    end
    @type = type
  end

  def set_project_id(id)
    @id = id
  end
end
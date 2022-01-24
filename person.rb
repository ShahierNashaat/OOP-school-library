class Person
  attr_reader :id
  attr_accessor :name, age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return true if of_age? || @parent_permission
  end

  private

  def of_age?
    return true if @age >= 10

    false
  end
end

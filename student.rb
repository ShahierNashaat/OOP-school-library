require './person'
require './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(age:, name: 'Unknown', parent_permission: true, classroom: nil)
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def join_classroom(value)
    @classroom = value
    value.students.push(self) unless value.students.include?(self)
  end
end

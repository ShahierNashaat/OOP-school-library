require './student'
require './teacher'
require './book'
require './rental'
require 'json'

module DataController
  def load_peoble
    file = 'people.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file).to_json).each do |element|
        if element.data_type == 'Teacher'
          data.push(Teacher.new(id: element.id, age: element.age, specialization: element.specialization,
                                name: element.name))
        else
          data.push(Student.new(id: element.id, age: element.age, name: element.name,
                                parent_permission: element.parent_permission))
        end
      end
    end
    data
  end

  def load_books
    file = 'books.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file).to_json).each do |element|
        data.push(Book.new(element.title, element.author))
      end
    end
    data
  end

  def get_person_by_id(id)
    @persons.map { |element| element.id == id }
  end

  def get_book_by_title(title)
    @books.map { |_elemet| element.title == title }
  end

  def load_rentals
    file = 'rentals.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file).to_json).each do |element|
        person = get_person_by_id(element.person_id)
        book = get_book_by_title(element.book_title)
        data.push(Rental.new(element.date, book, person))
      end
    end
    data
  end
end

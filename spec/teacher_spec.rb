require './teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new age: 30, name: 'Teacher', specialization: 'Chemistery'
  end

  it 'should detect the teacher age' do
    expect(@teacher.age).to eq 30
  end

  it 'should detect the teacher name' do
    expect(@teacher.name).to eq 'Teacher'
  end

  it 'should detect the teacher rentals' do
    book = Book.new 'Title', 'Author'
    Rental.new('2022-01-25', book, @teacher)
    expect(@teacher.rentals.length).to eq 1
  end
end

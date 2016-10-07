# frozen_string_literal: true

class Garden
  DEFAULT_STUDENTS = %w( Alice Bob Charlie David Eve Fred Ginny
                         Harriet Ileana Joseph Kincaid Larry).freeze
  PLANT_COUNT_EACH_ROW_EACH_STUDENT = 2
  PLANTS = { 'C' => :clover,
             'V' => :violets,
             'R' => :radishes,
             'G' => :grass }.freeze

  def initialize(diagram, students = nil)
    create_student_hash(students || DEFAULT_STUDENTS)
    student_methods
    assign_plants(diagram)
  end

  def student_methods
    @students.keys.each do |name|
      self.class.send(:define_method, name.downcase) do
        student_plants = []
        @students[name].each do |plant|
          student_plants << PLANTS[plant]
        end
        student_plants
      end
    end
  end

  private

  def assign_plants(diagram)
    first_row, second_row = separate_rows(diagram)
    @students.each_key do |key|
      @students[key] = take_first_two(first_row) + take_first_two(second_row)
      first_row = drop_first_two(first_row)
      second_row = drop_first_two(second_row)
      break if remaining_plant(first_row) < 1
    end
  end

  def separate_rows(diagram)
    first, second = diagram.split("\n")
    [first.split(''), second.split('')]
  end

  def remaining_plant(row)
    row.size
  end

  def drop_first_two(row)
    row.drop(PLANT_COUNT_EACH_ROW_EACH_STUDENT)
  end

  def take_first_two(row)
    row.take(PLANT_COUNT_EACH_ROW_EACH_STUDENT)
  end

  def create_student_hash(student_names)
    @students = Hash[student_names.sort.map { |name| [name.downcase, nil] }]
  end
end

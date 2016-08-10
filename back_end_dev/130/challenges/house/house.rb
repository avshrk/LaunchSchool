require 'byebug'

class House
  THIS_IS = 'This is '

  def self.recite
    @rhyme = ''
    max_index = pieces.size - 1

    max_index.downto(0) do |index_down|
      @rhyme << subject_line(line_at(index_down))
      index_down.upto(max_index) do |index_up|
        @rhyme << action_line(line_at(index_up), line_at(index_up + 1))  if line_at(index_up + 1)
      end
        @rhyme << new_line
    end
    @rhyme.chomp
  end

  def self.line_at(index)
     pieces[index]
  end

  def self.action_line(line, pre_line)
    action(line) + one_space + subject(pre_line) + new_line
  end

  def self.subject_line(line)
   THIS_IS + subject(line) + new_line
  end

  def self.one_space
    ' '
  end

  def self.new_line
    "\n"
  end

  def self.subject(line)
    line[0]
  end

  def self.action(line)
    return nil if line.size < 2
    line[1]
  end

  private
  def self.pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built.']
    ]
  end
end

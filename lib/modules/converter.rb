module Converter
  def convert_to_indexes(key)
    letters = {
      'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3,
      'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7
    }

    numbers = {
      '1' => 7, '2' => 6, '3' => 5, '4' => 4,
      '5' => 3, '6' => 2, '7' => 1, '8' => 0
    }

    letter = letters[key[0]]
    number = numbers[key[1]]

    return nil if letter.nil? or number.nil?

    [number, letter]
  end

  def convert_to_key(index)
    return nil unless index.length.equal?(2)

    letters = {
      0 => 'a', 1 => 'b', 2 => 'c', 3 => 'd',
      4 => 'e', 5 => 'f', 6 => 'g', 7 => 'h'
    }

    numbers = {
      0 => '8', 1 => '7', 2 => '6', 3 => '5',
      4 => '4', 5 => '3', 6 => '2', 7 => '1'
    }
    number = numbers[index[0]]
    letter = letters[index[1]]

    return nil if number.nil? or letter.nil?

    "#{letter}#{number}"
  end
end

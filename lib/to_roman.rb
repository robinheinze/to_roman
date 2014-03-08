class Integer

  def to_roman
    raise ArgumentError, 'Inputted number is out of range' unless self < 4000 && self > 0

    ones_numerals = {1 => 'I', 5 => 'V', 0 => ''}
    tens_numerals = {1 => 'X', 5 => 'L', 0 => ''}
    hundreds_numerals = {1 => 'C', 5 => 'D', 0 => ''}
    thousands_numerals = {1 => 'M', 0 => ''}
    magnitudes = [ones_numerals, tens_numerals, hundreds_numerals, thousands_numerals]
    result = []

    number_array = self.to_s.split('').reverse.collect { |a| a.to_i }
    until number_array.length == 4
      number_array << 0
    end

    number_array.each_with_index do |digit, index|
      if digit == 5 
        place =  magnitudes[index][5] 
      elsif digit < 9 && digit > 5
        place = magnitudes[index][5] + magnitudes[index][1] * (digit - 5)
      elsif digit < 4
        place = magnitudes[index][1] * digit
      elsif digit == 4
        place = magnitudes[index][1] + magnitudes[index][5] 
      elsif digit == 9
        place = magnitudes[index][1] + magnitudes[index + 1][1]
      end
      result << place
    end

    result.reverse.join('')

  end
end

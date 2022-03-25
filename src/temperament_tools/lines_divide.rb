=begin
Author: Mark D. Blackwell
=end

module Temperament_Tools
  module Lines_Divide
    extend self

    private_class_method def divide
      readlines.map{|e| pair(e)}.transpose
    end

    private_class_method def pair(raw)
# TODO: use regular expression.
      line = raw.chomp
      separator = '!'
      if line == separator
        apart = ['', '']
      else
        apart = line.split(separator)
        apart.push('') if line.end_with?(separator)
      end
      segments = apart.reverse
      case segments.length
      when 0
        before = ''
        after = ''
      when 1
        before = segments.join('')
        after = ''
      else
        before = segments.pop
        after = segments.reverse.join(separator).prepend(separator)
      end
      [before, after]
    end

    private_class_method def display(a)
      a.each_with_index{|e, i| puts "#{i.succ} (#{e.length}): #{e}"}
      nil
    end

    def run
      before, after = divide
      puts 'Before comments:'
      display before
      puts 'Comments:'
      display after
      nil
    end
  end
end

::Temperament_Tools::Lines_Divide.run

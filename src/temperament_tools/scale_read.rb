=begin
Author: Mark D. Blackwell
=end

require_relative 'share/share.rb'

module Temperament_Tools
  module Scale_Read
    extend ::Temperament_Tools::Share
    extend self

    def run
      header_process
      values_process
      puts mirror
      nil
    end

    private_class_method def values_process
      until lines_input.empty? do
        line = lines_input.pop
# Print the scale values:
        blob = blob_first(line)
        if blob.empty?
          mirror.push line
          next
        end
        unless blob.match(digits_dot_regexp).to_s.empty?
          mirror.push " #{blob.to_f}"
          next
        end
        a = blob.split('/')
        s = [a.first, '/', a.last].join('')
        mirror.push " #{s}"
      end
      nil
    end
  end
end

::Temperament_Tools::Scale_Read.run

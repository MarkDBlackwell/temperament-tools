=begin
Author: Mark D. Blackwell
=end

require_relative 'share/share.rb'

module Temperament_Tools
  module Scale_To_Fifths
    extend ::Temperament_Tools::Share
    extend self

    private_class_method def line_value(line)
      blob = blob_first(line)
      return nil if blob.empty?
      return blob.to_f unless blob.match(digits_dot_regexp).to_s.empty?
      return blob if blob.start_with?('-')
      a = blob.split('/').map{|e| e.to_f}
      ratio = a.first / a.last
      ::Math.log2(ratio) * 1200
    end

    def run
      header_process
      values_process
      puts mirror
      nil
    end

    private_class_method def values_process
      until lines_input.empty? do
        line = lines_input.pop
# For now, print the scale values:
        value = line_value(line)
        unless value
          mirror.push line
        else
          mirror.push " #{value}"
        end
      end
      nil
    end
  end
end

::Temperament_Tools::Scale_To_Fifths.run

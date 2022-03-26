=begin
Author: Mark D. Blackwell
=end

require_relative 'share/share.rb'

module Temperament_Tools
  module Lines_Divide
    extend ::Temperament_Tools::Share
    extend self

    private_class_method def display(a)
      a.each_with_index{|e, i| puts "#{i.succ} (#{e.length}): #{e}"}
      nil
    end

    def run
      before, after = scale_file_divide
      puts 'Before comments:'
      display before
      puts 'Comments:'
      display after
      nil
    end
  end
end

::Temperament_Tools::Lines_Divide.run

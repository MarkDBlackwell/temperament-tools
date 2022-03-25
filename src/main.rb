=begin
Author: Mark D. Blackwell
See:
  http://huygens-fokker.org/scala/scl_format.html
=end

def main(s)
  case s
  when 'scale_read'
    require_relative 'scale_read.rb'
  when 'scale_to_fifths'
    require_relative 'scale_to_fifths.rb'
  when 'twelve_select'
    require_relative 'twelve_select.rb'
  end
  nil
end

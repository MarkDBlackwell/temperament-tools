=begin
Author: Mark D. Blackwell
=end

module Temperament_Tools
  module Share
    extend self

    private_class_method def blob_complete(blob)
      digits_separator_digits = blob.match(digits_separator_digits_regexp).to_s
      return digits_separator_digits unless digits_separator_digits.empty?

      digits_dot = blob.match(digits_dot_regexp).to_s
      return digits_dot unless digits_dot.empty?

      digits_slash = blob.match(digits_slash_regexp).to_s
      return digits_slash.concat('1') unless digits_slash.empty?

      digits = blob.match(digits_regexp).to_s
      return digits.concat('/1') unless digits.empty?
      digits
    end

    def blob_first(line)
      first = line.split(' ').push('').first
      characters = first.match(pitch_character_regexp).to_s
      blob_complete(characters)
    end

    private_class_method def comment_indicator_regexp
      @comment_indicator_regexp ||= ::Regexp.new( /^\s*+!/ )
    end

    def digits_dot_regexp
      @digits_dot_regexp ||= ::Regexp.new( /^-?+\d++\./ )
    end

    private_class_method def digits_regexp
      @digits_regexp ||= ::Regexp.new( /^-?+\d++/ )
    end

    private_class_method def digits_separator_digits_regexp
      @digits_separator_digits_regexp ||= ::Regexp.new( /^-?+\d++[.\/]\d++/ )
    end

    private_class_method def digits_slash_regexp
      @digits_slash_regexp ||= ::Regexp.new( /^-?+\d++\// )
    end

    private_class_method def header_length
      @header_length ||= 2
    end

    def header_process
      position = 0
      until lines_input.empty? do
        line = lines_input.pop
        is_comment = line.match(comment_indicator_regexp)
# Echo comment lines:
        if is_comment
          mirror.push line
          next
        end
# Handle non-comment lines:
        position += 1
        mirror.push line if position <= header_length
        if header_length == position
          n = line.to_i
          msg = "Number of notes announced in header: '#{n}' isn't required value of #{number_of_notes_required}."
          ::Kernel.abort(msg) unless number_of_notes_required == n
        end
        if position > header_length
          lines_input.push line
          break
        end
      end
      nil
    end

    def lines_input
      @lines_input ||= scale_lines.reverse
    end

    def mirror
      @mirror ||= Array.new
    end

    private_class_method def number_of_notes_required
      @number_of_notes_required ||= 12
    end

    private_class_method def pitch_character_regexp
      @pitch_character_regexp ||= ::Regexp.new( /^[-.\d\/]*+/ )
    end

    def scale_file_divide
      scale_lines.map{|e| scale_line_divide(e)}.transpose
    end

    private_class_method def scale_line_divide(line)
      line.match(scale_line_divide_regexp).captures
    end

    private_class_method def scale_line_divide_regexp
      @scale_line_divide_regexp ||= ::Regexp.new( /([^!]*)(.*)/ )
    end

    private_class_method def scale_lines
      @scale_lines ||= readlines.map(&:chomp)
    end
  end
end

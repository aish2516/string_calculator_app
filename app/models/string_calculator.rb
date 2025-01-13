class StringCalculator

	def add(numbers)
	    # Return 0 for empty or blank input
	    numbers = numbers.gsub("\\n", "\n")
	    return 0 if numbers.strip.empty?

	    delimiter = /,|\n/ # Default delimiters: comma and newline

	    # Handle custom delimiters
	    if numbers.start_with?("//")
	      match = numbers.match(/^\/\/(.+)\n/)
	      if match
	        custom_delimiter = Regexp.escape(match[1]) # Escape special characters in the custom delimiter
	        delimiter = /#{custom_delimiter}|,|\n/ # Include custom delimiter along with default ones
	        numbers = numbers.sub(/^\/\/.+\n/, '') # Remove the custom delimiter line from input
	      end
	    end

	    # Split numbers by the determined delimiter
	    nums = numbers.split(delimiter).map(&:to_i)

	    # Identify negative numbers
	    negatives = nums.select { |num| num < 0 }

	    # Raise an exception if any negative numbers are found
	    unless negatives.empty?
	      raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}"
	    end

	    # Calculate and return the sum
	    nums.sum
  end
end
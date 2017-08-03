class string_based
	def interger?
		return true if self =~ /^[1-9]\d*(\.\d+)?$/
	end
end		

module Tippy

	class Builder
		def initialize total:, gratuity:
			@total = total
			@gratuity = gratuity
		end 	
	end

	def generate
		return calculation if number_based?
		string_based
	end	

	def number_based?
		(@gratuity.is_a? Numeric) || (@gratuity.interger?) 
	end	

	def string_based?
		case @gratuity.downcase
			when 'high'	then calculation 25
			when 'standard'	then calculation 18
			when 'low'	then calculation 15
		end
	end

	def calculation gratuit = @gratuity
		@total += @total * (@gratuity.to_f / 100)
	end	
end
class Sorting

	def initialize

		@storage1 = []
		@storage2 = []
		@storage3 = []
		@storage4 = []
		@storage5 = []
		@left_over_kids = []
		@results = []

	end

def fill(array_of_students, arrary_of_limits, array_of_classnames)


	array_of_students.each do |student|

		# print student
		# puts student[4][-1].to_i

		if student[4] == nil
			puts "error"
		elsif student[4][-1].to_i == 1
			@storage1.push(student)
		elsif student[4][-1].to_i == 2
			@storage2.push(student)
		elsif student[4][-1].to_i == 3
			# puts "hello"
			@storage3.push(student)
		elsif student[4][-1].to_i == 4
			@storage4.push(student)
		elsif student[4][-1].to_i == 5
			@storage5.push(student)
		end
	end

	results = [@storage1,@storage2,@storage3,@storage4,@storage5,@left_over_kids]

	return results
end

def left_overs(array_of_students, array_of_limits, array_of_classnames)

	if @storage1.length > array_of_limits[1].to_i
		@storage1 = @storage1.shuffle
		@left_over_kids << @storage1.drop(array_of_limits[1].to_i)
		@storage1 = @storage1 - @storage1.drop(array_of_limits[1].to_i)
	elsif @storage2.length > array_of_limits[2].to_i
		@storage2 = @storage2.shuffle
		@left_over_kids << @storage2.drop(array_of_limits[2].to_i)
		@storage2 = @storage2 - @storage2.drop(array_of_limits[2].to_i)
	elsif @storage3.length > array_of_limits[3].to_i
		@storage3 = @storage3.shuffle
		@left_over_kids << @storage3.drop(array_of_limits[3].to_i)
		@storage3 = @storage3 - @storage3.drop(array_of_limits[3].to_i)
	elsif @storage4.length > array_of_limits[4].to_i
		@storage4 = @storage4.shuffle
		@left_over_kids << @storage4.drop(array_of_limits[4].to_i)
		@storage4 = @storage4 - @storage4.drop(array_of_limits[4].to_i)
	elsif @storage5.length > array_of_limits[5].to_i
		@storage5 = @storage5.shuffle
		@left_over_kids << @storage5.drop(array_of_limits[5].to_i)
		@storage5 = @storage5 - @storage5.drop(array_of_limits[5].to_i)
	end

#----------------trying to refactor using concatonation---------
	# counter = 1

	# array_of_limits = array_of_limits.drop(1)

	# array_of_limits.each do |limit|

	# 	if @storage"#{counter}" > limit.to_i
	# 		@storage"#{counter}" = @storage"#{counter}".shuffle
	# 		@left_over_kids << @storage"#{counter}".drop(limit.to_i)
	# 		@storage"#{counter}" = @storage"#{counter}" - @storage"#{counter}".drop(limit)
	# 	end

	# 	counter += 1
	# end

	results = [@storage1,@storage2,@storage3,@storage4,@storage5,@left_over_kids]

	return results

end

def sort(array_of_students, array_of_limits, array_of_classnames)

	@left_over_kids.flatten!(1)

	# print @left_over_kids

	if @left_over_kids.length != 0 
		
		@left_over_kids.each do |student|
			if (student[5][-1].to_i == 1) && (@storage1.length < array_of_limits[1].to_i)

				@storage1.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids

			elsif (student[5][-1].to_i == 2) && (@storage2.length < array_of_limits[2].to_i)

				@storage2.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids

			elsif (student[5][-1].to_i == 3) && (@storage3.length < array_of_limits[3].to_i)

				@storage3.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids

			elsif (student[5][-1].to_i == 4) && (@storage4.length < array_of_limits[4].to_i)

				@storage4.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids

			elsif (student[5][-1].to_i == 5) && (@storage5.length < array_of_limits[5].to_i)

				@storage5.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids
			end

		end
	end

	if @left_over_kids.length != 0
		

		@left_over_kids.each do |student|
			if (student[6][-1].to_i == 1) && (@storage1.length < array_of_limits[1].to_i)

				@storage1.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids

			elsif (student[6][-1].to_i == 2) && (@storage2.length < array_of_limits[2].to_i)

				@storage2.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids

			elsif (student[6][-1].to_i == 3) && (@storage3.length < array_of_limits[3].to_i)

				@storage3.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids

			elsif (student[6][-1].to_i == 4) && (@storage4.length < array_of_limits[4].to_i)

				@storage4.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids

			elsif (student[6][-1].to_i == 5) && (@storage5.length < array_of_limits[5].to_i)

				@storage5.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids
				
				
			end

		end
	end

	if @left_over_kids.length != 0
		

		@left_over_kids.each do |student|
			if (student[7][-1].to_i == 1) && (@storage1.length < array_of_limits[1].to_i)

				@storage1.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids

			elsif (student[7][-1].to_i == 2) && (@storage2.length < array_of_limits[2].to_i)

				@storage2.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids

			elsif (student[7][-1].to_i == 3) && (@storage3.length < array_of_limits[3].to_i)

				@storage3.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids

			elsif (student[7][-1].to_i == 4) && (@storage4.length < array_of_limits[4].to_i)

				@storage4.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids

			elsif (student[7][-1].to_i == 5) && (@storage5.length < array_of_limits[5].to_i)

				@storage5.push(student)
				@left_over_kids.delete(student)
				@left_over_kids = @left_over_kids
			end

		end
	end


	if @left_over_kids.length != 0
	
		@left_over_kids.each do |student|
			if (student[8][-1].to_i == 1) && (@storage1.length < array_of_limits[1].to_i)
				@storage1.push(student)
				@left_over_kids = @left_over_kids.delete(student)
			elsif (student[8][-1].to_i == 2) && (@storage2.length < array_of_limits[2].to_i)
				@storage2.push(student)
				@left_over_kids = @left_over_kids.delete(student)
			elsif (student[8][-1].to_i == 3) && (@storage3.length < array_of_limits[3].to_i)
				@storage3.push(student)
				@left_over_kids = @left_over_kids.delete(student)
			elsif (student[8][-1].to_i == 4) && (@storage4.length < array_of_limits[4].to_i)
				@storage4.push(student)
				@left_over_kids = @left_over_kids.delete(student)
			elsif (student[8][-1].to_i == 5) && (@storage5.length < array_of_limits[5].to_i)
				@storage5.push(student)
				@left_over_kids = @left_over_kids.delete(student)
			end

		end
	end


	results = [@storage1,@storage2,@storage3,@storage4,@storage5,@left_over_kids]

	return results

end

end

# ["1", "Max", "P", "Pokropowicz", nil, nil, nil, nil, nil] -----test for nil values

@arr_students = [["2", "Brain", "T", "Jewis", "class3", "class2", "class4", "class5", "class1"], ["3", "Cole", "F", "Pokropowicz", "class3", "class4", "class5", "class1", "class2"],["2", "Max", "Q", "Pokropowicz", "class1", "class2", "class4", "class5", "class3"],["2", "Coleen", "R", "Krenichen", "class2", "class3", "class4", "class5", "class1"],["2", "Brian", "T", "Lewis", "class4", "class5", "class3", "class2", "class1"],["2", "Gabe", "T", "Newell", "class3", "class5", "class4", "class2", "class1"]]

@arr_limits = ["1", "1", "1", "2", "1", "1"]

@arr_clnames = ["2", "math", "physx", "calc", "art", "music"]


mysorting = Sorting.new

@results = mysorting.fill(@arr_students, @arr_limits, @arr_clnames)

@results = mysorting.left_overs(@arr_students, @arr_limits, @arr_clnames)

@results = mysorting.sort(@arr_students, @arr_limits, @arr_clnames)


counter = 1
@results.each do |storage|
	print "#{@arr_clnames[counter]}: "
	storage.each do |student|
		print "#{student[1]} #{student[2]} #{student[3]}, "
	end
	counter += 1
	print "\n"
end
# print @storage3

# print "\n"
# print "\n"

# puts "#{@arr_clnames[1]}: #{@results[0]}"
# print "\n"

# puts "#{@arr_clnames[2]}: #{@results[1]}"
# print "\n"

# puts "#{@arr_clnames[3]}: #{@results[2]}"
# print "\n"

# puts "#{@arr_clnames[4]}: #{@results[3]}"
# print "\n"

# puts "#{@arr_clnames[5]}: #{@results[4]}"
# print "\n"

# puts "Left over Kids: #{@results[5]}"

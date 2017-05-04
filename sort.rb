arr_students = [["1", "Max", "P", "Pokropowicz", nil, nil, nil, nil, nil], ["2", "Brain", "T", "Jewis", "class3", "class2", "class4", "class5", "class1"], ["3", "Cole", "F", "Pokropowicz", "class3", "class4", "class5", "class1", "class2"]]

arr_limits = ["1", "3", "5", "4", "1", "2"]

arr_clnames = ["2", "math", "physx", "calc", "art", "music"]

class Sorting

	def initialize

		@storage1 = []
		@storage2 = []
		@storage3 = []
		@storage4 = []
		@storage5 = []
		@left_over_kids = []
		@combined_returned = []

	end

def fill(array_of_students, arrary_of_limits, array_of_classnames)

	array_of_students.times do |student|

		if student[4][-1].to_i == 1
			@storage1.push(student)
		elsif student[4][-1].to_i == 2
			@storage2.push(student)
		elsif student[4][-1].to_i == 3
			@storage3.push(student)
		elsif student[4][-1].to_i == 4
			@storage4.push(student)
		elsif student[4][-1].to_i == 5
			@storage5.push(student)
	end
end

def left_overs(array_of_students, arrary_of_limits, array_of_classnames)

	if @storage1 > array_of_limits[1].to_i
		@storage1 = @storage1.shuffle
		@left_over_kids << @storage1.drop(array_of_limits[1].to_i)
		@storage1 = @storage1 - @storage1.drop(array_of_limits[1].to_i)
	elsif @storage2 > array_of_limits[2].to_i
		@storage2 = @storage2.shuffle
		@left_over_kids << @storage2.drop(array_of_limits[2].to_i)
		@storage2 = @storage2 - @storage2.drop(array_of_limits[2].to_i)
	elsif @storage3 > array_of_limits[3].to_i
		@storage3 = @storage3.shuffle
		@left_over_kids << @storage3.drop(array_of_limits[3].to_i)
		@storage3 = @storage3 - @storage3.drop(array_of_limits[3].to_i)
	elsif @storage4 > array_of_limits[4].to_i
		@storage4 = @storage4.shuffle
		@left_over_kids << @storage4.drop(array_of_limits[4].to_i)
		@storage4 = @storage4 - @storage4.drop(array_of_limits[4].to_i)
	elsif @storage5 > array_of_limits[5].to_i
		@storage5 = @storage5.shuffle
		@left_over_kids << @storage5.drop(array_of_limits[5].to_i)
		@storage5 = @storage5 - @storage5.drop(array_of_limits[5].to_i)
	end

#----------------trying to refactor using concatonation---------
	# counter = 1

	# array_of_limits = array_of_limits.drop(1)

	# array_of_limits.times do |limit|

	# 	if @storage"#{counter}" > limit.to_i
	# 		@storage"#{counter}" = @storage"#{counter}".shuffle
	# 		@left_over_kids << @storage"#{counter}".drop(limit.to_i)
	# 		@storage"#{counter}" = @storage"#{counter}" - @storage"#{counter}".drop(limit)
	# 	end

	# 	counter += 1
	# end

end

def sort(array_of_students, arrary_of_limits, array_of_classnames)

	@left_over_kids.times do |student|
		if (student[5][-1].to_i == 1) && (@storage1.length < array_of_limits[1].to_i)
			@storage1.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		elsif (student[5][-1].to_i == 2) && (@storage2.length < array_of_limits[2].to_i)
			@storage2.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		elsif (student[5][-1].to_i == 3) && (@storage3.length < array_of_limits[3].to_i)
			@storage3.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		elsif (student[5][-1].to_i == 4) && (@storage4.length < array_of_limits[4].to_i)
			@storage4.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		elsif (student[5][-1].to_i == 5) && (@storage5.length < array_of_limits[5].to_i)
			@storage5.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		end

	end

	@left_over_kids.times do |student|
		if (student[6][-1].to_i == 1) && (@storage1.length < array_of_limits[1].to_i)
			@storage1.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		elsif (student[6][-1].to_i == 2) && (@storage2.length < array_of_limits[2].to_i)
			@storage2.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		elsif (student[6][-1].to_i == 3) && (@storage3.length < array_of_limits[3].to_i)
			@storage3.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		elsif (student[6][-1].to_i == 4) && (@storage4.length < array_of_limits[4].to_i)
			@storage4.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		elsif (student[6][-1].to_i == 5) && (@storage5.length < array_of_limits[5].to_i)
			@storage5.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		end

	end

	@left_over_kids.times do |student|
		if (student[7][-1].to_i == 1) && (@storage1.length < array_of_limits[1].to_i)
			@storage1.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		elsif (student[7][-1].to_i == 2) && (@storage2.length < array_of_limits[2].to_i)
			@storage2.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		elsif (student[7][-1].to_i == 3) && (@storage3.length < array_of_limits[3].to_i)
			@storage3.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		elsif (student[7][-1].to_i == 4) && (@storage4.length < array_of_limits[4].to_i)
			@storage4.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		elsif (student[7][-1].to_i == 5) && (@storage5.length < array_of_limits[5].to_i)
			@storage5.push(student)
			@left_over_kids = @left_over_kids.delete(student)
		end

	end

	@left_over_kids.times do |student|
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

end

mysorting = Sorting.new
mysorting.fill(array_of_students, arr_limits, arr_clnames)
mysorting.left_overs(array_of_students, arr_limits, arr_clnames)
mysorting.sort(array_of_students, arr_limits, arr_clnames)

puts "#{arr_clnames[1]}: #{@storage1}"
print "\n"

puts "#{arr_clnames[2]}: #{@storage2}"
print "\n"

puts "#{arr_clnames[3]}: #{@storage3}"
print "\n"

puts "#{arr_clnames[4]}: #{@storage4}"
print "\n"

puts "#{arr_clnames[5]}: #{@storage5}"
print "\n"

puts "Left over Kids: #{@left_over_kids}"

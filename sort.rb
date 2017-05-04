[["1", "Max", "P", "Pokropowicz", nil, nil, nil, nil, nil, nil, nil], ["2", "Brain", "T", "Jewis", "class3", "class2", "class4", "class6", "class1", "class7", "class5"], ["3", "Cole", "F", "Pokropowicz", "class3", "class4", "class7", "class1", "class2", "class5", "class6"]]

[["1", "3", "5", "4", "1", "7", "3", "2"]

["2", "math", "physx", "calc", "art", "music", "geo", "tf2"]

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

		if student[4] == 1
			@storage1.push(student)
		elsif student[4] == 2
			@storage2.push(student)
		elsif student[4] == 3
			@storage3.push(student)
		elsif student[4] == 4
			@storage4.push(student)
		elsif student[4] == 5
			@storage5.push(student)
	end
end

def left_overs(array_of_students, arrary_of_limits, array_of_classnames)

	counter = 1

	array_of_limits = array_of_limits.drop(1)

	array_of_limits.times do |limit|
		if @storage"#{counter}" > limit.to_i
			@storage"#{counter}" = @storage"#{counter}".shuffle
			@left_over_kids << @storage"#{counter}"
	end

end




end

end
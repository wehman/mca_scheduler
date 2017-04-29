student1 = { "1" => 5, "2" => 2, "3" => 1, "4" => 3, "5" => 4 }
student2 = { "1" => 2, "2" => 1, "3" => 3, "4" => 5, "5" => 4 }
student3 = { "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5 }
student4 = { "1" => 4, "2" => 2, "3" => 1, "4" => 3, "5" => 5 }
student5 = { "1" => 1, "2" => 3, "3" => 2, "4" => 5, "5" => 4 }
student6 = { "1" => 1, "2" => 3, "3" => 5, "4" => 2, "5" => 4 }

classes = [{"classes" => student1},{"classes" => student2}, {"classes" => student3}, {"classes" => student4}, {"classes" => student5}, {"classes" => student6}]

@storage1 = []
@storage2 = []
@storage3 = []
@storage4 = []
@storage5 = []


def sort(array_of_classes, limit)

	total_students = array_of_classes.length
	total_classes = array_of_classes[0]["classes"].length
	@left_over_kids = []

		total_students.times do |x|
			roster = array_of_classes[x]

			if roster['classes']["1"] == 1
				@storage1.push(roster["classes"])
			elsif roster['classes']["1"] == 2
				@storage2.push(roster["classes"])
			elsif roster['classes']["1"] == 3
				@storage3.push(roster["classes"])
			elsif roster['classes']["1"] == 4
				@storage4.push(roster["classes"])
			elsif roster['classes']["1"] == 5
				@storage5.push(roster["classes"])
			end
		end

		puts "Storage 1:#{@storage1}"
		puts "Storage 2:#{@storage2}"
		puts "Storage 3:#{@storage3}"
		puts "Storage 4:#{@storage4}"
		puts "Storage 5:#{@storage5}"
		print "\n"
		print "\n"

		if @storage1.length > limit
			@storage1 = @storage1.shuffle
			@left_over_kids << @storage1.drop(limit)		# << means .push
			@storage1 = @storage1 - @storage1.drop(limit)
		end

		if @storage2.length > limit
			@storage2 = @storage2.shuffle
			@left_over_kids << @storage2.drop(limit)
			@storage2 = @storage2 - @storage2.drop(limit)
		end

		if @storage3.length > limit
			@storage3 = @storage3.shuffle
			@left_over_kids << @storage3.drop(limit)
			@storage3 = @storage3 - @storage3.drop(limit)
		end

		if @storage4.length > limit
			@storage4 = @storage4.shuffle
			@left_over_kids << @storage4.drop(limit)
			@storage4 = @storage4 - @storage4.drop(limit)
		end

		if @storage5.length > limit
			@storage5 = @storage5.shuffle
			@left_over_kids << @storage5.drop(limit)
			@storage5 = @storage5 - @storage5.drop(limit)
		end

		puts "Storage 1:#{@storage1}"
		puts "Storage 2:#{@storage2}"
		puts "Storage 3:#{@storage3}"
		puts "Storage 4:#{@storage4}"
		puts "Storage 5:#{@storage5}"
		puts "left over:#{@left_over_kids}"
		print "\n"
		print "\n"
		

		counter = @left_over_kids.length
		(counter).times do |x|
			student = @left_over_kids[0]
			puts "Student: #{student}"
			print "\n"

			if (student[0]["2"] == 1) && (@storage1.length < limit)
				@storage1.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif (student[0]["2"] == 2) && (@storage2.length < limit)
				@storage2.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif (student[0]["2"] == 3) && (@storage3.length < limit)
				@storage3.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif (student[0]["2"] == 4) && (@storage4.length < limit)
				@storage4.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif (student[0]["2"] == 5) && (@storage5.length < limit)
				@storage5.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			end
		end


		puts "Storage 1:#{@storage1}"
		puts "Storage 2:#{@storage2}"
		puts "Storage 3:#{@storage3}"
		puts "Storage 4:#{@storage4}"
		puts "Storage 5:#{@storage5}"
		puts "left over:#{@left_over_kids}"
		print "\n"
		print "\n"
		

		counter = @left_over_kids.length
		(counter).times do |x|
			student = @left_over_kids[0]

			if (student[0]["3"] == 1) && (@storage1.length < limit)
				@storage1.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif (student[0]["3"] == 2) && (@storage2.length < limit)
				@storage2.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif (student[0]["3"] == 3) && (@storage3.length < limit)
				@storage3.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif (student[0]["3"] == 4) && (@storage4.length < limit)
				@storage4.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif (student[0]["3"] == 5) && (@storage5.length < limit)
				@storage5.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			end
		end

		counter = @left_over_kids.length
		(counter).times do |x|
			student = @left_over_kids[0]

			if student[0]["4"] == 1 && @storage1.length < limit
				@storage1.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif student[0]["4"] == 2 && @storage2.length < limit
				@storage2.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif student[0]["4"] == 3 && @storage3.length < limit
				@storage3.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif student[0]["4"] == 4 && @storage4.length < limit
				@storage4.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif student[0]["4"] == 5 && @storage5.length < limit
				@storage5.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			end
		end

		counter = @left_over_kids.length
		(counter).times do |x|
			student = @left_over_kids[0]

			if student[0]["5"] == 1 && @storage1.length < limit
				@storage1.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif student[0]["5"] == 2 && @storage2.length < limit
				@storage2.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif student[0]["5"] == 3 && @storage3.length < limit
				@storage3.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif student[0]["5"] == 4 && @storage4.length < limit
				@storage4.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			elsif student[0]["5"] == 5 && @storage5.length < limit
				@storage5.push(student[0])
				@left_over_kids[0].delete(student[0])
				@left_over_kids = @left_over_kids
			end
		end

end

sort(classes, 2)

	puts "Class 1:#{@storage1}"
	print "\n"

	puts "Class 2:#{@storage2}"
	print "\n"

	puts "Class 3:#{@storage3}"
	print "\n"

	puts "Class 4:#{@storage4}"
	print "\n"

	puts "Class 5:#{@storage5}"
	print "\n"

	puts "Left over kids: #{@left_over_kids}"
	print "\n"
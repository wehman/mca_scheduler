student1 = { "1" => 5, "2" => 2, "3" => 1, "4" => 3, "5" => 4 }
student2 = { "1" => 2, "2" => 1, "3" => 3, "4" => 5, "5" => 4 }
student3 = { "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5 }
student4 = { "1" => 4, "2" => 2, "3" => 1, "4" => 3, "5" => 5 }
student5 = { "1" => 1, "2" => 3, "3" => 2, "4" => 5, "5" => 4 }

classes = [student1, student2, student3, student4, student5]

super_classes = {"classes" => classes}

sort(classes, 1)

def sort(array_of_classes, limit)
	storage1 = []
	storage2 = []
	storage3 = []
	storage4 = []
	storage5 = []

	total_students = array_of_classes.length
	total_classes = array_of_classes[0]["classes"].length
	left_over_kids = []

		total_students.times do |x|
			classes = array_of_classes[x]

			if classes['1'] == 1
				storage1.push(classes)
			elsif classes['1'] == 2
				storage2.push(classes)
			elsif classes['1'] == 3
				storage3.push(classes)
			elsif classes['1'] == 4
				storage4.push(classes)
			elsif classes['1'] == 5
				storage5.push(classes)
			end
		end

		if storage1.length >= limit
			storage1 = storage1.shuffle
			left_over_kids << storage1.drop(limit)		# << means .push
		end

		if storage2.length >= limit
			storage2 = storage2.shuffle
			left_over_kids << storage2.drop(limit)
		end

		if storage3.length >= limit
			storage3 = storage3.shuffle
			left_over_kids << storage3.drop(light)
		end

		if storage4.length >= limit
			storage4 = storage4.shuffle
			left_over_kids << storage4.drop(limit)
		end

		if storage5.length >= limit
			storage5 = storage5.shuffle
			left_over_kids << storage5.drop(limit)
		end

		(left_over_kids.length).times do |x|
			student = left_over_kids[x]

			if classes['2'] == 1 && storage1.length < limit
				storage1.push(student)
				left_over_kids.shift
			elsif classes['2'] == 2 && storage2.length < limit
				storage2.push(student)
				left_over_kids.shift
			elsif classes['2'] == 3 && storage3.length < limit
				storage3.push(student)
				left_over_kids.shift
			elsif classes['2'] == 4 && storage4.length < limit
				storage4.push(student)
				left_over_kids.shift
			elsif classes['2'] == 5 && storage5.length < limit
				storage5.push(student)
				left_over_kids.shift
			end
		end

		(left_over_kids.length).times do |x|
			student = left_over_kids[x]

			if classes['3'] == 1 && storage1.length < limit
				storage1.push(student)
				left_over_kids.shift
			elsif classes['3'] == 2 && storage2.length < limit
				storage2.push(student)
				left_over_kids.shift
			elsif classes['3'] == 3 && storage3.length < limit
				storage3.push(student)
				left_over_kids.shift
			elsif classes['3'] == 4 && storage4.length < limit
				storage4.push(student)
				left_over_kids.shift
			elsif classes['3'] == 5 && storage5.length < limit
				storage5.push(student)
				left_over_kids.shift
			end
		end

		(left_over_kids.length).times do |x|
			student = left_over_kids[x]

			if classes['4'] == 1 && storage1.length < limit
				storage1.push(student)
				left_over_kids.shift
			elsif classes['4'] == 2 && storage2.length < limit
				storage2.push(student)
				left_over_kids.shift
			elsif classes['4'] == 3 && storage3.length < limit
				storage3.push(student)
				left_over_kids.shift
			elsif classes['4'] == 4 && storage4.length < limit
				storage4.push(student)
				left_over_kids.shift
			elsif classes['4'] == 5 && storage5.length < limit
				storage5.push(student)
				left_over_kids.shift
			end
		end

		(left_over_kids.length).times do |x|
			student = left_over_kids[x]

			if classes['5'] == 1 && storage1.length < limit
				storage1.push(student)
				left_over_kids.shift
			elsif classes['5'] == 2 && storage2.length < limit
				storage2.push(student)
				left_over_kids.shift
			elsif classes['5'] == 3 && storage3.length < limit
				storage3.push(student)
				left_over_kids.shift
			elsif classes['5'] == 4 && storage4.length < limit
				storage4.push(student)
				left_over_kids.shift
			elsif classes['5'] == 5 && storage5.length < limit
				storage5.push(student)
				left_over_kids.shift
			end
		end

end
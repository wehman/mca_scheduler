require "minitest/autorun"
require_relative "../sorting.rb"

class TestSorting < Minitest::Test
	
	def test_sort_1

		student1 = { "1" => 5, "2" => 2, "3" => 1, "4" => 3, "5" => 4 }
		student2 = { "1" => 2, "2" => 1, "3" => 3, "4" => 5, "5" => 4 }
		student3 = { "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5 }
		student4 = { "1" => 4, "2" => 2, "3" => 1, "4" => 3, "5" => 5 }
		student5 = { "1" => 1, "2" => 3, "3" => 2, "4" => 5, "5" => 4 }
		student6 = { "1" => 1, "2" => 3, "3" => 5, "4" => 2, "5" => 4 }

		classes = [{"classes" => student1},{"classes" => student2}, {"classes" => student3}, {"classes" => student4}, {"classes" => student5}, {"classes" => student6}]

		mysorting = Sorting.new
		combined_returned = mysorting.sort(classes, 1)

		expected = [{"1"=>1, "2"=>3, "3"=>5, "4"=>2, "5"=>4}]
		assert_equal(expected, combined_returned[0])
	end

end
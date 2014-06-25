#!/usr/bin/ruby
# usage:   ruby SortCsvFile.rb InputFilename > OutputFilename

# define a "Person" class to represent the three expected columns
class Calendar <

  # a Person has a first name, last name, and city
	Struct.new(:day, :sintrom_amount, :blood_test, :shift, :birthdays, :task1, :task2, :task3, :task4)
      # a method to print out a csv record for the current Person.
        # note that you can easily re-arrange columns here, if desired.
          # also note that this method compensates for blank fields.
		def print_csv_record
			day.length==0 ? printf(",") : printf("\"%s\",", day)
			sintrom_amount.length==0 ? printf(",") : printf("\"%s\",", sintrom_amount)
			blood_test.length==0 ? printf(",") : printf("\"%s\",", blood_test)
			shift.length==0 ? printf(",") : printf("\"%s\",", shift)
			birthdays.length==0 ? printf(",") : printf("\"%s\",", birthdays)
			task1.length==0 ? printf(",") : printf("\"%s\",", task1)
			task2.length==0 ? printf(",") : printf("\"%s\",", task2)
			task3.length==0 ? printf(",") : printf("\"%s\",", task3)
			task4.length==0 ? printf(",") : printf("\"%s\",", task4)
			printf("\n")
		end
end
                               #------#
                               # MAIN #
                               #------#

# bail out unless we get the right number of command line arguments

unless ARGV.length == 2
	puts "ERROR: Not the right number of arguments."
	puts "Usage: ruby SortCsvFile.rb [InputFile.csv] [title|notitle]\n"
	exit
end

                                    # get the input filename from the command line
input_file = ARGV[0]
title = ARGV[1]
                                    # define an array to hold the Person records
arr = Array.new

                                    # loop through each record in the csv file, adding
                                    # each record to our array.
f = File.open(input_file, "r")
linenr = 0
f.each_line { |line|
	words = line.split(',')
	c1 = Calendar.new
                                          # do a little work here to get rid of double-quotes and blanks
	if ( title == "title" )
		if linenr == 0
			@titleline = line
		else
			c1.day = words[0].tr_s('"', '').strip
			c1.sintrom_amount = words[1].tr_s('"', '').strip
			c1.blood_test = words[2].tr_s('"', '').strip
			c1.shift = words[3].tr_s('"', '').strip
			c1.birthdays = words[4].tr_s('"', '').strip
			c1.task1 = words[5].tr_s('"', '').strip
			c1.task2 = words[6].tr_s('"', '').strip
			c1.task3 = words[7].tr_s('"', '').strip
			c1.task4 = words[8].tr_s('"', '').strip
			arr.push(c1)
		end
	elsif ( title == "notitle" )
		c1.day = words[0].tr_s('"', '').strip
		c1.sintrom_amount = words[1].tr_s('"', '').strip
		c1.blood_test = words[2].tr_s('"', '').strip
		c1.shift = words[3].tr_s('"', '').strip
		c1.birthdays = words[4].tr_s('"', '').strip
		c1.task1 = words[5].tr_s('"', '').strip
		c1.task2 = words[6].tr_s('"', '').strip
		c1.task3 = words[7].tr_s('"', '').strip
		c1.task4 = words[8].tr_s('"', '').strip
		arr.push(c1)
	else
		puts "Error : Second value invalid (MUST BE either title or notitle)"
	end
	linenr += 1
}

                                                  # sort the data by the last_name field
arr.sort! { |a,b| 
	a.day.downcase <=> b.day.downcase 
}
                                                  # print out all the sorted records (just print to stdout)
puts @titleline
arr.each { |c1|
	c1.print_csv_record
}

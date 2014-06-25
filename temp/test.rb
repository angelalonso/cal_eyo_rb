#!/usr/bin/ruby

def csvparse(file)
	File.open(file) do |f|
		columns = f.readline.chomp.split(',')

		table = []
		until f.eof?
			row = f.readline.chomp.split(',')
			row = columns.zip(row).flatten
			table << Hash[*row]
		end

		return table
	end
end

tabla = csvparse("/home/aaf/scripts/control/temp/csv.csv")
puts tabla

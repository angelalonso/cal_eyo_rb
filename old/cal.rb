#!/usr/bin/ruby

require 'csv'

class Calendar
	def initialize(filename)
		@filename = filename
	end
	def searchvalue4givenday(day, field) 
		rowcount = 0
		CSV.foreach(@filename) do |row|
			rowcount += 1
			if rowcount == 1 
				for colnumber in 0..row.count do
					if row[colnumber] == field
						@colsearched = colnumber 
					end
				end
			end
			if ( row[0].to_s == day.to_s )
				return row[@colsearched]
			end
		end
	end
	def searchnextday4givenvalue(value, field)
		rowcount = 0
		currentdayUnformatted = Time.now
		currentday = currentdayUnformatted.year,"%02d" % currentdayUnformatted.month,"%02d" % currentdayUnformatted.day
		obsolete = 1
		CSV.foreach(@filename) do |row|
			rowcount +=1
			if rowcount == 1
				for colnumber in 0..row.count do
					if row[colnumber] == field
						@colsearched = colnumber
					end
				end
			end
			if ( row[0].to_s == currentday.to_s )
				obsolete = 0
			end
			if ( obsolete == 0 and row[@colsearched] == value )
				return row[0]
			end
		end
	end
	def searchnextday_givenvalue(value, field)
		rowcount = 0
		currentday = Time.now
		obsolete = 1
		CSV.foreach(@filename) do |row|
			rowcount +=1
			if rowcount == 1
				for colnumber in 0..row.count do
					if row[colnumber] == field
						@colsearched = colnumber
					end
				end
			end
			if ( row[0].to_s == currentday.year.to_s and row[1].to_s == currentday.month.to_s and row[2].to_s == currentday.day.to_s )
				obsolete = 0
			end
			if ( obsolete == 0 and row[@colsearched] == value )
				return row[2],"-",row[1],"-",row[0]
			end
		end
	end
	def update_date
		rowcount = 0
		CSV.foreach(@filename) do |row|
			if row[@colsearched].to_s.nil? == false
				@lastvalue = row[0]
			end
		end
		return @lastvalue
	end


end

CALENDAR_FILE = "/home/aaf/Documentos/Calendar.csv"
c1 = Calendar.new(CALENDAR_FILE)
TodayUnformatted = Time.now
Today = TodayUnformatted.year,"%02d" % TodayUnformatted.month,"%02d" % TodayUnformatted.day
print "Sintrom for today: ",c1.searchvalue4givenday(Today, "Sintrom Amount"),"\n"
print "Next Test should be taken on: ",c1.searchnextday4givenvalue("test", "Blood Level"),"\n"
print "Must be updated before ",c1.update_date,"\n"

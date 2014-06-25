#!/usr/bin/ruby

require 'rexml/document'
include REXML
require '/home/aaf/scripts/control/guimaker.rb'


ConfigFile = '/home/aaf/scripts/control/ui.xml'

class XmlMenu
	def initialize
		# Load the file
		@docfile = Document.new(File.new( ConfigFile ))
	end
	def tree_manage
		# Is there any menu entry?
		#  -> then a window should pop up
		#
		#     ...and for any entry, a button should be shown as well as an "exit" button
		#        ...and when the button is pressed, we go throw the next step
		#           ...which means showing more, inner entries
		#              ...or going back to the previous screen
		@docfile.root.each_element do |menu_options|
                        puts menu_options.attributes['name']
                        menu_options.each_element do |menu_subopts|
                                print "-->", menu_subopts.attributes['name'], "\n"
                        end        
		end
	end
end

gui_menu = XmlMenu.new
gui_menu.tree_manage
#Gtk.init
#window = AppMain.new
#Gtk.main


#!/usr/bin/ruby

require 'gtk2'
class AppMain < Gtk::Window
	def initialize
		super
		set_title "Control"
		signal_connect "destroy" do
			Gtk.main_quit
		end

		init_ui

		show_all
	end
	def init_ui
		modify_bg Gtk::STATE_NORMAL, Gdk::Color.new(6400, 6400, 6440)

		vbox = Gtk::VBox.new false, 5
		hbox = Gtk::HBox.new true, 3

		valign = Gtk::Alignment.new 0, 1, 0, 0
		vbox.pack_start valign

		button_cal = Gtk::Button.new "Calendar"
		button_cal.set_size_request 80, 32

		button_quit = Gtk::Button.new "Exit"
		button_quit.set_size_request 80, 32
		button_quit.signal_connect "clicked" do
			Gtk.main_quit
		end

		hbox.add button_cal
		hbox.add button_quit

		halign = Gtk::Alignment.new 1, 0, 0, 0
		halign.add hbox

		vbox.pack_start halign, false, false, 3

		add vbox

		set_default_size 444, 444
		set_window_position Gtk::Window::POS_CENTER
	end
end

Gtk.init
window = AppMain.new
Gtk.main

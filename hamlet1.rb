require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  # +insch+ inserts a single character
  # +insertline+ inserts a blank line of text (must move cursor to the line you want to insert the line on)
  # +delch+ deletes a character of text
  # +deleteln+ deletes an entire line of text

  Ham1 = "To be, or not to be: that is the question:\n"
  Ham2 = "Whether 'tis nobler in the mind to suffer\n"
  Ham3 = "The slings and arrows of outrageous fortune,\n"
  Ham4 = "Or to take arms against a sea of troubles,\n"
  Ham5 = "And by opposing end them?\n"

  window.addstr Ham1
  window.addstr Ham3
  window.addstr Ham5
  window.refresh
  window.getch

  window.setpos(1,0)
  window.insertln
  window.addstr Ham2
  window.refresh
  window.getch

  window.setpos(3,0)
  window.insertln
  window.addstr Ham4
  window.refresh
  window.getch
ensure
  Curses.close_screen
end

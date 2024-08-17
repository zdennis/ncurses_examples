require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  Ham1 = "To be, or not to be: that is the question:\n"
  Ham2 = "Whether 'tis nobler in the mind to suffer\n"
  Ham3 = "The slings and arrows of outrageous fortune,\n"
  Ham4 = "Or to take arms against a sea of troubles,\n"
  Ham5 = "And by opposing end them?\n"

  window.addstr Ham1
  window.addstr Ham2
  window.addstr Ham3
  window.addstr Ham4
  window.addstr Ham5
  window.refresh
  window.getch

  window.setpos(1,0)
  # +deleteln+ deletes a full line of of text and backscrolls. It does not
  # affect the position of the cursor, after this call the cursor will still be
  # at 1, 0
  window.deleteln
  window.refresh
  window.getch

ensure
  Curses.close_screen
end

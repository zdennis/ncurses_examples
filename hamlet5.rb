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

  window.setpos 2, 25
  11.times { window.delch ; window.refresh; sleep 0.01}
  window.refresh
  window.getch

ensure
  Curses.close_screen
end

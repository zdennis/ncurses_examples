require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  Curses.start_color

  # +init_pair+ assigns a pair of foreground/background colors
  # to a number. That number can be used later to set the terminal
  # colors to that pair using the Curses.color_pair method.

  Curses.init_pair(1, Curses::COLOR_BLACK, Curses::COLOR_RED)
  Curses.init_pair(2, Curses::COLOR_BLUE, Curses::COLOR_BLACK)

  window.attrset(Curses.color_pair(1))
  window.addstr("My name is Mr. Black!\n")

  window.attrset(Curses.color_pair(2))
  window.addstr("My name is Mr. Blue!\n")

  window.attrset(Curses.color_pair(1))
  window.addstr("How do you do?\n")

  window.attrset(Curses.color_pair(2))
  window.addstr("How do I do ")
  window.attron(Curses::A_BOLD)
  window.addstr("what")
  window.attroff(Curses::A_BOLD)
  window.addch("?"[0])
  window.refresh

  window.getch
ensure
  Curses.close_screen
end

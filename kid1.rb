require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  Curses.start_color
  Curses.init_pair 1, Curses::COLOR_WHITE, Curses::COLOR_BLUE
  Curses.init_pair 2, Curses::COLOR_RED, Curses::COLOR_YELLOW

  # create a sub-window, same arguments as newwin
  # This can be called as Curses.subwin, but then it takes a window
  # as the explicit first argument, ie: Curses.subwin window, 5, 20, 10, 30
  # Coordinates are relative to the screen.
  subwindow = window.subwin(5, 20, 10, 30)

  window.bkgd Curses.color_pair(1)
  window.addstr "Hello son."

  subwindow.bkgd Curses.color_pair(2)
  subwindow.addstr "Hello dad."

  window.refresh
  window.getch
ensure
  Curses.close_screen
end

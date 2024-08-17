require 'curses'

begin
  Curses.init_screen
  Curses.stdscr.refresh
  Curses.cbreak

  Curses.start_color
  Curses.init_pair 1, Curses::COLOR_WHITE, Curses::COLOR_BLUE
  Curses.init_pair 2, Curses::COLOR_RED, Curses::COLOR_YELLOW

  # create a sub-window using derwin, same arguments as newwin
  # This can be called as Curses.derwin, but then it takes a window
  # as the explicit first argument, ie: Curses.derwin window, 5, 20, 10, 30
  window = Curses::Window.new 100, 100, 10, 10

  subwindow = window.derwin(5, 20, 10, 30)

  window.bkgd Curses.color_pair(1)
  window.addstr "Hello son."

  subwindow.bkgd Curses.color_pair(2)
  subwindow.addstr "Hello dad."

  window.refresh
  window.getch
ensure
  Curses.close_screen
end

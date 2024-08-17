require 'curses'

begin
  Curses.init_screen
  Curses.stdscr.refresh
  Curses.cbreak

  Curses.start_color
  Curses.init_pair 1, Curses::COLOR_WHITE, Curses::COLOR_BLUE
  Curses.init_pair 2, Curses::COLOR_RED, Curses::COLOR_YELLOW

  window =Curses::Window.new 100, 100, 10, 10
  subwindow = window.derwin(5, 20, 10, 30)
  window.bkgd Curses.color_pair(1)
  window.addstr "Hello son."
  subwindow.bkgd Curses.color_pair(2)
  subwindow.addstr "Hello dad. Hit enter to delete me."
  window.getch

  # delete the sub-window
  subwindow.close
  window.clear
  window.addstr "the sub-window has been removed"
  window.refresh
  window.getch
ensure
  Curses.close_screen
end

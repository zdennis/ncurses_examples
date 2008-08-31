require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  Ncurses.start_color
  Ncurses.init_pair 1, Ncurses::COLOR_WHITE, Ncurses::COLOR_BLUE
  Ncurses.init_pair 2, Ncurses::COLOR_RED, Ncurses::COLOR_YELLOW
  
  # create a sub-window, same arguments as newwin
  # This can be called as Ncurses.subwin, but then it takes a window
  # as the explicit first argument, ie: Ncurses.subwin window, 5, 20, 10, 30
  # Coordinates are relative to the screen.
  subwindow = window.subwin(5, 20, 10, 30)
  
  window.bkgd Ncurses.COLOR_PAIR(1)
  window.addstr "Hello son."
  
  subwindow.bkgd Ncurses.COLOR_PAIR(2)
  subwindow.addstr "Hello dad."
  
  window.refresh
  window.getch
ensure
  Ncurses.endwin
end
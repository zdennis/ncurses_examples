require 'ncurses'

begin
  Ncurses.initscr
  Ncurses.stdscr.refresh
  Ncurses.cbreak
  
  Ncurses.start_color
  Ncurses.init_pair 1, Ncurses::COLOR_WHITE, Ncurses::COLOR_BLUE
  Ncurses.init_pair 2, Ncurses::COLOR_RED, Ncurses::COLOR_YELLOW
  
  # create a sub-window using derwin, same arguments as newwin
  # This can be called as Ncurses.derwin, but then it takes a window
  # as the explicit first argument, ie: Ncurses.derwin window, 5, 20, 10, 30
  window = Ncurses.newwin 100, 100, 10, 10

  subwindow = window.derwin(5, 20, 10, 30)
  
  window.bkgd Ncurses.COLOR_PAIR(1)
  window.addstr "Hello son."
  
  subwindow.bkgd Ncurses.COLOR_PAIR(2)
  subwindow.addstr "Hello dad."
  
  window.refresh
  window.getch
ensure
  Ncurses.endwin
end
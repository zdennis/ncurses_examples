require 'ncurses'

begin
  Ncurses.initscr
  Ncurses.stdscr.refresh
  Ncurses.cbreak
  
  Ncurses.start_color
  Ncurses.init_pair 1, Ncurses::COLOR_WHITE, Ncurses::COLOR_BLUE
  Ncurses.init_pair 2, Ncurses::COLOR_RED, Ncurses::COLOR_YELLOW
  
  window = Ncurses.newwin 100, 100, 10, 10
  subwindow = window.derwin(5, 20, 10, 30)
  window.bkgd Ncurses.COLOR_PAIR(1)
  window.addstr "Hello son."
  subwindow.bkgd Ncurses.COLOR_PAIR(2)
  subwindow.addstr "Hello dad. Hit enter to delete me."
  window.getch

  # delete the sub-window
  subwindow.delwin
  window.clear
  window.addstr "the sub-window has been removed"
  window.refresh
  window.getch
ensure
  Ncurses.endwin
end
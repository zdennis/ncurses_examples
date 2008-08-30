require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  Ncurses.start_color
  
  Ncurses.init_pair 1, Ncurses::COLOR_WHITE, Ncurses::COLOR_BLUE
  Ncurses.init_pair 2, Ncurses::COLOR_GREEN, Ncurses::COLOR_WHITE
  Ncurses.init_pair 3, Ncurses::COLOR_RED, Ncurses::COLOR_GREEN
  
  window.bkgd Ncurses.COLOR_PAIR(1)
  window.addstr "I think that I shall never see\n"
  window.addstr "a color screen as pretty as thee.\n"
  window.addstr "For seasons may change\n"
  window.addstr "and storms may thunder\n"
  window.addstr "But color text shall always wonder."
  window.refresh
  window.getch
  
  window.bkgd Ncurses.COLOR_PAIR(2)
  window.refresh
  window.getch
  
  window.bkgd Ncurses.COLOR_PAIR(3)
  window.refresh
  window.getch
ensure
  Ncurses.endwin
end
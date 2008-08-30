require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  Ncurses.start_color
  
  # +init_pair+ assigns a pair of foreground/background colors
  # to a number. That number can be used later to set the terminal
  # colors to that pair using the Ncurses.COLOR_PAIR method.
  
  Ncurses.init_pair(1, Ncurses::COLOR_BLACK, Ncurses::COLOR_RED)
  Ncurses.init_pair(2, Ncurses::COLOR_BLUE, Ncurses::COLOR_BLACK)

  window.attrset(Ncurses.COLOR_PAIR(1))
  window.addstr("My name is Mr. Black!\n")

  window.attrset(Ncurses.COLOR_PAIR(2))
  window.addstr("My name is Mr. Blue!\n")
  
  window.attrset(Ncurses.COLOR_PAIR(1))
  window.addstr("How do you do?\n")
  
  window.attrset(Ncurses.COLOR_PAIR(2))
  window.addstr("How do I do ")
  window.attron(Ncurses::A_BOLD)
  window.addstr("what")
  window.attroff(Ncurses::A_BOLD)
  window.addch("?"[0])
  window.refresh
  
  window.getch
ensure
  Ncurses.endwin
end
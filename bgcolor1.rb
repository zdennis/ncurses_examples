require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  Ncurses.start_color
  Ncurses.init_pair(1, Ncurses::COLOR_WHITE, Ncurses::COLOR_BLUE)
  
  # +bkgd+ changes the color scheme for the whole screen/window.
  # It affects all attributes and unused character places on the
  # screen. any text you've written stays as on the screen as
  # text, only the attributes are changed.
  window.bkgd(Ncurses.COLOR_PAIR(1))
  
  window.addstr("So this is what a color screen looks like?\n")

  window.refresh
  window.getch
  
  # +bkgd+ can be used to fill each character space on the screen
  # with a given character. 
  window.bkgd(Ncurses.COLOR_PAIR(1) | '-'[0])

  window.refresh
  window.getch

ensure
  Ncurses.endwin
end
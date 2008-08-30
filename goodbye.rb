require 'ncurses'

begin
  # initialize ncurses
  window = Ncurses.initscr
  Ncurses.cbreak           # provide unbuffered input

  # same as Ncurses.stdscr.addstr
  window.addstr("Press a key to continue") # output string
  
  # update the screen with the string
  # same as Ncurses.stdscr.refresh
  window.refresh

  # +getch+ is used to pause the screen because terminals support a feature
  # known as +rmcup+ which restores the terminal screen to what is looked like
  # before the program was run immediately after it exits.
  # same as Ncurses.stdscr.getch
  window.getch                             # get a charachter

ensure
  # restores the terminal back to what it was before ncurses started
  # Must do this, otherwise unpredicted results in ncurses
  Ncurses.endwin
end
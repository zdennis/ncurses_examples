require 'curses'

begin
  # initialize Curses
  window = Curses.init_screen
  Curses.cbreak           # provide unbuffered input

  # same as Curses.stdscr.addstr
  window.addstr("Press a key to continue") # output string

  # update the screen with the string
  # same as Curses.stdscr.refresh
  window.refresh

  # +getch+ is used to pause the screen because terminals support a feature
  # known as +rmcup+ which restores the terminal screen to what is looked like
  # before the program was run immediately after it exits.
  # same as Curses.stdscr.getch
  window.getch                             # get a charachter

ensure
  # restores the terminal back to what it was before Curses started
  # Must do this, otherwise unpredicted results in Curses
  Curses.close_screen
end

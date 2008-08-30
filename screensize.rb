require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  lines = []
  columns = []
  window.getmaxyx(lines, columns)
  window.printw("Your window has %d rows and %d columns\n", lines.first, columns.last)
  window.printw("Your window has %d rows and %d columns\n", Ncurses.LINES(), Ncurses.COLS())

  window.refresh
  window.getch

ensure
  Ncurses.endwin
end
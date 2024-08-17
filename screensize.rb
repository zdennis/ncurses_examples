require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  lines = []
  columns = []
  window.getmaxyx(lines, columns)
  window.printw("Your window has %d rows and %d columns\n", lines.first, columns.last)
  window.printw("Your window has %d rows and %d columns\n", Curses.LINES(), Curses.COLS())

  window.refresh
  window.getch

ensure
  Curses.close_screen
end

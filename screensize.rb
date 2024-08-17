require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  lines, columns = window.maxx - 1, window.maxy - 1
  window.addstr(sprintf("Your window has %d rows and %d columns\n", lines, columns))

  window.addstr(sprintf("Your window has %d rows and %d columns\n", Curses.lines, Curses.cols))

  window.refresh
  window.getch

ensure
  Curses.close_screen
end

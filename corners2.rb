require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  lines, cols = [], []
  window.getmaxyx(lines, cols)
  rows = lines.first - 1
  cols = cols.first - 1

  window.mvaddch 0, 0, '*'[0]
  window.refresh
  # Curses.napms(500)

  window.mvaddch 0, cols, '*'[0]
  window.refresh
  # Curses.napms(500)

  window.mvaddch rows, 0, '*'[0]
  window.refresh
  # Curses.napms(500)

  window.mvaddch rows, cols, '*'[0]
  window.refresh
  # Curses.napms(500)

  window.move rows/2, cols/2
  window.refresh

  window.getch
ensure
  Curses.close_screen
end

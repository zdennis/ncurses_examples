require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  lines = []
  cols = []
  window.getmaxyx(lines, cols)
  rows = lines.first - 1 # 0-based
  cols = cols.first - 1  # 0-based

  window.move(0,0)
  window.addch('*'[0])
  window.refresh
  # Curses.napms(500) # pause half a second

  window.move(0, cols)
  window.addch('*'[0])
  window.refresh
  # Curses.napms(500) # pause half a second

  window.move(rows, 0)
  window.addch('*'[0])
  window.refresh
  # Curses.napms(500) # pause half a second

  window.move(rows, cols)
  window.addch('*'[0])
  window.refresh
  # Curses.napms(500) # pause half a second

  window.move(rows/2, cols/2)
  window.refresh

  window.getch
ensure
  Curses.close_screen
end

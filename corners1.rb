require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak

  lines = []
  cols = []
  window.getmaxyx(lines, cols)
  rows = lines.first - 1 # 0-based
  cols = cols.first - 1  # 0-based
  
  window.move(0,0)
  window.addch('*'[0])
  window.refresh
  Ncurses.napms(500) # pause half a second
  
  window.move(0, cols)
  window.addch('*'[0])
  window.refresh
  Ncurses.napms(500) # pause half a second

  window.move(rows, 0)
  window.addch('*'[0])
  window.refresh
  Ncurses.napms(500) # pause half a second
  
  window.move(rows, cols)
  window.addch('*'[0])
  window.refresh
  Ncurses.napms(500) # pause half a second
  
  window.move(rows/2, cols/2)
  window.refresh

  window.getch
ensure
  Ncurses.endwin
end
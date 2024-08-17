require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  rows, cols = window.maxy - 1, window.maxx - 1

  window.setpos(0,0)
  window.addch('*')
  window.refresh
  sleep 0.5 # pause half a second

  window.setpos(0, cols)
  window.addch('*')
  window.refresh
  sleep 0.5 # pause half a second

  window.setpos(rows, 0)
  window.addch('*')
  window.refresh
  sleep 0.5 # pause half a second

  window.setpos(rows, cols)
  window.addch('*')
  window.refresh
  sleep 0.5 # pause half a second

  window.setpos(rows/2, cols/2)
  window.refresh

  window.getch
ensure
  Curses.close_screen
end

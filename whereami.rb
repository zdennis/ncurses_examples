require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  # this example doesn't let you hit return to go to a new line
  window.addstr "Type some text; '~' to end:\n"
  window.refresh
  while((ch=window.getch)!= '~'[0])
  end
  
  # +getyx+ gets the position of the cursor on the screen
  row = []
  col = []
  window.getyx(row, col)
  window.printw("\n\nThe cursor was at row %d and column %d.\n", row.first, col.first)
  window.refresh
  
  window.getch
ensure
  Ncurses.endwin
end
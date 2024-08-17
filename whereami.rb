require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  # this example doesn't let you hit return to go to a new line
  window.addstr "Type some text; '~' to end:\n"
  window.refresh
  while((ch=window.getch)!= '~'[0])
  end

  # +getyx+ gets the position of the cursor on the screen
  row = window.cury
  col = window.curx
  window.addstr(sprintf("\n\nThe cursor was at row %d and column %d.\n", row, col))
  window.refresh

  window.getch
ensure
  Curses.close_screen
end

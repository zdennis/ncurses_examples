require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  rows, cols = [], []
  window.getmaxyx(rows, cols)
  rows, cols = rows.first, cols.first

  populate_screen = lambda do
    text = "blah "
    col_max = (rows * cols) / (text.length - 1)
    (col_max - cols).times do 
      window.addstr text
    end
    window.refresh
    window.getch
  end

  populate_screen.call
  # clears the entire screen, this moves the cursor back to 0,0
  window.clear
  window.refresh
  window.getch
  
  # erase the entire screen, same as clear, but clear does a better job of tidying up
  populate_screen.call
  window.erase
  window.refresh
  window.getch
  
  populate_screen.call
  window.move(rows/2,0)
  # +clrtoeol+ clears the screen from the current cursor position to the end of the line
  window.clrtoeol 
  window.refresh
  window.getch

  populate_screen.call
  window.move(rows/2,0)
  # +clrtobot+ clears the screen from the current cursor position to the end of screen
  window.clrtobot 
  window.refresh
  window.getch
  
ensure
  Ncurses.endwin
end
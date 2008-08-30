require 'ncurses'

begin
  window1 = Ncurses.initscr
  Ncurses.cbreak
    
  window1.instance_eval do
    addstr("This is the original window, Ncurses.stdscr\n")
    refresh
    getch
  end
  
  # +newwin+ constructs a new window, passing in all zeroes creates
  # a window that is the same size at Ncurses.stdscr (ie: the terminal size)
  # +newwin+ takes the arguments: rows, cols, y, x
  window2 = Ncurses.newwin(20,20,5,10)
  # window2 = Ncurses.newwin(0, 0, 0, 0) creates a new window the same size window
  # as stdscr which is equal to window1 in this example
  Ncurses.waddstr(window2, "This is the new window created!\n")
  
  # unless window2 is refreshed no text will be displayed for that window
  # window2.refresh is the same as calling Ncurses.wrefresh(window2) 
  window2.refresh
  window1.getch
ensure
  Ncurses.endwin
end
require 'curses'

begin
  window1 = Curses.init_screen
  Curses.cbreak

  window1.instance_eval do
    addstr("This is the original window, Curses.stdscr\n")
    refresh
    getch
  end

  # +newwin+ constructs a new window, passing in all zeroes creates
  # a window that is the same size at Curses.stdscr (ie: the terminal size)
  # +newwin+ takes the arguments: rows, cols, y, x
  window2 =Curses::Window.new(20,20,5,10)
  # window2 =Curses::Window.new(0, 0, 0, 0) creates a new window the same size window
  # as stdscr which is equal to window1 in this example
  window2.addstr("This is the new window created!\n")

  # unless window2 is refreshed no text will be displayed for that window
  # window2.refresh is the same as calling Curses.wrefresh(window2)
  window2.refresh
  window1.getch
ensure
  Curses.close_screen
end

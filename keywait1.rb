require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  window.addstr "Press any key to begin:\n"
  window.refresh
  window.getch
  
  # +nodelay+ makes the getch method non-blocking, whereas typically it is
  # blocking. To return it to its normal blocking just do Ncurses.nodelay(window, false)
  Ncurses.nodelay(window, true)
  window.addstr "Press any key to stop the insane loop\n"
  value = 0
  while window.getch == Ncurses::ERR
    window.printw("%d", value+=1)
    Ncurses.napms 100
    window.refresh
  end
ensure
  Ncurses.endwin
end
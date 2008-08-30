require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  kbhit = lambda do
    Ncurses.nodelay(window, true)
    Ncurses.noecho
    ch = window.getch
    if ch == Ncurses::ERR
      result = false
    else
      result = true
      Ncurses.ungetch ch
    end
  
    Ncurses.echo
    Ncurses.nodelay(window, false)
    result
  end
  
  window.addstr("Press any key to end this program:")
  while !kbhit.call 
  end
ensure
  Ncurses.endwin
end
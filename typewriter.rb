require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak

  window.addstr("Add a few lines of text:")
  window.addstr("Press ~ to quit\n")
  window.refresh
  
  while((ch=window.getch) != "~"[0])
  end
  
  window.getch
ensure
  Ncurses.endwin
end
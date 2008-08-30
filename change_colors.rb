require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  Ncurses.start_color
  changeable = Ncurses.can_change_color?
  if changeable
    window.addstr "you can change colors!"
  else
    window.addstr "you can't change colors!"
  end
  window.refresh
  
  window.getch
rescue
  Ncurses.endwin
end
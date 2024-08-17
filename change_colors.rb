require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  Curses.start_color
  changeable = Curses.can_change_color?
  if changeable
    window.addstr "you can change colors!"
  else
    window.addstr "you can't change colors!"
  end
  window.refresh

  window.getch
rescue
  Curses.close_screen
end

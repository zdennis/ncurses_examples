require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  window.addstr("Add a few lines of text:")
  window.addstr("Press ~ to quit\n")
  window.refresh

  while((ch=window.getch) != "~"[0])
  end

  window.getch
ensure
  Curses.close_screen
end

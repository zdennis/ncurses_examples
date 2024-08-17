require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  kbhit = lambda do
    Curses.nodelay(window, true)
    Curses.noecho
    ch = window.getch
    if ch == Curses::ERR
      result = false
    else
      result = true
      Curses.ungetch ch
    end

    Curses.echo
    Curses.nodelay(window, false)
    result
  end

  window.addstr("Press any key to end this program:")
  while !kbhit.call
  end
ensure
  Curses.close_screen
end

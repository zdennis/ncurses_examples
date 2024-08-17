require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  kbhit = lambda do
    window.nodelay = true
    Curses.noecho
    ch = window.getch
    if ch.nil?
      result = false
    else
      result = true
      Curses.ungetch ch
    end

    Curses.echo
    window.nodelay = false
    result
  end

  window.addstr("Press any key to end this program:")
  while !kbhit.call
  end
ensure
  Curses.close_screen
end

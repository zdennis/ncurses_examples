require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  window.addstr "Type on the keyboard whilst I wait...\n"
  window.refresh
  sleep 1.5

  window.addstr "Here is what you typed: \n  "
  # +getnstr+ reads from the input buffer and puts it back out on the screen. While
  # the program was thinking during the napms call the keystrokes you typed
  # were pushed onto an input buffer (even though you couldn't see them until
  # getnstr is called
  str = ""
  window.getstr
  window.refresh

  window.getch
  window.addstr "Type on the keyboard whilst I wait...\n"
  window.refresh
  sleep 1.5

  window.addstr "Here is what you typed: \n  "
  # +flushinp+ flushes the input buffer, so no matter what you typed while
  # the program was thinking during the napms call it's gone now!
  Curses.flushinp
  str = ""
  window.getstr
  window.refresh
ensure
  Curses.close_screen
end

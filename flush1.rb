require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  window.addstr "Type on the keyboard whilst I wait...\n"
  window.refresh
  Ncurses.napms 1500
  
  window.addstr "Here is what you typed: \n  "
  # +getnstr+ reads from the input buffer and puts it back out on the screen. While
  # the program was thinking during the napms call the keystrokes you typed
  # were pushed onto an input buffer (even though you couldn't see them until 
  # getnstr is called
  str = ""
  window.getnstr str, 80
  window.refresh
  
  window.getch
  window.addstr "Type on the keyboard whilst I wait...\n"
  window.refresh
  Ncurses.napms 1500
  
  window.addstr "Here is what you typed: \n  "
  # +flushinp+ flushes the input buffer, so no matter what you typed while 
  # the program was thinking during the napms call it's gone now!
  Ncurses.flushinp 
  str = ""
  window.getnstr str, 80 
  window.refresh
ensure
  Ncurses.endwin
end
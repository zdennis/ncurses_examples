require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  text1 = "Oh give me a clone!\n"
  text2 = "Yes a clone of my own"
  
  window.addstr(text1)
  window.addstr(text2)
  window.refresh

  window.getch
ensure
  Ncurses.endwin
end
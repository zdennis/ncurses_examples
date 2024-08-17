require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  text1 = "Oh give me a clone!\n"
  text2 = "Yes a clone of my own"

  window.addstr(text1)
  window.addstr(text2)
  window.refresh

  window.getch
ensure
  Curses.close_screen
end

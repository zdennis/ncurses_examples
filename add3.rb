require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  text1 = "Oh give me a clone!\n"
  text2 = "Yes a clone of my own"

  window.addstr(text1)
  window.addstr(text2)
  window.setpos(2,0) # move to third row, first column
  window.addstr("With the Y chromosome changed to the X.")
  window.refresh

  window.getch
ensure
  Curses.close_screen
end

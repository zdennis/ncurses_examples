require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  # +attron+ turns an attribute on whereas +attrset+
  # will clear any previously turned on attributes
  window.attron(Curses::A_BOLD)
  window.addstr("Twinkle, twinkle little star\n")
  window.attron(Curses::A_REVERSE)
  window.addstr("How I wonder what you are.\n")
  window.attroff(Curses::A_BOLD)
  window.addstr("Up above the world so high.\n")
  window.addstr("Like a diamond in the sky.\n")
  window.attrset(Curses::A_NORMAL)
  window.addstr("Twinkle, twinkle little star\n")
  window.attron(Curses::A_UNDERLINE)
  window.addstr("How I wonder what you are.\n")

  # you can turn on multiple attributes by OR'ing them
  window.attron(Curses::A_BOLD | Curses::A_REVERSE | Curses::A_UNDERLINE)
  window.addstr("The end!\n")

  # you can turn off multiple attributes by OR'ing them
  window.attroff(Curses::A_BOLD | Curses::A_REVERSE | Curses::A_UNDERLINE)
  window.addstr("No really, the end!\n")

  window.refresh
  window.getch
ensure
  Curses.close_screen
end

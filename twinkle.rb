require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  # +attron+ turns an attribute on whereas +attrset+
  # will clear any previously turned on attributes
  window.attron(Ncurses::A_BOLD)
  window.addstr("Twinkle, twinkle little star\n")
  window.attron(Ncurses::A_REVERSE)
  window.addstr("How I wonder what you are.\n")
  window.attroff(Ncurses::A_BOLD)
  window.addstr("Up above the world so high.\n")
  window.addstr("Like a diamond in the sky.\n")
  window.attrset(Ncurses::A_NORMAL)
  window.addstr("Twinkle, twinkle little star\n")
  window.attron(Ncurses::A_UNDERLINE)
  window.addstr("How I wonder what you are.\n")
  
  # you can turn on multiple attributes by OR'ing them
  window.attron(Ncurses::A_BOLD | Ncurses::A_REVERSE | Ncurses::A_UNDERLINE)
  window.addstr("The end!\n")
  
  # you can turn off multiple attributes by OR'ing them
  window.attroff(Ncurses::A_BOLD | Ncurses::A_REVERSE | Ncurses::A_UNDERLINE)
  window.addstr("No really, the end!\n")

  window.refresh
  window.getch
ensure 
  Ncurses.endwin
end
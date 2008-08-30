require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  # This example asks for your name and password, and
  # correctly hides the password
  
  name, password = "", ""
  window.mvprintw(3, 10, "Enter your name: ")
  window.refresh
  window.getnstr(name, 45)
  window.mvprintw(5, 10, "Enter your password: ")
  window.refresh
  Ncurses.noecho
  window.getnstr(password, 8)
  Ncurses.echo
  
  window.mvprintw(7, 10, "Your name is %s", name)
  window.mvprintw(8, 10, "Your password is %s", password)
  window.refresh
  window.getch
ensure
  Ncurses.endwin
end
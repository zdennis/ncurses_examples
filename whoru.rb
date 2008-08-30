require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  # This example asks for your name and password, but sadly
  # displays the password you type on the screen. =(
  # Se whoru2.rb example.
  
  name, password = "", ""
  window.mvprintw(3, 10, "Enter your name: ")
  window.refresh
  window.getnstr(name, 45)
  window.mvprintw(5, 10, "Enter your password: ")
  window.refresh
  window.getnstr(password, 8)
ensure
  Ncurses.endwin
end
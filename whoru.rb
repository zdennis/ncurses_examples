require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  # This example asks for your name and password, but sadly
  # displays the password you type on the screen. =(
  # Se whoru2.rb example.

  name, password = "", ""
  window.setpos(3, 10)
  window.addstr("Enter your name: ")
  window.refresh
  name = window.getstr
  window.setpos(5, 10)
  window.addstr("Enter your password: ")
  window.refresh
  password = window.getstr
ensure
  Curses.close_screen
end

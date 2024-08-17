require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  # This example asks for your name and password, and
  # correctly hides the password

  name, password = "", ""
  window.setpos(3, 10)
  window.addstr("Enter your name: ")
  window.refresh
  name = window.getstr #,45
  window.setpos(5, 10)
  window.addstr("Enter your password: ")
  window.refresh
  Curses.noecho
  password = window.getstr # 8
  Curses.echo

  window.setpos(7, 10)
  window.addstr(sprintf("Your name is %s", name))
  window.setpos(8, 10)
  window.addstr(sprintf("Your password is %s", password))
  window.refresh
  window.getch
ensure
  Curses.close_screen
end

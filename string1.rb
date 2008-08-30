require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  window.addstr("What is your first name? ")
  window.refresh

  # +getstr+ requires that you pass in a string to store
  # the result into. getstr will simply push the result
  # onto the string, so if you pass in "" and type in "foo"
  # you'll get "foo". If you pass in "bar" and type in "foo"
  # you'll get "foobar"
  first_name = ""
  window.getstr first_name
  
  window.addstr("What is your middle initial? ")
  window.refresh
  # +getnstr+ is like +getstr+ but it takes an additinal
  # numeric argument to tell it who many characters
  # to allow. ncurses won't let the user enter
  # more than the number of characters allowed.
  middle_name = ""
  window.getnstr middle_name, 1
  
  window.addstr("What is your last name? ")
  window.refresh
  last_name = ""
  window.getstr last_name
  window.printw("Pleased to meet you, %s %s %s!", first_name, middle_name, last_name)
  window.refresh

  window.getch
ensure
  Ncurses.endwin
end
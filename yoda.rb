require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  window.instance_eval do
    # printw is same as printf function
    addstr sprintf("Yoda is %d years old\n", 874)
    addstr sprintf("He has collected %d years\n", 65)
    addstr sprintf("of Social Security")
  end
  window.refresh

  window.getch
ensure
  Curses.close_screen
end

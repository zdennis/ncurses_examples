require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak
  Curses.start_color
  Curses.init_pair(1, Curses::COLOR_WHITE, Curses::COLOR_BLUE)

  # +bkgd+ changes the color scheme for the whole screen/window.
  # It affects all attributes and unused character places on the
  # screen. any text you've written stays as on the screen as
  # text, only the attributes are changed.
  window.bkgd(Curses.color_pair(1))

  window.addstr("So this is what a color screen looks like?\n")

  window.refresh
  window.getch

  # +bkgd+ can be used to fill each character space on the screen
  # with a given character.
  #  window.bkgd(Curses.color_pair(1) | "-")
  window.bkgd("-")

  window.refresh
  window.getch

ensure
  Curses.close_screen
end

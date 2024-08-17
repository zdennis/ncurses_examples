require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak
  Curses.start_color

  Curses.init_pair 1, Curses::COLOR_WHITE, Curses::COLOR_BLUE
  Curses.init_pair 2, Curses::COLOR_GREEN, Curses::COLOR_WHITE
  Curses.init_pair 3, Curses::COLOR_RED, Curses::COLOR_GREEN

  window.bkgd Curses.color_pair(1)
  window.addstr "I think that I shall never see\n"
  window.addstr "a color screen as pretty as thee.\n"
  window.addstr "For seasons may change\n"
  window.addstr "and storms may thunder\n"
  window.addstr "But color text shall always wonder."
  window.refresh
  window.getch

  window.bkgd Curses.color_pair(2)
  window.refresh
  window.getch

  window.bkgd Curses.color_pair(3)
  window.refresh
  window.getch
ensure
  Curses.close_screen
end

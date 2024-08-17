require 'curses'

begin
  Curses.init_screen
  Curses.cbreak
  Curses.start_color

  Curses.init_pair 1, Curses::COLOR_WHITE, Curses::COLOR_BLUE
  Curses.init_pair 2, Curses::COLOR_WHITE, Curses::COLOR_GREEN
  Curses.init_pair 3, Curses::COLOR_WHITE, Curses::COLOR_YELLOW
  Curses.init_pair 4, Curses::COLOR_WHITE, Curses::COLOR_RED

  maxx = Curses.stdscr.maxx
  maxy = Curses.stdscr.maxy
  halfx = maxx / 2
  halfy = maxy / 2

  Curses.refresh

  windows = [
   Curses::Window.new(halfy, halfx, 0, 0),
   Curses::Window.new(halfy, halfx, 0, halfx),
   Curses::Window.new(halfy, halfx, halfy, 0),
   Curses::Window.new(halfy, halfx, halfy, halfx)
  ].each_with_index do |w, i|
    w.bkgd Curses.color_pair(i+1)
    w.addstr "This is window #{i+1}\n"
    w.refresh
  end

  loop do
    ch = windows.first.getch
    windows[1..-1].each { |window| window.addch ch ; window.refresh }
  end

  Curses.getch
ensure
  Curses.close_screen
end

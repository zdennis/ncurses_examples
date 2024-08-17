require 'curses'

begin
  Curses.init_screen
  Curses.cbreak
  Curses.start_color

  Curses.init_pair 1, Curses::COLOR_WHITE, Curses::COLOR_BLUE
  Curses.init_pair 2, Curses::COLOR_WHITE, Curses::COLOR_GREEN
  Curses.init_pair 3, Curses::COLOR_WHITE, Curses::COLOR_YELLOW
  Curses.init_pair 4, Curses::COLOR_WHITE, Curses::COLOR_RED

  cols, rows = [], []
  Curses.stdscr.getmaxyx rows, cols
  cols, rows = cols.first, rows.first
  maxx, maxy, halfx, halfy = cols, rows, cols/2, rows/2
  Curses.refresh

  windows = [
    Curses.newwin(halfy, halfx, 0, 0),
    Curses.newwin(halfy, halfx, 0, halfx),
    Curses.newwin(halfy, halfx, halfy, 0),
    Curses.newwin(halfy, halfx, halfy, halfx)
  ].each_with_index do |w, i|
    w.bkgd Curses.COLOR_PAIR(i+1)
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

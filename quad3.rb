require 'ncurses'

begin
  Ncurses.initscr
  Ncurses.cbreak
  Ncurses.start_color
  
  Ncurses.init_pair 1, Ncurses::COLOR_WHITE, Ncurses::COLOR_BLUE
  Ncurses.init_pair 2, Ncurses::COLOR_WHITE, Ncurses::COLOR_GREEN
  Ncurses.init_pair 3, Ncurses::COLOR_WHITE, Ncurses::COLOR_YELLOW
  Ncurses.init_pair 4, Ncurses::COLOR_WHITE, Ncurses::COLOR_RED  
  
  cols, rows = [], []
  Ncurses.stdscr.getmaxyx rows, cols
  cols, rows = cols.first, rows.first
  maxx, maxy, halfx, halfy = cols, rows, cols/2, rows/2
  Ncurses.refresh
  
  windows = [
    Ncurses.newwin(halfy, halfx, 0, 0),
    Ncurses.newwin(halfy, halfx, 0, halfx),
    Ncurses.newwin(halfy, halfx, halfy, 0),
    Ncurses.newwin(halfy, halfx, halfy, halfx)
  ].each_with_index do |w, i|
    w.bkgd Ncurses.COLOR_PAIR(i+1)
    w.addstr "This is window #{i+1}\n"
    w.refresh
  end
  
  loop do
    ch = windows.first.getch
    windows[1..-1].each { |window| window.addch ch ; window.refresh }
  end
  
  Ncurses.getch
ensure
  Ncurses.endwin
end
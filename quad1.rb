require 'ncurses'

begin
  Ncurses.initscr
  Ncurses.cbreak
  Ncurses.start_color

  Ncurses.init_pair 1, Ncurses::COLOR_WHITE, Ncurses::COLOR_BLUE
  Ncurses.init_pair 2, Ncurses::COLOR_GREEN, Ncurses::COLOR_WHITE
  Ncurses.init_pair 3, Ncurses::COLOR_RED, Ncurses::COLOR_GREEN
  Ncurses.init_pair 4, Ncurses::COLOR_BLACK, Ncurses::COLOR_YELLOW
  
  # calculate window sizes and locations
  rows, cols = [], []
  Ncurses.getmaxyx Ncurses.stdscr, rows, cols
  maxx = cols.first
  maxy = rows.first
  halfx = maxx / 2
  halfy = maxy / 2
  Ncurses.refresh
  
  # create 4 windows to take up the screen
  window1 = Ncurses.newwin halfy, halfx, 0, 0
  window1.bkgd Ncurses.COLOR_PAIR(1)
  window2 = Ncurses.newwin halfy, halfx, 0, halfx
  window2.bkgd Ncurses.COLOR_PAIR(2)
  window3 = Ncurses.newwin halfy, halfx, halfy, 0
  window3.bkgd Ncurses.COLOR_PAIR(3)
  window4 = Ncurses.newwin halfy, halfx, halfy, halfx
  window4.bkgd Ncurses.COLOR_PAIR(4)
  if !window1
    Ncurses.addstr("Unable to allocate memory")
    Ncurses.refresh
  end  
    
  # write to each window
  Ncurses.mvwaddstr window1, 0, 0, "This is window A\n"
  window1.refresh
  Ncurses.mvwaddstr window2, 0, 0, "This is window B\n"
  window2.refresh
  window3.mvaddstr 0, 0, "This is window C\n"
  window3.refresh
  window4.mvaddstr 0, 0, "This is window D\n"
  window4.refresh
  Ncurses.getch
  
  # let's add a new window to the middle of the screen
  window5 = Ncurses.newwin(halfy, halfx, halfy/2, halfx/2)
  window5.mvaddstr 0, 0, "This is the middle window! Press enter to delete it!"
  window5.refresh
  Ncurses.getch
  
  # now's let's delete the middle window (
  window5.delwin
  # refresh the other windows so it dissappears
  windows = [window1, window2, window3, window4]
  windows.each_with_index do |window, i|
    window.touchwin
    window.refresh
  end
  
  # Let's do something crazy with the 4 windows
  Thread.new do
    loop do
      Ncurses.stdscr.touchwin
      Ncurses.stdscr.refresh
      windows.reverse.each_with_index do |window, i|
        window.addstr(".")
        window.touchwin
        window.refresh
        Ncurses.napms 100
      end
    end
  end
  
  Ncurses.getch
ensure
  Ncurses.endwin
end
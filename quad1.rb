require 'curses'

begin
  Curses.init_screen
  Curses.cbreak
  Curses.start_color

  Curses.init_pair 1, Curses::COLOR_WHITE, Curses::COLOR_BLUE
  Curses.init_pair 2, Curses::COLOR_GREEN, Curses::COLOR_WHITE
  Curses.init_pair 3, Curses::COLOR_RED, Curses::COLOR_GREEN
  Curses.init_pair 4, Curses::COLOR_BLACK, Curses::COLOR_YELLOW

  # calculate window sizes and locations
  maxx = Curses.stdscr.maxx
  maxy = Curses.stdscr.maxy
  halfx = maxx / 2
  halfy = maxy / 2
  Curses.refresh

  # create 4 windows to take up the screen
  window1 =Curses::Window.new halfy, halfx, 0, 0
  window1.bkgd Curses.color_pair(1)
  window2 =Curses::Window.new halfy, halfx, 0, halfx
  window2.bkgd Curses.color_pair(2)
  window3 =Curses::Window.new halfy, halfx, halfy, 0
  window3.bkgd Curses.color_pair(3)
  window4 =Curses::Window.new halfy, halfx, halfy, halfx
  window4.bkgd Curses.color_pair(4)
  if !window1
    Curses.addstr("Unable to allocate memory")
    Curses.refresh
  end

  # write to each window
  window1.move_relative(0,0)
  window1.addstr "This is window A\n"
  window1.refresh

  window2.move_relative(0,0)
  window2.addstr "This is window B\n"
  window2.refresh

  window3.move_relative 0, 0
  window3.addstr "This is window C\n"
  window3.refresh

  window4.move_relative 0, 0
  window4.addstr "This is window D\n"
  window4.refresh

  Curses.getch

  # let's add a new window to the middle of the screen
  window5 = Curses::Window.new(halfy, halfx, halfy/2, halfx/2)
  window5.move_relative 0, 0
  window5.addstr "This is the middle window! Press enter to delete it!"

  window5.refresh
  Curses.getch

  # now's let's delete the middle window (
  window5.close
  # refresh the other windows so it dissappears
  windows = [window1, window2, window3, window4]
  windows.each_with_index do |window, i|
    window.touch
    window.refresh
  end

  # Let's do something crazy with the 4 windows
  Thread.new do
    loop do
      Curses.stdscr.touch
      Curses.stdscr.refresh
      windows.reverse.each_with_index do |window, i|
        window.addstr(".")
        window.touch
        window.refresh
        sleep 0.01
      end
    end
  end

  Curses.getch
ensure
  Curses.close_screen
end

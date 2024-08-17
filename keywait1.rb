require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  window.addstr "Press any key to begin:\n"
  window.refresh
  window.getch

  # +nodelay+ makes the getch method non-blocking, whereas typically it is
  # blocking. To return it to its normal blocking just do Curses.nodelay(window, false)
  window.nodelay = true
  window.addstr "Press any key to stop the insane loop\n"
  value = 0
  while window.getch.nil?
    window.addstr(sprintf("%d", value+=1))
    sleep 0.01
    window.refresh
  end
ensure
  Curses.close_screen
end

require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak
  "Greetings from Curses".each_byte do |ch|
    window.addch ch
    window.refresh
    sleep 0.01 # refreshes every 1/10th of a second
  end
  window.getch
ensure
  Curses.close_screen
end

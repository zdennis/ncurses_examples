require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  "Greetings from ncurses".each_byte do |ch|
    window.addch ch
    window.refresh
    Ncurses.napms 100 # refreshes every 1/10th of a second
  end
  window.getch
ensure
  Ncurses.endwin
end
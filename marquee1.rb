require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak

  # +insch+ will eventually push text off the screen.
  # It doesn't wrap text onto the next line.
  
  text = "Stock Market Swells! DOW tops 15,000"
  text.reverse.each_byte do |ch|
    window.move 5, 5
    window.insch ch
    window.refresh
    Ncurses.napms 100
  end
  window.insch ' '[0]
  Ncurses.getch
ensure
  Ncurses.endwin
end
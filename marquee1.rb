require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  # +insch+ will eventually push text off the screen.
  # It doesn't wrap text onto the next line.

  text = "Stock Market Swells! DOW tops 15,000"
  text.reverse.each_byte do |ch|
    window.setpos 5, 5
    window.insch ch
    window.refresh
    sleep 0.01
  end
  window.insch ' '
  Curses.getch
ensure
  Curses.close_screen
end

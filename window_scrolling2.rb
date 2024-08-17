require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  window.scrollok true

  # +scroll+ is used to manually scroll one line at a time
  10.times do |i|
    window.addstr("line #{i}\n")
  end
  window.refresh
  window.getch

  window.scroll
  window.refresh
  window.getch

  window.scroll
  window.refresh
  window.getch

  window.scroll
  window.refresh
  window.getch

  # +scrl(n) is used to manually scroll by n lines at a time
  window.scrl 5
  window.addstr "the cursor position hasn't moved this whole time"
  window.refresh
  window.getch


  # +scrl(n) can take negative numbers to scroll down, although
  # the content that was previously scrolled up is not remembered
  window.scrl -5
  window.refresh
  window.getch

  window.getch
ensure
  Curses.close_screen
end

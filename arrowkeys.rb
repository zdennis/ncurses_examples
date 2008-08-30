require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak

  # All keys on a keyboard generate some key code
  # and this example focuses on paying attention to
  # your arrow keys. Although you can also catch the following keycodes:
  #   KEY_UP, KEY_DOWN, KEY_LEFT, KEY_RIGHT,
  #   KEY_HOME, KEY_NPAGE, KEY_PPAGE, KEY_END, KEY_BACKSPACE
  #   KEY_F(n) - KEY_F is a method and n is the number. ie: KEY_F(5) for pressing the F5 key
  
  
  # +keypad+ is used to determine what window/screen
  # the arrow keys will affect, pass in true to turn
  # it on and false to turn it off. Without 'true' this
  # would display crazy character codes on the screen when hitting
  # arrow keys.
  Ncurses.keypad(window, true)
  window.addstr("Type 'q' to quit. In the meantime hit your arrow keys\n")
  while( (ch=window.getch) != 'q'[0])
    case ch
      when Ncurses::KEY_DOWN
        window.addstr("down ")
      when Ncurses::KEY_UP
        window.addstr("up ")
      when Ncurses::KEY_RIGHT
        window.addstr("right ")
      when Ncurses::KEY_LEFT
        window.addstr("left ")
    end
    window.refresh  
  end
  
ensure
  Ncurses.endwin
end
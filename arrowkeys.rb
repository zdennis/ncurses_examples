require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

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
  window.keypad = true
  window.addstr("Type 'q' to quit. In the meantime hit your arrow keys\n")
  while( (ch=window.getch) != 'q'[0])
    case ch
      when Curses::KEY_DOWN
        window.addstr("down ")
      when Curses::KEY_UP
        window.addstr("up ")
      when Curses::KEY_RIGHT
        window.addstr("right ")
      when Curses::KEY_LEFT
        window.addstr("left ")
    end
    window.refresh
  end

ensure
  Curses.close_screen
end

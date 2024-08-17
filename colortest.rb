require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  window.instance_eval do
    addstr("Does this terminal support colors? ")
    if Curses.has_colors?
      addstr("yes!\n")
      # Curses.COLORS() will return 0 until Curses is told to start using colors
      printw("Curses reports that you have %d colors you can use\n", Curses.COLORS())
      # we want to use colors!
      Curses.start_color
      printw("colors have been properly initialized.\n")
      printw("Congratulations!")

      # COLORS is a method on Curses to report the number of colors the terminal
      printw("Curses reports that you have %d colors you can use\n", Curses.COLORS())

      # COLOR_PAIRS is a method on Curses to report the number of bg/fg color
      # combinations there are for the terminal
      printw("Curses reports that you have %d colors you can use\n", Curses.COLOR_PAIRS())

    else
      addstr("no!\n")
    end

    refresh
    getch
  end
ensure
  Curses.close_screen
end

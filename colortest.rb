require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  window.instance_eval do
    addstr("Does this terminal support colors? ")
    if Ncurses.has_colors?
      addstr("yes!\n")
      # Ncurses.COLORS() will return 0 until Ncurses is told to start using colors
      printw("Ncurses reports that you have %d colors you can use\n", Ncurses.COLORS())
      # we want to use colors!
      Ncurses.start_color
      printw("colors have been properly initialized.\n")
      printw("Congratulations!")

      # COLORS is a method on NCurses to report the number of colors the terminal 
      printw("Ncurses reports that you have %d colors you can use\n", Ncurses.COLORS())

      # COLOR_PAIRS is a method on NCurses to report the number of bg/fg color 
      # combinations there are for the terminal 
      printw("Ncurses reports that you have %d colors you can use\n", Ncurses.COLOR_PAIRS())

    else
      addstr("no!\n")
    end
    
    refresh
    getch
  end
ensure
  Ncurses.endwin
end
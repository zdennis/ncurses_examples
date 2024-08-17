require 'curses'

begin
  window = Curses.init_screen
  Curses.cbreak

  window.instance_eval do
    addstr("Does this terminal support colors? ")
    if Curses.has_colors?
      addstr("yes!\n")
      # Curses.colors() will return 0 until Curses is told to start using colors
      addstr(sprintf("Curses reports that you have %d colors you can use\n", Curses.colors()))
      # we want to use colors!
      Curses.start_color
      addstr(sprintf("colors have been properly initialized.\n"))

      #setpos(0, cury)
      addstr(sprintf("Congratulations!\n"))

      #setpos(0, cury)
      # +colors+ is a method on Curses to report the number of colors the terminal

      addstr(sprintf("Curses reports that you have %d colors you can use\n", Curses.colors()))

      # +color_pairs+ is a method on Curses to report the number of bg/fg color
      # combinations there are for the terminal

      addstr(sprintf("Curses reports that you have %d color pairs you can use\n", Curses.color_pairs()))

      Curses.colors.times { |i|
        Curses.init_pair(i, i, 0)
        attrset(Curses.color_pair(i))
        addstr("#{i.to_s.rjust(3)} ")
        addstr("\n") if i == 15 || (i > 16 && (i - 15) % 36 == 0)
      }

    else
      addstr("no!\n")
    end

    refresh
    getch
  end
ensure
  Curses.close_screen
end

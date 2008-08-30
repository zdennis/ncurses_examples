require 'ncurses'

class HelpMenu
  def initialize(ncurses_screen)
    @screen = ncurses_screen
    @help_screen = Ncurses.newwin(0,0,0,0)
    Ncurses.mvwaddstr(@help_screen, 6, 32, "Help menu Screen")
    Ncurses.mvwaddstr(@help_screen, 9, 28, "Press the ~ key to quit")
    Ncurses.mvwaddstr(@help_screen, 12, 28, "Press ENTER to go back")
  end
  
  def show_help
    @help_screen.refresh
    @screen.getch

    # Calling @screen.refresh won't actually update the screen because 
    # Ncurses will only update text that has changed, we can use +touchwin+
    # tell Ncurses that every character has changed and needs to be redrawn.
    # If you comment out @screen.touchwin and uncomment @screen.refresh you'll
    # see the program no longer work!
    # @screen.refresh
    @screen.touchwin
  end
end

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  help_menu = HelpMenu.new window
  
  window.addstr("Typer Program\n")
  window.addstr("Press + for help:\n\n")
  window.refresh
  Ncurses.noecho
  while ch=window.getch
    window.refresh
    if ch == '+'[0]
      help_menu.show_help
    else
      window.addch ch
    end
  end
  
ensure
  Ncurses.endwin
end
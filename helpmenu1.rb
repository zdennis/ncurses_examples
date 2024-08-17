require 'curses'

class HelpMenu
  def initialize(Curses_screen)
    @screen = Curses_screen
    @help_screen = Curses.newwin(0,0,0,0)
    Curses.mvwaddstr(@help_screen, 6, 32, "Help menu Screen")
    Curses.mvwaddstr(@help_screen, 9, 28, "Press the ~ key to quit")
    Curses.mvwaddstr(@help_screen, 12, 28, "Press ENTER to go back")
  end

  def show_help
    @help_screen.refresh
    @screen.getch

    # Calling @screen.refresh won't actually update the screen because
    # Curses will only update text that has changed, we can use +touchwin+
    # tell Curses that every character has changed and needs to be redrawn.
    # If you comment out @screen.touchwin and uncomment @screen.refresh you'll
    # see the program no longer work!
    # @screen.refresh
    @screen.touchwin
  end
end

begin
  window = Curses.init_screen
  Curses.cbreak

  help_menu = HelpMenu.new window

  window.addstr("Typer Program\n")
  window.addstr("Press + for help:\n\n")
  window.refresh
  Curses.noecho
  while ch=window.getch
    window.refresh
    if ch == '+'[0]
      help_menu.show_help
    else
      window.addch ch
    end
  end

ensure
  Curses.close_screen
end

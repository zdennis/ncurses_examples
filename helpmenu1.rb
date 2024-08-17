require 'curses'

class HelpMenu
  def initialize(curses_screen)
    @screen = curses_screen
    @help_screen = Curses::Window.new(0,0,0,0)
    @help_screen.move_relative(6, 32)
    @help_screen.addstr("Help menu Screen\n")

    @help_screen.move_relative(9, 28)
    @help_screen.addstr("Press the ~ key to quit\n")

    @help_screen.move_relative(12, 28)
    @help_screen.addstr("Press ENTER to go back\n")

  end

  def show_help
    @help_screen.refresh
    @screen.getch

    # Calling @screen.refresh won't actually update the screen because
    # Curses will only update text that has changed, we can use +touch+
    # tell Curses that every character has changed and needs to be redrawn.
    # If you comment out @screen.touch and uncomment @screen.refresh you'll
    # see the program no longer work!
    # @screen.refresh
    @screen.touch
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

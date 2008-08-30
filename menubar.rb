require 'ncurses'

class MyScreen
  def initialize(ncurses_screen, *menu_items)
    @screen = ncurses_screen
    @menu_items = menu_items
  end
  
  def draw_menu(select_item)
    @screen.clear
    @screen.addstr "Main Menu"
    @menu_items.each_with_index do |label, i|
      if label == select_item
        @selected_item = label
        @screen.attron(Ncurses::A_REVERSE)
      end
      @screen.mvaddstr(i+2, 5, label)
      @screen.attroff(Ncurses::A_REVERSE)
    end
    @screen.mvaddstr(@menu_items.size*2+2, 5, "Press the up/down arrow keys to change selection")
    @screen.refresh
  end
  
  def select_previous
    index2select = @menu_items.index(@selected_item) - 1
    index2select = @menu_items.size - 1 if index2select < 0
    draw_menu @menu_items[index2select]    
  end

  def select_next
    index2select = @menu_items.index(@selected_item) + 1
    index2select = 0 if index2select >= @menu_items.size
    draw_menu @menu_items[index2select]    
  end
end

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  Ncurses.keypad(window, true)
  
  screen = MyScreen.new(window,
    "Answer E-Mail",
    "Off to the web",
    "Word processing",
    "Financial management",
    "Shutdown")
  screen.draw_menu("Answer E-Mail")
  
  while ch=window.getch
    case ch
    when Ncurses::KEY_UP
      screen.select_previous
    when Ncurses::KEY_DOWN
      screen.select_next
    end
  end
ensure
  Ncurses.endwin
end
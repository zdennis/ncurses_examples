require 'curses'

class MyScreen
  def initialize(curses_screen, *menu_items)
    @screen = curses_screen
    @menu_items = menu_items
  end

  def draw_menu(select_item)
    @screen.clear
    @screen.addstr "Main Menu"
    @menu_items.each_with_index do |label, i|
      if label == select_item
        @selected_item = label
        @screen.attron(Curses::A_REVERSE)
      end
      @screen.setpos(i+2, 5)
      @screen.addstr(label)
      @screen.attroff(Curses::A_REVERSE)
    end
      @screen.setpos(@menu_items.size*2+2, 5)
      @screen.addstr("Press the up/down arrow keys to change selection")

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
  window = Curses.init_screen
  Curses.cbreak
  window.keypad = true

  screen = MyScreen.new(window,
    "Answer E-Mail",
    "Off to the web",
    "Word processing",
    "Financial management",
    "Shutdown")
  screen.draw_menu("Answer E-Mail")

  while ch=window.getch
    case ch
    when Curses::KEY_UP
      screen.select_previous
    when Curses::KEY_DOWN
      screen.select_next
    end
  end
ensure
  Curses.close_screen
end

require 'curses'

class MyScreen
  def initialize(curses_screen, &blk)
    @screen = curses_screen
    instance_eval &blk if block_given?
  end

  def fill
    start = 0
    x = cols
    y = rows
    while start < y
      @screen.addstr("A B C D E F G H I J K L M N O P Q R S T U V W X Y Z\n")
      start +=1
    end
  end

  private

  def rows_and_cols
    [@screen.maxy, @screen.maxx]
  end

  def rows
    rows_and_cols.first
  end

  def cols
    rows_and_cols.last
  end
end

begin
  window = Curses.init_screen
  Curses.cbreak

  window.insch ' '
  screen = MyScreen.new window do
    fill
    window.refresh
    text = "Stock Market Swells! DOW tops 15,000"
    text.reverse.each_byte do |ch|
      window.setpos 5, 5
      window.insch ch
      window.refresh
      sleep 0.1
    end
  end

  Curses.getch
ensure
  Curses.close_screen
end

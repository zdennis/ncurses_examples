require 'ncurses'

class MyScreen
  def initialize(ncurses_screen, &blk)
    @screen = ncurses_screen
    instance_eval &blk if block_given?
  end
  
  def fill
    start = 0
    x = rows
    y = cols
    while start < y
      @screen.addstr("A B C D E F G H I J K L M N O P Q R S T U V W X Y Z\n")
      start +=1
    end
  end
  
  private
  
  def rows_and_cols
    rows, cols = [], []
    @screen.getmaxyx rows, cols
    [rows.first, cols.first]
  end
  
  def rows
    rows_and_cols.first
  end
  
  def cols
    rows_and_cols.last
  end
end

begin
  window = Ncurses.initscr
  Ncurses.cbreak

  window.insch ' '[0]
  screen = MyScreen.new window do
    fill
    window.refresh
    text = "Stock Market Swells! DOW tops 15,000"
    text.reverse.each_byte do |ch|
      window.move 5, 5
      window.insch ch
      window.refresh
      Ncurses.napms 100
    end
  end
  
  Ncurses.getch
ensure
  Ncurses.endwin
end
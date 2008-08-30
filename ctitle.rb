require 'ncurses'

class MyScreen
  def initialize(ncurses_screen, &blk)
    @screen = ncurses_screen
    instance_eval &blk if block_given?
  end
  
  def center(row, text)
    start_col = ((cols) - text.size) / 2
    @screen.mvaddstr row, start_col, text
  end
  
  def right_justify row, text
    @screen.mvprintw row, 0, "%#{cols}s", text
  end

  def left_justify row, text
    @screen.mvprintw row, 0, "%-#{cols}s", text
  end
    
  private
  
  def rows_and_cols
    rows, cols = [], []
    @screen.getmaxyx(rows, cols)
    [rows.first, cols.first]
  end
  
  def cols
    rows_and_cols.last
  end
end


begin
  window = Ncurses.initscr
  Ncurses.cbreak
  
  MyScreen.new window do
    center 1, "Penguin Soccer Finals"
    center 5, "Cattle DungSamples from Temecula"
    center 7, "Catatonic Theater"
    center 9, "Why Do Ions Hate Each Other?"
    right_justify 11, "this is right justified"
    left_justify 13, "this is left justified"
  end
  
    
  window.getch
ensure
  Ncurses.endwin
end
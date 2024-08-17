require 'curses'

class MyScreen
  def initialize(curses_screen, &blk)
    @screen = curses_screen
    instance_eval &blk if block_given?
  end

  def center(row, text)
    start_col = ((cols) - text.size) / 2
    @screen.setpos row, start_col
    @screen.addstr text
  end

  def right_justify row, text
    @screen.setpos row, 0
    @screen.addstr sprintf("%#{cols}s", text)
  end

  def left_justify row, text
    @screen.setpos row, 0
    @screen.addstr sprintf("%-#{cols}s", text)
  end

  private

  def rows_and_cols
    [@screen.maxy, @screen.maxx]
  end

  def cols
    rows_and_cols.last
  end
end


begin
  window = Curses.init_screen
  Curses.cbreak

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
  Curses.close_screen
end

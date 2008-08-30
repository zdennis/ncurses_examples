require 'ncurses'

begin
  window = Ncurses.initscr
  Ncurses.cbreak

  window.instance_eval do
    # printw is same as printf function
    printw "Yoda is %d years old\n", 874
    printw "He has collected %d years\n", 65
    printw "of Social Security"
  end
  window.refresh

  window.getch
ensure
  Ncurses.endwin
end
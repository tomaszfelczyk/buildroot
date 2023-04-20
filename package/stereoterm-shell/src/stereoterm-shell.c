#include <stdio.h>
#include <string.h>
#include <unistd.h>
// #include <time.h>
#include <ncurses.h>

int main(void) {

	WINDOW *main_win;
    char *welcome_msg = "Welcome to STEREO TERMINAL!";

	int win_width, win_height;
	
	initscr();
	raw();
	noecho();
	curs_set(0);

	getmaxyx(stdscr, win_height, win_width);

	main_win = newwin(win_height, win_width, 0, 0);
	box(main_win, 0 , 0);
	refresh();
	wrefresh(main_win);


	for(int len = 0; len <= strlen(welcome_msg); len++){
		mvwprintw(main_win, win_height/2, (win_width - len) / 2, "%.*s", len, welcome_msg);
		wrefresh(main_win);
		usleep(40000);
	}
	// sleep(2);
	wrefresh(main_win);

	keypad(stdscr, TRUE);
	int ch;
	while (ch = getch()){
		mvwprintw(main_win, 1, 1, "%i", ch);
		wrefresh(main_win);

		switch(ch)
		{	
			// case KEY_LEFT:
			// 	continue;
			// case KEY_RIGHT:
			// 	continue;
			// case KEY_UP:
			// 	continue;
			// case KEY_DOWN:
			// 	continue;
		}
		if(ch == 27){ /* ESC */
			break;
		}

	}
	
	
	// mvprintw(row-2,0,"This screen has %d rows and %d columns\n",row,col);
	// printw("Try resizing your window(if possible) and then run this program again");
	// refresh();
	
	endwin();

	return 0;
}
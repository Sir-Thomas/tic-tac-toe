public class TicTacToe.GameBox : Gtk.Box {
    public int active_player = 1;
    public int turn = 0;
    public int[] turn_history = {-1, -1, -1, -1, -1, -1, -1, -1, -1};
    public TicTacToe.Grid grid;
    public TicTacToe.TitleBar title_bar;

    construct {
        orientation = Gtk.Orientation.VERTICAL;

        title_bar = new TicTacToe.TitleBar (this);
        grid = new TicTacToe.Grid (this);
        
        append (title_bar);
        append (grid);
    }

    public void advance_turn (int id, bool redo) {
        turn_history[turn] = id;
        turn++;
        change_active_player ();
        title_bar.undo_button.sensitive = true;

        if (!redo) {
            for (int i = turn; i < 9; i++) {
                turn_history[i] = -1;
            }

            title_bar.redo_button.sensitive = false;
        } else if (turn_history[turn] == -1) {
            title_bar.redo_button.sensitive = false;
        }

        int winner = grid.check_for_winner ();
        if (winner != 0) {
            title_bar.active_player_label.label = (_(@"Player $winner Wins!"));
            grid.disable_buttons ();
        } else if (turn == 9) {
            title_bar.active_player_label.label = (_("Cat's Game"));
            grid.disable_buttons ();
        }
    }

    public void new_game () {
        for (int i = 0; i < 9; i++) {
            turn_history[i] = -1;
        }

        turn = 0;
        grid.new_game ();
        active_player = 1;
        title_bar.active_player_label.label = (_("Player 1's Turn"));
        title_bar.undo_button.sensitive = false;
        title_bar.redo_button.sensitive = false;
    }

    public void undo () {
        for (int i = 0; i < 9; i++) {
            var in_history = false;
            for (int j = 0; j < 9; j++) {
                if (turn_history[j] == i) {
                    in_history = true;
                }
            }
            if (!in_history) {
                grid.buttons[i].sensitive = true;
            }
        }

        turn--;
        grid.reset_button(turn_history[turn]);
        change_active_player ();
        title_bar.redo_button.sensitive = true;

        if (turn == 0) {
            title_bar.undo_button.sensitive = false;
        }
    }

    public void redo () {
        grid.buttons[turn_history[turn]].on_click (true);
    }
    
    public void temp_print_turn_history () {
        for (int i = 0; i < 9; i++) {
            var temp = turn_history[i];
            print (@"$temp"+", ");
        }
        print ("\n");
    }

    void change_active_player () {
        if (active_player == 1) {
            active_player = 2;
        } else {
            active_player = 1;
        }
        title_bar.active_player_label.label = (_(@"Player $active_player's Turn"));
    }
}
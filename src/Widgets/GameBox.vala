public class TicTacToe.GameBox : Gtk.Box {
    public int turn = 1;
    public TicTacToe.Grid grid;
    public TicTacToe.TitleBar title_bar;

    construct {
        orientation = Gtk.Orientation.VERTICAL;

        title_bar = new TicTacToe.TitleBar (this);
        grid = new TicTacToe.Grid (this);
        
        append (title_bar);
        append (grid);
    }

    public void advance_turn () {
        int winner = grid.check_for_winner ();
        if (winner == 0) {
            if (turn == 1) {
                turn = 2;
                title_bar.active_player.label = (_("Player 2's Turn"));
            } else {
                turn = 1;
                title_bar.active_player.label = (_("Player 1's Turn"));
            }
        } else if (winner == 1) {
            title_bar.active_player.label = (_("Player 1 Wins!"));
            grid.disable_buttons ();
        } else if (winner == 2) {
            title_bar.active_player.label = (_("Player 2 Wins!"));
            grid.disable_buttons ();
        }
    }

    public void new_game () {
        turn = 1;
        title_bar.active_player.label = (_("Player 1's Turn"));
        grid.new_game ();
    }
}
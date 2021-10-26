public class TicTacToe.GameBox : Gtk.Box {
    public int turn = 1;
    public TicTacToe.Grid grid;

    construct {
        orientation = Gtk.Orientation.VERTICAL;

        var new_game_button = new Gtk.Button.with_label (_("New Game"));
        grid = new TicTacToe.Grid (this);
        new_game_button.clicked.connect (new_game);
        
        append (new_game_button);
        append (grid);
    }

    public void advance_turn () {
        if ( turn == 1 ) {
            turn = 2;
        } else {
            turn = 1;
        }
    }

    public void new_game () {
        turn = 1;
        grid.new_game ();
    }
}
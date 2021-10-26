public class TicTacToe.Button : Gtk.Button {
    public TicTacToe.Grid grid;

    public Button (TicTacToe.Grid g) {
        grid = g;
    }

    construct {
        label = " ";

        clicked.connect (on_click);
    }

    void on_click () {
        if ( grid.turn == 1 ) {
            label = "X";
        } else {
            label = "O";
        }
        sensitive = false;
        grid.advance_turn ();
    }
}
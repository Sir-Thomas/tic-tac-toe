public class TicTacToe.Button : Gtk.Button {
    public int id;
    public TicTacToe.Grid grid;

    public Button (TicTacToe.Grid g, int i) {
        grid = g;
        id = i;
    }

    construct {
        label = " ";

        clicked.connect (on_click);
    }

    void on_click () {
        if ( grid.get_turn() == 1 ) {
            label = "X";
        } else {
            label = "O";
        }
        sensitive = false;
        grid.advance_turn (id);
    }
}
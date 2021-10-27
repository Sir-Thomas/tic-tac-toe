public class TicTacToe.Button : Gtk.Button {
    public int id;
    public TicTacToe.Grid grid;

    public Button (TicTacToe.Grid g, int i) {
        grid = g;
        id = i;
    }

    construct {
        label = " ";

        clicked.connect (() => on_click(false));
    }

    public void on_click (bool redo) {
        if ( grid.get_active_player () == 1 ) {
            label = "X";
        } else {
            label = "O";
        }
        sensitive = false;
        grid.advance_turn (id, redo);
    }
}
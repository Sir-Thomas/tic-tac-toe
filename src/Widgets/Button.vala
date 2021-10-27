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
        Gtk.Label temp = (Gtk.Label) child;
        if ( grid.get_active_player () == 1 ) {
            temp.set_markup ("<span size=\"xx-large\">X</span>");
        } else {
            temp.set_markup ("<span size=\"xx-large\">O</span>");
        }
        sensitive = false;
        grid.advance_turn (id, redo);
    }
}
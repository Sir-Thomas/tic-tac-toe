public class TicTacToe.Grid : Gtk.Grid {
    public TicTacToe.GameBox game_box;
    public Gtk.Button[,] buttons = new Gtk.Button[3,3];

    public Grid (TicTacToe.GameBox box) {
        game_box = box;
    }

    construct {
        vexpand = true;
        hexpand = true;
        column_homogeneous = true;
        row_homogeneous = true;

        create_buttons ();
        attach_buttons ();
    }

    public void advance_turn () {
        game_box.advance_turn ();
    }

    public void new_game () {
        remove_buttons ();
        create_buttons ();
        attach_buttons ();
    }

    public void create_buttons () {
        var k = 1;
        for ( var i = 0; i < 3; i++ ) {
            for ( var j = 0; j < 3; j++ ) {
                buttons[i,j] = new TicTacToe.Button (this);
                k++;
            }
        }
    }

    public void attach_buttons () {
        for ( var i = 0; i < 3; i++ ) {
            for ( var j = 0; j < 3; j++ ) {
                attach (buttons[i,j], j, i);
            }
        }
    }

    public void remove_buttons () {
        for ( var i = 0; i < 3; i++ ) {
            for ( var j = 0; j < 3; j++ ) {
                remove (buttons[i,j]);
            }
        }
    }

    public int get_turn () {
        return game_box.turn;
    }
}
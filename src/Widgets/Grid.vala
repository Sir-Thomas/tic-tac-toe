public class TicTacToe.Grid : Gtk.Grid {
    public int turn = 1;

    construct {
        vexpand = true;
        hexpand = true;
        column_homogeneous = true;
        row_homogeneous = true;

        Gtk.Button[,] buttons = new Gtk.Button[3,3];

        var new_game = new Gtk.Button.with_label (_("New Game"));
        new_game.clicked.connect ( () => reset_game(buttons) );
        attach ( new_game, 0, 0, 3, 1);

        create_buttons (buttons);
        attach_buttons (buttons);
    }

    public void advance_turn () {
        if ( turn == 1 ) {
            turn = 2;
        } else {
            turn = 1;
        }
    }

    public void reset_game (Gtk.Button[,] buttons) {
        turn = 1;
        remove_buttons (buttons);
        create_buttons (buttons);
        attach_buttons (buttons);
    }

    public void create_buttons (Gtk.Button[,] buttons) {
        var k = 1;
        for ( var i = 0; i < 3; i++ ) {
            for ( var j = 0; j < 3; j++ ) {
                buttons[i,j] = new TicTacToe.Button (this);
                k++;
            }
        }
    }

    public void attach_buttons (Gtk.Button[,] buttons) {
        for ( var i = 0; i < 3; i++ ) {
            for ( var j = 0; j < 3; j++ ) {
                attach (buttons[i,j], j, i+1);
            }
        }
    }

    public void remove_buttons (Gtk.Button[,] buttons) {
        for ( var i = 0; i < 3; i++ ) {
            for ( var j = 0; j < 3; j++ ) {
                remove (buttons[i,j]);
            }
        }
    }
}
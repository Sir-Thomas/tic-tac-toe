public class TicTacToe.GameBox : Gtk.Box {
    public int turn = 1;

    construct {
        orientation = Gtk.Orientation.VERTICAL;

        var new_game = new Gtk.Button.with_label (_("New Game"));
        var grid = new TicTacToe.Grid (this);
        new_game.clicked.connect ( () => grid.reset_game() );
        
        append (new_game);
        append (grid);
    }

    public void advance_turn () {
        if ( turn == 1 ) {
            turn = 2;
        } else {
            turn = 1;
        }
    }
}
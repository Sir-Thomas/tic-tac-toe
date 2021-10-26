public class TicTacToe.TitleBar : Gtk.Box {
    public TicTacToe.GameBox game_box;
    public Gtk.Label active_player = new Gtk.Label (_("Player 1's Turn"));
    public Gtk.Button new_game_button;

    public TitleBar (TicTacToe.GameBox box) {
        game_box = box;
    }

    construct {
        hexpand = true;
        homogeneous = true;
        spacing = 50;
        new_game_button = new Gtk.Button.with_label (_("New Game"));
        new_game_button.clicked.connect (new_game);
        
        append (active_player);
        append (new_game_button);
    }

    public void new_game () {
        game_box.new_game ();
    }
}
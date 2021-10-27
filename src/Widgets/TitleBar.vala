public class TicTacToe.TitleBar : Gtk.Box {
    public TicTacToe.GameBox game_box;
    public Gtk.Label active_player_label = new Gtk.Label (_("Player 1's Turn"));
    public Gtk.Button undo_button = new Gtk.Button.with_label (_("Undo"));
    public Gtk.Button redo_button = new Gtk.Button.with_label (_("Redo"));

    public TitleBar (TicTacToe.GameBox box) {
        game_box = box;
    }

    construct {
        hexpand = true;
        homogeneous = true;
        spacing = 6;
        var new_game_button = new Gtk.Button.with_label (_("New Game"));
        new_game_button.clicked.connect (() => game_box.new_game ());
        undo_button.sensitive = false;
        undo_button.clicked.connect (() => game_box.undo ());
        redo_button.sensitive = false;
        redo_button.clicked.connect (() => game_box.redo ());
        
        append (active_player_label);
        append (undo_button);
        append (redo_button);
        append (new_game_button);
    }
}
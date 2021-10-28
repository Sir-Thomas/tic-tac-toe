public class TicTacToe.TitleBar : Gtk.Grid {
    public TicTacToe.GameBox game_box;
    public Gtk.Label active_player_label = new Gtk.Label (_("Player 1's Turn"));
    public Gtk.Button undo_button = new Gtk.Button.with_label (_("Undo"));
    public Gtk.Button redo_button = new Gtk.Button.with_label (_("Redo"));

    public TitleBar (TicTacToe.GameBox box) {
        game_box = box;
    }

    construct {
        margin_bottom = 6;
        column_spacing = 6;
        column_homogeneous = true;
        var new_game_button = new Gtk.Button.with_label (_("New Game"));
        new_game_button.clicked.connect (() => game_box.new_game ());
        undo_button.sensitive = false;
        undo_button.clicked.connect (() => game_box.undo ());
        redo_button.sensitive = false;
        redo_button.clicked.connect (() => game_box.redo ());

        active_player_label.hexpand = true;
        undo_button.hexpand = true;
        redo_button.hexpand = true;
        new_game_button.hexpand = true;
        active_player_label.vexpand = true;
        undo_button.vexpand = true;
        redo_button.vexpand = true;
        new_game_button.vexpand = true;
        
        attach (active_player_label, 0, 0);
        attach (undo_button, 1, 0);
        attach (redo_button, 2, 0);
        attach (new_game_button, 3, 0);
    }
}
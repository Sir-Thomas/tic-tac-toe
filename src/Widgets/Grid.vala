public class TicTacToe.Grid : Gtk.Grid {
    public TicTacToe.GameBox game_box;
    public TicTacToe.Button[] buttons = new TicTacToe.Button[9];
    string X_VALUE = "<span size=\"xx-large\">X</span>";
    string O_VALUE = "<span size=\"xx-large\">O</span>";

    public Grid (TicTacToe.GameBox box) {
        game_box = box;
    }

    construct {
        vexpand = true;
        hexpand = true;
        column_homogeneous = true;
        row_homogeneous = true;
        column_spacing = 6;
        row_spacing = 6;

        create_buttons ();
        attach_buttons ();
    }

    public void advance_turn (int id, bool redo) {
        game_box.advance_turn (id, redo);
    }

    public void new_game () {
        remove_buttons ();
        create_buttons ();
        attach_buttons ();
    }

    public void create_buttons () {
        for ( var i = 0; i < 9; i++ ) {
            buttons[i] = new TicTacToe.Button (this, i);
        }
    }

    public void attach_buttons () {
        for ( var i = 0; i < 3; i++ ) {
            for ( var j = 0; j < 3; j++ ) {
                attach (buttons[3*i+j], j, i);
            }
        }
    }

    public void remove_buttons () {
        for ( var i = 0; i < 9; i++ ) {
            remove (buttons[i]);
        }
    }

    public int get_active_player () {
        return game_box.active_player;
    }

    public int check_for_winner () {
        int winner = check_rows ();

        if (winner == 0) {
            winner = check_columns();
        }

        if (winner == 0) {
            winner = check_diags();
        }

        return winner;
    }

    public int check_rows () {
        int x = 0;
        int o = 0;

        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (buttons[3*i+j].label == X_VALUE) {
                    x++;
                    o = 0;
                    if (x == 3) {
                        return 1;
                    }
                } else if (buttons[3*i+j].label == O_VALUE) {
                    o++;
                    x = 0;
                    if (o == 3) {
                        return 2;
                    }
                } else {
                    x = 0;
                    o = 0;
                }
            }
            x = 0;
            o = 0;
        }
        return 0;
    }

    public int check_columns () {
        int x = 0;
        int o = 0;

        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (buttons[3*j+i].label == X_VALUE) {
                    x++;
                    o = 0;
                    if (x == 3) {
                        return 1;
                    }
                } else if (buttons[3*j+i].label == O_VALUE) {
                    o++;
                    x = 0;
                    if (o == 3) {
                        return 2;
                    }
                } else {
                    x = 0;
                    o = 0;
                }
            }
            x = 0;
            o = 0;
        }
        return 0;
    }

    public int check_diags () {
        int x = 0;
        int o = 0;

        for (int i = 0; i < 9; i += 4) {
            if (buttons[i].label == X_VALUE) {
                x++;
                o = 0;
                if (x == 3) {
                    return 1;
                }
            } else if (buttons[i].label == O_VALUE) {
                o++;
                x = 0;
                if (o == 3) {
                    return 2;
                }
            } else {
                x = 0;
                o = 0;
            }
        }

        x = 0;
        o = 0;

        for (int i = 2; i < 7; i += 2) {
            if (buttons[i].label == X_VALUE) {
                x++;
                o = 0;
                if (x == 3) {
                    return 1;
                }
            } else if (buttons[i].label == O_VALUE) {
                o++;
                x = 0;
                if (o == 3) {
                    return 2;
                }
            } else {
                x = 0;
                o = 0;
            }
        }
        return 0;
    }

    public void disable_buttons () {
        for ( var i = 0; i < 9; i++ ) {
            buttons[i].sensitive = false;
        }
    }

    public void reset_button (int id) {
        buttons[id].label = "";
        buttons[id].sensitive = true;
    }
}
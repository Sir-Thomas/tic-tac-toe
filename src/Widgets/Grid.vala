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
                if (buttons[i,j].label == "X") {
                    x++;
                    o = 0;
                    if (x == 3) {
                        return 1;
                    }
                } else if (buttons[i,j].label == "O") {
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
        }
        return 0;
    }

    public int check_columns () {
        int x = 0;
        int o = 0;

        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (buttons[j,i].label == "X") {
                    x++;
                    o = 0;
                    if (x == 3) {
                        return 1;
                    }
                } else if (buttons[j,i].label == "O") {
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
        }
        return 0;
    }

    public int check_diags () {
        int x = 0;
        int o = 0;

        for (int i = 0; i < 3; i++) {
            if (buttons[i,i].label == "X") {
                x++;
                o = 0;
                if (x == 3) {
                    return 1;
                }
            } else if (buttons[i,i].label == "O") {
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

        for (int i = 0; i < 3; i++) {
            if (buttons[2-i,i].label == "X") {
                x++;
                o = 0;
                if (x == 3) {
                    return 1;
                }
            } else if (buttons[2-i,i].label == "O") {
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
}
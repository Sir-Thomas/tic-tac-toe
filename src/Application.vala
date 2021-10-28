/*
 * SPDX-License-Identifier: GPL-3.0-or-later
 * SPDX-FileCopyrightText: 2021 Tommy Priest <tommy@sirthomas.xyz>
 */

public class TicTacToeApp : Gtk.Application {
    public TicTacToeApp () {
        Object (
            application_id: "com.github.sirthomas.tic-tac-toe",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    var main_window = new Gtk.ApplicationWindow (this) {
            title = _("tic-tac-toe"),
            default_height = 500,
            default_width = 500
        };
        
        main_window.decorated = false;
        var box = new TicTacToe.GameBox ();
        main_window.child = box;
        main_window.present ();
    }

    public static int main (string[] args) {
        return new TicTacToeApp ().run (args);
    }
}
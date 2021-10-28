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

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this) {
            title = _("tic-tac-toe"),
            default_height = 812,
            default_width = 375
        };
        var box = new TicTacToe.GameBox ();
        main_window.child = box;
        main_window.present ();
    }

    public static int main (string[] args) {
        return new TicTacToeApp ().run (args);
    }
}
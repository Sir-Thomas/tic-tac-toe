/*
 * SPDX-License-Identifier: GPL-3.0-or-later
 * SPDX-FileCopyrightText: 2021 Tommy Priest <tommy@sirthomas.xyz>
 */

public class TicTacToe : Gtk.Application {
    public TicTacToe () {
        Object (
            application_id: "com.github.sirthomas.tic-tac-toe",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this) {
            title = _("tic-tac-toe"),
            default_height = 500,
            default_width = 500
        };
        var label = new Gtk.Label (_("tic-tac-toe"));
        main_window.child = label;
        main_window.present ();
    }

    public static int main (string[] args) {
        return new TicTacToe ().run (args);
    }
}
public class TicTacToe.Grid : Gtk.Grid {
    construct {
        vexpand = true;
        hexpand = true;
        column_homogeneous = true;
        row_homogeneous = true;

        Gtk.Label[,] labels = new Gtk.Label[3,3];
        labels[0,0] = new Gtk.Label ("1");
        labels[0,1] = new Gtk.Label ("2");
        labels[0,2] = new Gtk.Label ("3");
        labels[1,0] = new Gtk.Label ("4");
        labels[1,1] = new Gtk.Label ("5");
        labels[1,2] = new Gtk.Label ("6");
        labels[2,0] = new Gtk.Label ("7");
        labels[2,1] = new Gtk.Label ("8");
        labels[2,2] = new Gtk.Label ("9");

        attach (labels[0,0], 0, 0);
        attach (labels[0,1], 1, 0);
        attach (labels[0,2], 2, 0);
        attach (labels[1,0], 0, 1);
        attach (labels[1,1], 1, 1);
        attach (labels[1,2], 2, 1);
        attach (labels[2,0], 0, 2);
        attach (labels[2,1], 1, 2);
        attach (labels[2,2], 2, 2);
    }
}
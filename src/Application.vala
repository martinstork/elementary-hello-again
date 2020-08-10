/*
* Copyright (c) 2020 Martin Stork (https://martinstork.net)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Martin Stork <martin.stork95@gmail.com>
*/

public class Application : Gtk.Application {
    public Application () {
        Object (
            application_id: "com.github.martinstork.elementary-hello-again",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow(this) {
            default_height = 200,
            default_width = 300,
            title = "MyApp"
        };

        var hello_button = new Gtk.Button.with_label (_("Say Hello"));
        var hello_label = new Gtk.Label (null);

        var rotate_button = new Gtk.Button.with_label (_("Rotate"));
        var rotate_label = new Gtk.Label (_("Horizontal"));

        var grid = new Gtk.Grid ();
        grid.column_spacing = 6;
        grid.row_spacing = 6;

        // add first row of widgets
        grid.attach (hello_button, 0, 0, 2, 1);
        // default behaviour: span 1 column and row
        grid.attach_next_to (hello_label, hello_button, Gtk.PositionType.RIGHT);

        // add second row of widgets
        grid.attach (rotate_button, 0, 1);
        grid.attach_next_to (rotate_label, rotate_button, Gtk.PositionType.RIGHT, 1, 1);

        main_window.add (grid);

        hello_button.clicked.connect (() => {
            hello_label.label = _("Hello World!");
            hello_button.sensitive = false;
        });

        rotate_button.clicked.connect (() => {
            rotate_label.angle = 90;
            rotate_label.label = _("Vertical");
            rotate_button.sensitive = false;
        });

        main_window.show_all();
    }

    public static int main (string[] args) {
        return new Application ().run(args);
    }
}

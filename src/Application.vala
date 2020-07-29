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
        
        /// TRANSLATORS: This is a string you can translate
        string hello_again_world = _("Hello Again World!");
        var label = new Gtk.Label (hello_again_world);
        
        main_window.add(label);
        main_window.show_all();
    }

    public static int main (string[] args) {
        return new Application ().run(args);
    }
}

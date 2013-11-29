#!/usr/bin/env python

import gtk
from nesgui import NesGui

if __name__ == '__main__':
    win = NesGui.NesGui ()
    win.window.show_all ()
    gtk.main ()

#!/usr/bin/env python

import pygtk
pygtk.require ('2.0')
import gtk

import sys
import os
import re
import threading

import Constants

class CommandRunner (threading.Thread):
    def __init__(self, cmd):
        self.cmd = cmd
        threading.Thread.__init__(self)

    def run (self):
        os.system (self.cmd)

class NesGui ():

    __shared_state = {}

    def __init__(self):
        self.__dict__ = self.__shared_state
        self.commandRunner = None
        self.romFullPath = {}
        self.initialize ()

    def gtk_main_quit ( self, window ):
        gtk.main_quit ()

    def startOptions (self, widget):
        self.optionsDialog.run ()
        self.optionsDialog.hide ()

    def nesDelete ( self, window, event ):
        gtk.main_quit ()

    def clearTreeStore (self):
        self.treestore.clear ()

    def insertToList (self, string):
        self.treestore.append (None, [string])

    def getRomList (self, path, keywords=None):
        self.clearTreeStore ()

        fileList = []
        for dirpath, dirnames, filenames in os.walk (path):
            fileList.extend (filenames)
            for rom in filenames:
                self.romFullPath[rom] = os.path.join (dirpath, rom)

        fileList.sort ()
        keywords = self.keywords.get_text ().split ()

        for file in fileList:
            if self.matchesKeywords (file, keywords):
                self.insertToList (file)

    def matchesKeywords (self, file, keywords):
        if not keywords: return True

        for i in range (len (keywords)):
            keyword = keywords[i]

            if (re.search (keyword, file, re.I) and
                i == len (keywords) - 1):
                return True
            elif re.search (keyword, file, re.I):
                continue
            else:
                return False

    def getSelectedRom (self):
        selection = self.treeview.get_selection ()
        (model, iter) = selection.get_selected ()
        return self.treestore.get (iter,0)[0]

    def killEmulator (self):
        if sys.platform == 'linux2':
            os.system ('killall ' + Constants.EMULATOR)
        else:
            pass #This would be a windows command

    def runEmulator (self, arg1=None, arg2=None):
        print '#' * 50
        if (self.commandRunner != None and
            self.commandRunner.isAlive ()):
            self.killEmulator ()

        romFile = self.romFullPath[self.getSelectedRom ()]
        cmd = '%s "%s"' % (Constants.EMULATOR, romFile)
        self.commandRunner = CommandRunner (cmd)
        self.commandRunner.start ()

    def handleTreeStoreEvent (self, window, event):
        if event.type == gtk.gdk._2BUTTON_PRESS:
            self.runEmulator (None, None)
        elif (event.type == gtk.gdk.KEY_PRESS and
              gtk.gdk.keyval_name (event.keyval) == 'Return'):
            self.runEmulator (None, None)
            return

    def handleEntryEvent (self, widget):
        self.getRomList (self.romPath.get_text (),
                         self.keywords.get_text ())

    def _setSettings (self):
        self.screenSize = 1

    def initialize (self):
        path = sys.path[0]
        self._setSettings ()

        self.builder = gtk.Builder ()
        self.builder.add_from_file (os.path.join (path,
                                                  'data',
                                                  Constants.GLADE_FILE))

        self.window = self.builder.get_object ( 'window1' )

        self.romPath = self.builder.get_object ('entry1')
        self.keywords = self.builder.get_object ('entry2')
        self.optionsDialog = self.builder.get_object ('dialog1')
        self.romPath.set_text (Constants.DEFAULT_ROM_PATH)

        self.treeview = self.builder.get_object ('treeview1')
        self.treestore = gtk.TreeStore (str)

        self.getRomList (Constants.DEFAULT_ROM_PATH)

        # add columns:
        cell0 = gtk.CellRendererText ()
        col0 = gtk.TreeViewColumn ('Filename', cell0,
                                   text=0)
        self.treeview.append_column (col0)
        self.treeview.set_model (self.treestore)
        self.treeview.set_reorderable (True)

        self.builder.connect_signals ( self )

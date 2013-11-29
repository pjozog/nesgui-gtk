<?xml version="1.0"?>
<interface>
  <requires lib="gtk+" version="2.16"/>
  <!-- interface-naming-policy project-wide -->
  <object class="GtkListStore" id="liststore1">
    <columns>
      <!-- column-name Filename -->
      <column type="gchararray"/>
      <!-- column-name Age -->
      <column type="gint"/>
    </columns>
  </object>
  <object class="GtkWindow" id="window1">
    <property name="width_request">750</property>
    <property name="height_request">400</property>
    <signal name="destroy" handler="gtk_main_quit"/>
    <signal name="delete_event" handler="nesDelete"/>
    <child>
      <object class="GtkTable" id="table1">
        <property name="visible">True</property>
        <property name="n_rows">11</property>
        <property name="n_columns">10</property>
        <child>
          <object class="GtkMenuBar" id="menubar1">
            <property name="visible">True</property>
            <child>
              <object class="GtkMenuItem" id="menuitem1">
                <property name="visible">True</property>
                <property name="label" translatable="yes">_File</property>
                <property name="use_underline">True</property>
                <child type="submenu">
                  <object class="GtkMenu" id="menu1">
                    <property name="visible">True</property>
                    <child>
                      <object class="GtkImageMenuItem" id="options">
                        <property name="label">gtk-preferences</property>
                        <property name="visible">True</property>
                        <property name="use_underline">True</property>
                        <property name="use_stock">True</property>
                        <signal name="activate" handler="startOptions"/>
                      </object>
                    </child>
                    <child>
                      <object class="GtkSeparatorMenuItem" id="separatormenuitem1">
                        <property name="visible">True</property>
                      </object>
                    </child>
                    <child>
                      <object class="GtkImageMenuItem" id="imagemenuitem5">
                        <property name="label">gtk-quit</property>
                        <property name="visible">True</property>
                        <property name="use_underline">True</property>
                        <property name="use_stock">True</property>
                        <signal name="activate" handler="gtk_main_quit"/>
                      </object>
                    </child>
                  </object>
                </child>
              </object>
            </child>
          </object>
          <packing>
            <property name="right_attach">10</property>
            <property name="x_options">GTK_FILL</property>
            <property name="y_options">GTK_FILL</property>
          </packing>
        </child>
        <child>
          <object class="GtkLabel" id="Rom Path">
            <property name="visible">True</property>
            <property name="label" translatable="yes">Rom Path</property>
          </object>
          <packing>
            <property name="left_attach">4</property>
            <property name="right_attach">6</property>
            <property name="top_attach">1</property>
            <property name="bottom_attach">2</property>
          </packing>
        </child>
        <child>
          <object class="GtkLabel" id="Regex Keywords">
            <property name="visible">True</property>
            <property name="yalign">0.47999998927116394</property>
            <property name="label" translatable="yes">Regex Keywords</property>
          </object>
          <packing>
            <property name="left_attach">4</property>
            <property name="right_attach">6</property>
            <property name="top_attach">3</property>
            <property name="bottom_attach">4</property>
          </packing>
        </child>
        <child>
          <object class="GtkEntry" id="entry2">
            <property name="visible">True</property>
            <property name="can_focus">True</property>
            <property name="tooltip_text" translatable="yes">Regular expression keywords for filenames</property>
            <property name="invisible_char">&#x25CF;</property>
            <signal name="activate" handler="handleEntryEvent"/>
          </object>
          <packing>
            <property name="left_attach">2</property>
            <property name="right_attach">8</property>
            <property name="top_attach">4</property>
            <property name="bottom_attach">5</property>
          </packing>
        </child>
        <child>
          <object class="GtkScrolledWindow" id="scrolledwindow1">
            <property name="visible">True</property>
            <property name="can_focus">True</property>
            <property name="hscrollbar_policy">automatic</property>
            <property name="vscrollbar_policy">automatic</property>
            <child>
              <object class="GtkTreeView" id="treeview1">
                <property name="visible">True</property>
                <property name="can_focus">True</property>
                <property name="model">liststore1</property>
                <property name="search_column">0</property>
                <signal name="button_press_event" handler="handleTreeStoreEvent"/>
                <signal name="key_press_event" handler="handleTreeStoreEvent"/>
              </object>
            </child>
          </object>
          <packing>
            <property name="right_attach">10</property>
            <property name="top_attach">5</property>
            <property name="bottom_attach">10</property>
          </packing>
        </child>
        <child>
          <object class="GtkButton" id="button1">
            <property name="label" translatable="yes">Start Emulator</property>
            <property name="visible">True</property>
            <property name="can_focus">True</property>
            <property name="receives_default">True</property>
            <signal name="clicked" handler="runEmulator"/>
          </object>
          <packing>
            <property name="left_attach">4</property>
            <property name="right_attach">6</property>
            <property name="top_attach">10</property>
            <property name="bottom_attach">11</property>
          </packing>
        </child>
        <child>
          <object class="GtkEntry" id="entry1">
            <property name="visible">True</property>
            <property name="can_focus">True</property>
            <property name="tooltip_text" translatable="yes">Path to rom files goes here</property>
            <property name="invisible_char">&#x25CF;</property>
            <signal name="activate" handler="handleEntryEvent"/>
          </object>
          <packing>
            <property name="left_attach">2</property>
            <property name="right_attach">8</property>
            <property name="top_attach">2</property>
            <property name="bottom_attach">3</property>
          </packing>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
      </object>
    </child>
  </object>
  <object class="GtkDialog" id="dialog1">
    <property name="border_width">5</property>
    <property name="type_hint">normal</property>
    <property name="has_separator">False</property>
    <child internal-child="vbox">
      <object class="GtkVBox" id="dialog-vbox1">
        <property name="visible">True</property>
        <property name="spacing">2</property>
        <child>
          <object class="GtkVBox" id="vbox1">
            <property name="visible">True</property>
            <child>
              <object class="GtkHBox" id="hbox1">
                <property name="visible">True</property>
                <child>
                  <object class="GtkLabel" id="label1">
                    <property name="visible">True</property>
                    <property name="label" translatable="yes">Screen Size:</property>
                  </object>
                  <packing>
                    <property name="position">0</property>
                  </packing>
                </child>
                <child>
                  <object class="GtkRadioButton" id="1x">
                    <property name="label" translatable="yes">1x</property>
                    <property name="visible">True</property>
                    <property name="can_focus">True</property>
                    <property name="receives_default">False</property>
                    <property name="active">True</property>
                    <property name="draw_indicator">True</property>
                  </object>
                  <packing>
                    <property name="position">1</property>
                  </packing>
                </child>
                <child>
                  <object class="GtkRadioButton" id="2x">
                    <property name="label" translatable="yes">2x</property>
                    <property name="visible">True</property>
                    <property name="can_focus">True</property>
                    <property name="receives_default">False</property>
                    <property name="active">True</property>
                    <property name="draw_indicator">True</property>
                    <property name="group">1x</property>
                  </object>
                  <packing>
                    <property name="position">2</property>
                  </packing>
                </child>
                <child>
                  <object class="GtkRadioButton" id="3x">
                    <property name="label" translatable="yes">3x</property>
                    <property name="visible">True</property>
                    <property name="can_focus">True</property>
                    <property name="receives_default">False</property>
                    <property name="active">True</property>
                    <property name="draw_indicator">True</property>
                    <property name="group">1x</property>
                  </object>
                  <packing>
                    <property name="position">3</property>
                  </packing>
                </child>
                <child>
                  <object class="GtkRadioButton" id="4x">
                    <property name="label" translatable="yes">4x</property>
                    <property name="visible">True</property>
                    <property name="can_focus">True</property>
                    <property name="receives_default">False</property>
                    <property name="active">True</property>
                    <property name="draw_indicator">True</property>
                    <property name="group">1x</property>
                  </object>
                  <packing>
                    <property name="position">4</property>
                  </packing>
                </child>
              </object>
              <packing>
                <property name="position">0</property>
              </packing>
            </child>
            <child>
              <placeholder/>
            </child>
            <child>
              <placeholder/>
            </child>
          </object>
          <packing>
            <property name="position">1</property>
          </packing>
        </child>
        <child internal-child="action_area">
          <object class="GtkHButtonBox" id="dialog-action_area1">
            <property name="visible">True</property>
            <property name="layout_style">end</property>
            <child>
              <object class="GtkButton" id="button2">
                <property name="label">gtk-ok</property>
                <property name="visible">True</property>
                <property name="can_focus">True</property>
                <property name="receives_default">True</property>
                <property name="use_stock">True</property>
              </object>
              <packing>
                <property name="expand">False</property>
                <property name="fill">False</property>
                <property name="position">0</property>
              </packing>
            </child>
            <child>
              <object class="GtkButton" id="button3">
                <property name="label">gtk-cancel</property>
                <property name="visible">True</property>
                <property name="can_focus">True</property>
                <property name="receives_default">True</property>
                <property name="use_stock">True</property>
              </object>
              <packing>
                <property name="expand">False</property>
                <property name="fill">False</property>
                <property name="position">1</property>
              </packing>
            </child>
          </object>
          <packing>
            <property name="expand">False</property>
            <property name="pack_type">end</property>
            <property name="position">0</property>
          </packing>
        </child>
      </object>
    </child>
    <action-widgets>
      <action-widget response="0">button2</action-widget>
      <action-widget response="0">button3</action-widget>
    </action-widgets>
  </object>
</interface>

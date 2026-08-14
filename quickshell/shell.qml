import Quickshell // for PanelWindow
import QtQuick // for Text

PanelWindow {
  anchors {
    top: false
    left: true
    right: true
    bottom: true
  }

  implicitHeight: 50

  Text {
    // center the bar in its parent component (the window)
    anchors.centerIn: parent

    text: "hello world"
  }
}

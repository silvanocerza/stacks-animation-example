import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("StackLayout Animation Example")

    MyStackLayout {
        anchors.fill: parent
    }

}

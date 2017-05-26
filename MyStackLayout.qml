import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

Page {

    header: TabBar {
        id: bar
        width: parent.width
        TabButton {
            text: qsTr("Home")
        }
        TabButton {
            text: qsTr("Discover")
        }
        TabButton {
            text: qsTr("Activity")
        }
    }

    StackLayout {
        id: stackLayout

        anchors.fill: parent
        currentIndex: bar.currentIndex

        onCurrentIndexChanged: {
            switch (currentIndex) {
            case 0:
                homeTab.opacity = 1;
                discoverTab.opacity = 0;
                activityTab.opacity = 0;
                break;
            case 1:
                homeTab.opacity = 0;
                discoverTab.opacity = 1;
                activityTab.opacity = 0;
                break;
            case 2:
                homeTab.opacity = 0
                discoverTab.opacity = 0;
                activityTab.opacity = 1;
                break;
            }
        }

        Rectangle {
            id: homeTab
            color: "blue"
            Label {
                anchors.centerIn: parent
                font.pixelSize: 30
                text: qsTr("Home")
            }

            Behavior on opacity {
                NumberAnimation { duration: 1000 }
            }
        }

        Rectangle {
            id: discoverTab
            color: "green"
            Label {
                anchors.centerIn: parent
                font.pixelSize: 30
                text: qsTr("Discover")
            }

            Behavior on opacity {
                NumberAnimation { duration: 1000 }
            }
        }

        Rectangle {
            id: activityTab
            color: "pink"
            Label {
                anchors.centerIn: parent
                font.pixelSize: 30
                text: qsTr("Activity")
            }

            Behavior on opacity {
                NumberAnimation { duration: 1000 }
            }
        }
    }
}

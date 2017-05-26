import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1

Page {

    header: TabBar {
        id: bar
        width: parent.width

        currentIndex: 0

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

        // When changing index we set new index opacity to 1 to let it fade in
        // and other items in StackView to 0 so that they fade out. We also set
        // all items to visible since StackLayout makes the old item mmediately
        // invisible and crossfade wouldn't work
        onCurrentIndexChanged: {
            switch (currentIndex) {
            case 0:
                homeTab.opacity = 1;
                homeTab.visible = true;

                discoverTab.opacity = 0;
                discoverTab.visible = true;

                activityTab.opacity = 0;
                activityTab.visible = true;
                break;
            case 1:
                homeTab.opacity = 0;
                homeTab.visible = true;

                discoverTab.opacity = 1;
                discoverTab.visible = true;

                activityTab.opacity = 0;
                activityTab.visible = true;
                break;
            case 2:
                homeTab.opacity = 0
                homeTab.visible = true;

                discoverTab.opacity = 0;
                discoverTab.visible = true;

                activityTab.opacity = 1;
                activityTab.visible = true;
                break;
            }
        }

        // Home Page
        Rectangle {
            id: homeTab
            color: "blue"

            // Starting item should be visible and completely opaque
            opacity: 1
            visible: true

            Label {
                anchors.centerIn: parent
                font.pixelSize: 30
                text: qsTr("Home")
            }

            // Animates opacity change
            Behavior on opacity {
                NumberAnimation { duration: 1000 }
            }
        }

        // Discover Page
        Rectangle {
            id: discoverTab
            color: "green"

            // Items not visible from the start should be completely invisible
            // so that crossfade will work correctly when clicking TabBar for
            // the first time
            opacity: 0
            visible: false

            Label {
                anchors.centerIn: parent
                font.pixelSize: 30
                text: qsTr("Discover")
            }

            // Animates opacity change
            Behavior on opacity {
                NumberAnimation { duration: 1000 }
            }
        }

        // Activity Page
        Rectangle {
            id: activityTab
            color: "pink"

            // Items not visible from the start should be completely invisible
            // so that crossfade will work correctly when clicking TabBar for
            // the first time
            opacity: 0
            visible: false

            Label {
                anchors.centerIn: parent
                font.pixelSize: 30
                text: qsTr("Activity")
            }

            // Animates opacity change
            Behavior on opacity {
                NumberAnimation { duration: 1000 }
            }
        }
    }
}

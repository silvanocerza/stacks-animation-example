import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0

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

        onCurrentIndexChanged: {
            switch (currentIndex) {
                case 0:
                    stackView.replace(homePageComponent);
                    break;
                case 1:
                    stackView.replace(discoverPageComponent);
                    break;
                case 2:
                    stackView.replace(activityPageComponent);
                    break;
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        // Applied to the item that enters the stack when the item is replacing
        // another item
        replaceEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 1000
            }
        }

        // Applied to the item that exits the stack when another item replaces it
        replaceExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 1000
            }
        }

        initialItem: homePageComponent

        // Home Page
        Component {
            id: homePageComponent
            Page {
                id: homePage
                background: Rectangle { color: "blue" }

                Label {
                    anchors.centerIn: parent
                    font.pixelSize: 30
                    text: qsTr("Home")
                }
            }
        }

        // Discover Page
        Component {
            id: discoverPageComponent
            Page {
                id: discoverPage
                background: Rectangle { color: "green" }

                Label {
                    anchors.centerIn: parent
                    font.pixelSize: 30
                    text: qsTr("Discover")
                }
            }
        }

        // Activity Page
        Component {
            id: activityPageComponent
            Page {
                id: activityPage
                background: Rectangle { color: "pink" }

                Label {
                    anchors.centerIn: parent
                    font.pixelSize: 30
                    text: qsTr("Activity")
                }
            }
        }
    }
}

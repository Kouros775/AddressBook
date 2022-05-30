import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


ApplicationWindow{
    id: root;
    width: 640;
    height: 280;
    visible: true;
    title: qsTr("JMY WORLD.");

    menuBar: MenuBar{
        Menu{
            title: qsTr("Window");
            MenuItem{
                text: qsTr("AddressBook");
                onTriggered: {
                    mainLoader.source = "AddressBookView.qml";
                }
            }
            MenuItem{
                text: qsTr("About Me");
                onTriggered: {
                    mainLoader.source = "AboutMeView.qml";
                }
            }
        }
    }

    Loader{
        id: mainLoader;
        anchors.fill: parent;
        source: "AddressBookView.qml";
    }
}

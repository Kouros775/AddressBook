import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ViewModel 1.0


Item {
    id: root;
    width: 640
    height: 480
    visible: true

    property int listWidth: root.width;

    Component.onCompleted: {
        console.log("Info - AddressBook View Created.");
    }
    Component.onDestruction: {
        console.log("Info - AddressBook View destroyed.");
    }

    AddressBookViewModel{
        id: myModel;
    }

    ListModel{
        id: addressDataModel;
        ListElement{
            name: "apple";
            age: "10";
            phoneNumber: "111-1111";
        }
        ListElement{
            name: "bus";
            age: "20";
            phoneNumber: "222-2222";
        }
        ListElement{
            name: "cat";
            age: "30";
            phoneNumber: "333-3333";
        }
        ListElement{
            name: "dude";
            age: "40";
            phoneNumber: "444-4444";
        }
        ListElement{
            name: "elbow";
            age: "50";
            phoneNumber: "555-5555";
        }
    }

    Component{
        id: listViewDelegate;

        Rectangle{
            id: listDelegateArea;
            width: listWidth;
            height: 40;
            border.color: "black";
            color: "lightGray";

            Row{
                width: listWidth;
                height: 40;

                Label{
                    width: parent.width * 0.3
                    height: parent.height;
                    text: model.name;
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                Label{
                    width: parent.width * 0.2
                    height: parent.height;
                    text: model.age;
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                Label{
                    anchors.leftMargin: 10;
                    width: parent.width * 0.5
                    height: parent.height;
                    text: model.phoneNumber;
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            MouseArea{
                id: listMouse;
                anchors.fill: parent;
                hoverEnabled: true;

                onEntered: {
                    //if(myList.currentIndex === index)
                    //    parent.color= "transparent";
                    //else
                        parent.color = "lightblue";
                }

                onExited: {
                     parent.color = "lightGray";

                    if(myList.currentIndex === index)
                        parent.color = "blue";
                    else
                        parent.color = "lightGray";
                }

                onClicked: {
                    myList.currentIndex = index;
                    parent.color = "blue";
                    myModel.selectRow(index);
                }

            }
        }
    }

    Component{
        id: listViewHeader;

        Rectangle{
            width: listWidth;
            height: 40;
            color: "darkgray";
            anchors.margins: 3

            Row{
                anchors.fill: parent;
                width: listWidth;
                height: 40;

                Label{
                    width: parent.width * 0.3;
                    height: parent.height;
                    text: "Name";
                    verticalAlignment: Text.AlignVCenter;
                    horizontalAlignment: Text.AlignHCenter;
                }

                Label{
                    width: parent.width * 0.2;
                    height: parent.height;
                    text: "Age";
                    verticalAlignment: Text.AlignVCenter;
                    horizontalAlignment: Text.AlignHCenter;
                }

                Label{
                    anchors.leftMargin: 10;
                    width: parent.width * 0.5;
                    height: parent.height;
                    text: "Phone Number";
                    verticalAlignment: Text.AlignVCenter;
                    horizontalAlignment: Text.AlignHCenter;
                }
            }
        }
    }

    Component{
        id: highlightBar;

        Rectangle{
            width: myList.width;
            height: 40;
            color: "transparent";

            Rectangle{
                anchors.fill: parent;
                anchors.topMargin: 3;
                anchors.bottomMargin: 3;
                color: "blue";
            }
        }
    }

    ColumnLayout{
        anchors.fill: parent;


        Row{
            Layout.fillWidth: true;
            Layout.margins: 6;
            spacing: 6;
            Button{
                id: button1;
                width: (parent.width -24) / 3.0;
                text: qsTr("Add");
                highlighted: false;
            }
            Button{
                id: button2;
                width: (parent.width -24) / 3.0;
                text: qsTr("Remove");
                highlighted: false;
            }
            Button{
                id: button3;
                width: (parent.width -24) / 3.0;
                text: qsTr("Edit");
            }
        }

        Label{
            Layout.fillWidth: true;
            text: myModel.displayMsg;
        }

        ListView{
            id: myList;
            Layout.fillWidth: true;
            Layout.fillHeight: true;

            highlight: highlightBar;
            model: addressDataModel;
            header: listViewHeader;
            delegate: listViewDelegate;

            ScrollBar.vertical: ScrollBar{
                policy: ScrollBar.AsNeeded; // or AlwaysOn
            }
        }
    }
}

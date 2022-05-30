import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Item {
    id: root;
    width: 640
    height: 480
    visible: true

    property int listWidth: root.width;


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
                    text: model.Name;
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                Label{
                    width: parent.width * 0.2
                    height: parent.height;
                    text: model.Age;
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                Label{
                    anchors.leftMargin: 10;
                    width: parent.width * 0.5
                    height: parent.height;
                    text: model.Phone;
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
                    viewModel.SelectedIndex = index;
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
                id: addButton;
                width: (parent.width -24) / 3.0;
                text: qsTr("Add");
                highlighted: false;
                onClicked: {
                    viewModel.addAddressBookItem();
                }
            }
            Button{
                id: removeButton;
                width: (parent.width -24) / 3.0;
                text: qsTr("Remove");
                highlighted: false;
                onClicked: {
                    viewModel.removeAddressBookItem(viewModel.SelectedIndex);
                    viewModel.SelectedIndex = -1;
                }
            }
            Button{
                id: editButton;
                width: (parent.width -24) / 3.0;
                text: qsTr("Edit");
                onClicked: {
                    var selItem = viewModel.getAddressBookItem(viewModel.SelectedIndex);
                    editItem(selItem.Name, selItem.Age, selItem.Phone);
                }
            }
        }

        Label{
            Layout.fillWidth: true;
            text: viewModel.SelectedIndex;
        }

        ListView{
            id: myList;
            Layout.fillWidth: true;
            Layout.fillHeight: true;

            //highlight: highlightBar;
            model: viewModel.getListModel();
            header: listViewHeader;
            delegate: listViewDelegate;

            ScrollBar.vertical: ScrollBar{
                policy: ScrollBar.AsNeeded; // or AlwaysOn
            }
        }
    }
    function editItem(name, age, phone)
    {
        console.log("name : " + name);
        console.log("age : " + age);
        console.log("phone : " + phone);
    }
}

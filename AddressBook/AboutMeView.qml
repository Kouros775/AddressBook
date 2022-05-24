import QtQuick 2.0
import QtQuick.Window
import QtQuick.Controls


Window {
    id: aboutMeWindow;
    width: 600;
    height: 400;
    visible: true;


    Component.onCompleted: {
        console.log("Info - AboutMe View Created.");
    }
    Component.onDestruction: {
        console.log("Info - AboutMe View destroyed.");
    }

    Label{
        anchors.centerIn: parent;
        text: "Address Book - JMY";
    }
}

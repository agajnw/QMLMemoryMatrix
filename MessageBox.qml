import QtQuick 2.0

Rectangle {
    id: messageFlip
    anchors.centerIn: parent
    width: parent.width*0.8
    height: parent.height*0.4
    visible: false;
    z: 1

    color: "#f8d9ee"
    opacity: 0.0
    border.color: "white"
    border.width: 20
    radius: 30.0

    Text {
        id: messageText
        anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 14
    }

    function hide() {
        opacity = 0.0
        visible = false

        messageText.text = ""
    }
    function show(text) {
        visible = true
        opacity = 0.7
        messageText.text = text
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 300
        }
    }


}

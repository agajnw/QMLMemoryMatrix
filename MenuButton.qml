import QtQuick 2.0

Rectangle {
    y: parent.height*0.03
    x: parent.width*0.88
    height: parent.height * 0.1
    width: parent.width * 0.1
    opacity: 0.7
    color: "pink"
    radius: 20.0
    smooth: true
    z: 1

    property string buttonChar
    property string buttonMessage

    Text {
        id: helpText
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#5093af"

        horizontalAlignment: Text.AlignCenter
        font.pixelSize: parent.height*0.8
        font.bold: true
        font.family: "Fantasy"
        smooth: true

        text: buttonChar
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: messageFlip.show(buttonMessage)
        onExited: messageFlip.hide()
    }
}

import QtQuick 2.2
import QtQuick.Controls 1.1


Flipable {
    width: grid.cellWidth
    height: grid.cellHeight

    property color buttonColor: "#FDD9ED"
    property color onHoverColor: "#b2f6dd"
    property color clickedColor: "red"
    property bool isTarget: false
    property bool flipped: false


    front:
        Rectangle {
            id: front
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            color: parent.buttonColor
            radius: 2
            border.color: "black"
            border.width: 1

        }
    back:
        Rectangle {
            id: back
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            color: clickedColor
            radius: 2
            border.color: "black"
            border.width: 1

        }

    transform: Rotation {
        id: rotation
        origin.x: flipable.width/2
        origin.y: flipable.height/2
        axis.x: 0; axis.y: 1; axis.z: 0
        angle: 0
    }

    states: State {
        name: "back"
        PropertyChanges { target: rotation; angle: 180 }
        when: flipable.flipped
    }

    transitions: Transition {
        NumberAnimation { target: rotation; property: "angle"; duration: 300 }
    }

    signal itemClick()
    onItemClick: {

        if (clickedColor=="#008000" && flipable.flipped)
            return


        flipable.flipped ? cellModel.setProperty(index, "isFlipped", 0) :
                           cellModel.setProperty(index, "isFlipped", 1)

        if (clickedColor=="#008000")
            gameBoard.checkEnd()
        else
            gameBoard.handleBadClick()

    }

    MouseArea {
        anchors.fill: parent
        onClicked: parent.itemClick()
        hoverEnabled: true
        onEntered: front.color = parent.onHoverColor
        onExited: front.color = parent.buttonColor

    }

}

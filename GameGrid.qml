import QtQuick 2.0

Flipable {
    id: boardFlip
    y: parent.height*0.2
    opacity: 0.7
    anchors.horizontalCenter: parent.horizontalCenter
    height: parent.height * 0.7
    width: parent.width * 0.7

    property bool flipped: false
    property string backText: "hi"
    property var dataModel: [{colorName: "red", "isFlipped": true}, {}]

    front:
    Rectangle {
        id: boardBorder
        anchors.fill: parent
        color: "pink"
        radius: 20.0
        smooth: true

        Rectangle {
            id: board

            anchors.centerIn: parent
            height: parent.height * 0.85
            width: parent.width * 0.85
            opacity: 0.6
            color: "white"
            radius: 2.0
            smooth: true

            Grid {
                id: grid
                height: parent.height
                width: parent.width
                anchors.centerIn: parent
                rows: gameBoard.rows
                columns: gameBoard.columns
                spacing: 0

                property real cellWidth: (width - (columns - 1) * spacing) / columns
                property real cellHeight: (height - (rows - 1) * spacing) / rows

                Repeater {
                    id: cells
                    model: boardFlip.dataModel

                    Cell {
                        id: flipable
                        clickedColor: colorName
                        flipped: isFlipped
                    }
                }
            }

          }
        }

    back:
        Rectangle {
            id: messageBoardBorder
            anchors.fill: parent
            color: "pink"
            radius: 20.0
            smooth: true

            Rectangle {
                id: messageBoard

                anchors.centerIn: parent
                height: parent.height * 0.85
                width: parent.width * 0.85
                opacity: 0.6
                color: "white"
                radius: 2.0
                smooth: true

                Text {
                    id: messageText
                    anchors.centerIn: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 30
                    text: backText
                }
              }
            }

    transform: Rotation {
        id: rotation
        origin.x: boardFlip.width/2
        origin.y: boardFlip.height/2
        axis.x: 0; axis.y: 1; axis.z: 0
        angle: 0
    }

    states: State {
        name: "back"
        PropertyChanges { target: rotation; angle: 180 }
        when: boardFlip.flipped
    }

    transitions: Transition {
        NumberAnimation { target: rotation; property: "angle"; duration: 800 }
    }

}

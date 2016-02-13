import QtQuick 2.0

Rectangle {
    id: gameInfoBar
    y: parent.height*0.02
    anchors.horizontalCenter: parent.horizontalCenter
    height: parent.height * 0.13
    width: parent.width * 0.6
    opacity: 0.7
    color: "pink"
    radius: 20.0
    smooth: true
    z: 1

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 9

        Rectangle {
            id: tilesPanel
            height: gameInfoBar.height*0.7
            width: gameInfoBar.width*0.3
            opacity: 0.7
            color: "#5093af"
            radius: 20.0

            Text {
                id: tilesText
                anchors.centerIn: parent
                opacity: 1.0

                horizontalAlignment: Text.AlignCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: parent.height*0.3

                text: qsTr("Tiles: " + gameBoard.tiles)
            }
        }

        Rectangle {
            id: trialsPanel
            height: gameInfoBar.height*0.7
            width: gameInfoBar.width*0.3
            opacity: 0.7
            color: "#5093af"
            radius: 20.0

            Text {
                id: trialsText
                anchors.centerIn: parent
                opacity: 1.0

                horizontalAlignment: Text.AlignCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: parent.height*0.3

                text: qsTr("Trials: " + gameBoard.trials)
            }
        }

        Rectangle {
            id: scorePanel
            height: gameInfoBar.height*0.7
            width: gameInfoBar.width*0.3
            opacity: 0.7
            color: "#5093af"
            radius: 20.0

            Text {
                id: scoreText
                anchors.centerIn: parent
                opacity: 1.0

                horizontalAlignment: Text.AlignCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: parent.height*0.3

                text: qsTr("Score: " + gameBoard.score)
            }
        }
    }
}

import QtQuick 2.2
import QtQuick.Controls 1.1


ApplicationWindow {
    id: window
    visible: true
    width: 500
    height: 500
    title: "Memory Matrix"


    BoardModel3 {
        id: cellModel
    }


    Board {
        id: gameBoard
    }



}


import QtQuick 2.0

Rectangle {
    id: gameBoard
    width: parent.width
    height: parent.height
    color: "#86afc1"
    focus: true
    property int columns: 3
    property int rows: 3
    property int tiles: 3
    property int score: 0
    property int trials: 15
    property int tilesClicked: 0

    function reset()
    {
        score = 0
        tiles = 3
        columns = 3
        rows = 3
        trials = 15
        tilesClicked = 0

        generateBoard()
    }

    function generateBoard()
    {
        var i=0
        var j=0
        for (var j=0;j<cellModel.count;j++)
        {
            cellModel.setProperty(j, "colorName", "red")
        }
        do {
            j = Math.floor(Math.random()*cellModel.count)
            if (cellModel.get(j).colorName==="green")
                continue
            else
            {
                cellModel.setProperty(j, "colorName", "green")
                i++
            }
        }
        while (i<tiles)
        showAll()
        hideTimer.running = true

    }

    function showAll()
    {
        for (var i=0;i<cellModel.count;i++)
                cellModel.setProperty(i, "isFlipped", 1)

    }

    function hideAll()
    {
        for (var i=0;i<cellModel.count;i++)
                cellModel.setProperty(i, "isFlipped", 0)

    }

    function checkEnd()
    {
        gameBoard.tilesClicked++
        gameBoard.score += 10

        if (tilesClicked==tiles)
            handleCorrectBoard()
    }

    function handleCorrectBoard()
    {
        if (tiles<9)
            tiles++
        boardFlip.backText = "Bravo!\n\nNext: "+ tiles + " tiles"
        boardFlip.flipped = true
        tilesClicked = 0
        if (tiles==5 || tiles==8)
            enlargeTimer.running = true
        newBoardTimer.running = true
    }

    function handleBadClick()
    {
        showAll()
        if (tiles>3)
            tiles--
        trials--
        if (trials==0)
        {
            boardFlip.backText = "Game over!\n\nYour score: " + score
            boardFlip.flipped = true
            return
        }
        else
        {
            boardFlip.backText = "Wrong!\n\nNext: " + tiles + " tiles"
            boardFlip.flipped = true
        }
        if (tiles==4 || tiles==7)
            shrinkTimer.running = true
        newBoardTimer.running = true
    }


    function newBoard()
    {
        hideAll()
        tilesClicked = 0
        boardFlip.backText = ""
        boardFlip.flipped = false
        showNewBoardTimer.running = true
    }

    function showNewBoard()
    {
        generateBoard()
    }

    function enlargeBoard()
    {
        var j = rows*columns+1
        rows++
        columns++
        var k = rows*columns+1
        for (j;j<k;j++)
        {
            cellModel.append({"name": "cell_"+j, "colorName": "red", isFlipped: 0})
        }
    }

    function shrinkBoard()
    {
        var j = rows*columns-1
        rows--
        columns--
        var k = rows*columns
        for (j;j>=k;j--)
        {
            cellModel.remove(j)
        }
    }

        InfoBar {
            //id: gameInfoBar
        }

        MenuButton {
            id: exitButton
            y: parent.height*0.03
            x: parent.width*0.88
            buttonChar: "X"
            buttonMessage: "Click the X button to exit the game"
            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit()
            }
        }

        MenuButton {
            id: helpButton
            y: parent.height*0.03
            x: parent.width*0.024
            buttonChar: "?"
            buttonMessage: "Memory Matrix is a Lumosity's game \nthat challenges your spacial recall and working memory.\n\nHow to play:\nA pattern will appear on board\nRepeat the pattern by clicking the correct tiles"
        }



        GameGrid {
            id: boardFlip
        }

        MessageBox {
            id: messageFlip
        }

        Timer {
            id: newBoardTimer
            interval: 2000
            repeat: false
            onTriggered: gameBoard.newBoard()

        }

        Timer {
            id: hideTimer
            interval: 2000
            repeat: false
            onTriggered: gameBoard.hideAll()

        }

        Timer {
            id: showNewBoardTimer
            interval: 1000
            repeat: false
            onTriggered: gameBoard.showNewBoard()
        }

        Timer {
            id: enlargeTimer
            interval: 1500
            repeat: false
            onTriggered: enlargeBoard()
        }

        Timer {
            id: shrinkTimer
            interval: 1500
            repeat: false
            onTriggered: shrinkBoard()
        }

        Component.onCompleted: {
            gameBoard.reset()
        }
}

import QtQuick 2.15
import QtQuick.Window 2.15
import SddmComponents 2.0

Rectangle {
    id : container
    LayoutMirroring.enabled : Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit : true
    property int sessionIndex : typeof sessionMenu !== "undefined" ? sessionMenu.sessionIndex : sessionModel.lastIndex

    property int defaultscale : setdefaultScale()

    property int targetscreenwidth : container.width
    property int targetscreenheight : container.height

    property int defaultscreenwidth : 1920 * defaultscale
    property int defaultscreenheight : 1200 * defaultscale

    property int defaultcharwidth : 8 * defaultscale
    property int defaultcharheight : 8 * defaultscale

    property string doscolor : "#aaaaaa"
    property string dosblack : "#090808"

    property string borderimage : "Background3.svg"

    property string fontstyle : "Ac437_IBM_CGA-2y.ttf"
    property int dosfontsize : 20 * defaultscale

    property int welcometoppadding : 150 * defaultscale
    property int welcomeleftpadding : 150 * defaultscale
    property string welcometext : "Enter today's date (m-d-y): 08-12-81\n\nThe IBM Personal Computer DOS\nVersion 1.00 (C)Copyright IBM Corp 1981\n\nA>login\n\nPLEASE ENTER CREDENTIALS:\n"
    property bool welcometextvisible : true

    property string usernametext : "USERNAME:"
    property bool usernametextvisible : true

    property int usernametoppadding : 350 * defaultscale
    property int usernameleftpadding : 250 * defaultscale
    property int usernamewidth : 200 * defaultscale
    property int usernameheight : 50 * defaultscale
    property string usernametextboximage : ""

    property int passwordtoppadding : 460 * defaultscale
    property int passwordleftpadding : 150 * defaultscale
    property string passwordtext : "PASSWORD:"

    property int passwordboxtoppadding : 453 * defaultscale
    property int passwordboxleftpadding : 250 * defaultscale
    property int passwordboxwidth : 400 * defaultscale
    property int passwordboxheight : 40 * defaultscale
    property string passwordtextboximage : ""

    property int loginbuttontoppadding : 520 * defaultscale
    property int loginbuttonleftpadding : 150 * defaultscale
    property int loginbuttonimagewidth : 100 * defaultscale
    property int loginbuttonimageheight : 50 * defaultscale
    property string loginbuttonup : "None.png"
    property string loginbuttondown : "None.png"
    property string loginbuttonhover : "None.png"
    property string loginbuttontext : "LOGIN"
    property string loginbuttoncolor : doscolor
    property int loginbuttonfontsize : 32

    property int restartbuttontoppadding : 520 * defaultscale
    property int restartbuttonleftpadding : 250 * defaultscale
    property int restartbuttonimagewidth : 100 * defaultscale
    property int restartbuttonimageheight : 50 * defaultscale
    property string restartbuttonup : "None.png"
    property string restartbuttondown : "None.png"
    property string restartbuttonhover : "None.png"
    property string restartbuttontext : "RESTART"
    property string restartbuttoncolor : doscolor
    property int restartbuttonfontsize : 32

    property int shutdownbuttontoppadding : 520 * defaultscale
    property int shutdownbuttonleftpadding : 365 * defaultscale
    property int shutdownbuttonimagewidth : 100 * defaultscale
    property int shutdownbuttonimageheight : 50 * defaultscale
    property string shutdownbuttonup : "None.png"
    property string shutdownbuttondown : "None.png"
    property string shutdownbuttonhover : "None.png"
    property string shutdownbuttontext : "SHUTDOWN"
    property string shutdownbuttoncolor : doscolor
    property int shutdownbuttonfontsize : 32

    property int comboboxtoppadding : 140 * defaultscale
    property int comboboxleftpadding : 750 * defaultscale
    property string comboboxcolor : dosblack
    property string comboboxbordercolor : dosblack
    property string comboboxhovercolor : dosblack
    property string comboboxfocuscolor : dosblack
    property string comboboxtextcolor : doscolor
    property string comboboxmenucolor : dosblack
    property string comboboxarrowcolor : "transparent"
    property int comboboxwidth : 170 * defaultscale
    property int comboboxheight : 50 * defaultscale
    property string comboboximage : "Arrow.svg"
    property int comboboxfontsize : 32
    property bool comboboxvisible : true

    function setdefaultScale()
    {
        var setscale = 1
        if (container.width > 1920)
        {
            setscale = 2
        }
        return setscale
    }

    TextConstants {
        id : textConstants
    }

    FontLoader {
        id : loginfont
        source : Qt.resolvedUrl(fontstyle)
    }

    Connections {
        target : sddm
        function onLoginSucceeded() {
            if (typeof errorMessage !== "undefined") {
                errorMessage.color = "green"
                errorMessage.text = textConstants.loginSucceeded
            }
        }
        function onLoginFailed() {
            password.text = ""
            if (typeof errorMessage !== "undefined") {
                errorMessage.color = "red"
                errorMessage.text = textConstants.loginFailed
                errorMessage.bold = true
            }
        }
    }

    color : doscolor
    anchors.fill : parent

    onWidthChanged: { if (typeof sessionMenu !== "undefined") sessionMenu.isExpanded = false }
    onHeightChanged: { if (typeof sessionMenu !== "undefined") sessionMenu.isExpanded = false }

    Background {
        anchors.fill: parent
        source: Qt.resolvedUrl(borderimage)
        fillMode: Image.Stretch
        onStatusChanged: {
            if (status == Image.Error && source != Qt.resolvedUrl(config.defaultBackground)) {
                source = Qt.resolvedUrl(config.defaultBackground)
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            container.forceActiveFocus()
            if (typeof sessionMenu !== "undefined") {
                sessionMenu.isExpanded = false
            }
        }
    }

    Column {
        id : entryColumn1
        anchors.left : parent.left
        topPadding : welcometoppadding
        leftPadding : welcomeleftpadding
        Text {
            color : doscolor
            text : welcometext
            visible : welcometextvisible
            font.family : loginfont.name
            font.italic : false
            font.pointSize : dosfontsize
        }

        Text {
            color : doscolor
            text : usernametext
            visible : usernametextvisible
            font.family : loginfont.name
            font.italic : false
            font.pointSize : dosfontsize
        }
    }

    Item {
        id : entryColumn2
        x : usernameleftpadding
        y : usernametoppadding
        width : usernamewidth
        height : usernameheight

        Image {
            anchors.fill : parent
            source : usernametextboximage !== "" ? Qt.resolvedUrl(usernametextboximage) : ""
        }

        TextInput {
            id : name
            anchors.fill : parent
            focus : true
            font.family : loginfont.name
            font.italic : false
            font.pointSize : dosfontsize
            color : doscolor
            text : userModel.lastUser
            verticalAlignment : Text.AlignVCenter
            clip : true
            KeyNavigation.tab : password
            Keys.onPressed : (event) => {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    password.forceActiveFocus()
                    event.accepted = true
                }
            }
        }
    }

    Text {
        id : entryColumn3
        x : passwordleftpadding
        y : passwordtoppadding
        color : doscolor
        text : passwordtext
        visible : true
        font.family : loginfont.name
        font.italic : false
        font.pointSize : dosfontsize
    }

    Item {
        id : entryColumn4
        x : passwordboxleftpadding
        y : passwordboxtoppadding
        width : passwordboxwidth
        height : passwordboxheight

        Image {
            anchors.fill : parent
            source : passwordtextboximage !== "" ? Qt.resolvedUrl(passwordtextboximage) : ""
        }

        TextInput {
            id : password
            anchors.fill : parent
            font.family : loginfont.name
            font.italic : false
            font.pointSize : dosfontsize
            color : doscolor
            echoMode : TextInput.Password
            verticalAlignment : Text.AlignVCenter
            clip : true
            KeyNavigation.tab : loginButtonAction
            Keys.onPressed : (event) => {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    sddm.login(name.text, password.text, sessionIndex)
                    event.accepted = true
                }
            }
        }
    }

    Item {
        id : loginButtonAction
    }

    Image {
        id : loginButton
        x : loginbuttonleftpadding
        y : loginbuttontoppadding
        source : loginbuttonup !== "" ? Qt.resolvedUrl(loginbuttonup) : ""
        width : loginbuttonimagewidth
        height : loginbuttonimageheight
        visible : true

        MouseArea {
            anchors.fill : parent
            hoverEnabled : true
            onEntered : { parent.source = loginbuttonhover !== "" ? Qt.resolvedUrl(loginbuttonhover) : "" }
            onExited : { parent.source = loginbuttonup !== "" ? Qt.resolvedUrl(loginbuttonup) : "" }
            onPressed : {
                parent.source = loginbuttondown !== "" ? Qt.resolvedUrl(loginbuttondown) : ""
                sddm.login(name.text, password.text, sessionIndex)
            }
            onReleased : { parent.source = loginbuttonup !== "" ? Qt.resolvedUrl(loginbuttonup) : "" }
        }

        Text {
            text : loginbuttontext
            anchors.centerIn : parent
            font.family : loginfont.name
            font.italic : false
            font.pointSize : loginbuttonfontsize
            color : doscolor
        }
    }

    Image {
        id : restartButton
        x : restartbuttonleftpadding
        y : restartbuttontoppadding
        source : restartbuttonup !== "" ? Qt.resolvedUrl(restartbuttonup) : ""
        width : restartbuttonimagewidth
        height : restartbuttonimageheight
        visible : true

        MouseArea {
            anchors.fill : parent
            hoverEnabled : true
            onEntered : { parent.source = restartbuttonhover !== "" ? Qt.resolvedUrl(restartbuttonhover) : "" }
            onExited : { parent.source = restartbuttonup !== "" ? Qt.resolvedUrl(restartbuttonup) : "" }
            onPressed : {
                parent.source = restartbuttondown !== "" ? Qt.resolvedUrl(restartbuttondown) : ""
                sddm.reboot()
            }
            onReleased : { parent.source = restartbuttonup !== "" ? Qt.resolvedUrl(restartbuttonup) : "" }
        }

        Text {
            text : restartbuttontext
            anchors.centerIn : parent
            font.family : loginfont.name
            font.italic : false
            font.pointSize : restartbuttonfontsize
            color : doscolor
        }
    }

    Image {
        id : shutdownButton
        x : shutdownbuttonleftpadding
        y : shutdownbuttontoppadding
        source : shutdownbuttonup !== "" ? Qt.resolvedUrl(shutdownbuttonup) : ""
        width : shutdownbuttonimagewidth
        height : shutdownbuttonimageheight
        visible : true

        MouseArea {
            anchors.fill : parent
            hoverEnabled : true
            onEntered : { parent.source = shutdownbuttonhover !== "" ? Qt.resolvedUrl(shutdownbuttonhover) : "" }
            onExited : { parent.source = shutdownbuttonup !== "" ? Qt.resolvedUrl(shutdownbuttonup) : "" }
            onPressed : {
                parent.source = shutdownbuttondown !== "" ? Qt.resolvedUrl(shutdownbuttondown) : ""
                sddm.powerOff()
            }
            onReleased : { parent.source = shutdownbuttonup !== "" ? Qt.resolvedUrl(shutdownbuttonup) : "" }
        }

        Text {
            text : shutdownbuttontext
            anchors.centerIn : parent
            font.family : loginfont.name
            font.italic : false
            font.pointSize : shutdownbuttonfontsize
            color : doscolor
        }
    }

    Item {
        id: sessionMenu
        x: comboboxleftpadding
        y: comboboxtoppadding
        width: comboboxwidth
        height: comboboxheight
        z: 100
        visible: comboboxvisible

        property bool isExpanded: false
        property string currentSessionName: "Select Session"
        property int sessionIndex: sessionModel.lastIndex

        Rectangle {
            anchors.fill: parent
            color: comboboxcolor
            border.color: comboboxbordercolor
            border.width: 1

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 8
                anchors.verticalCenter: parent.verticalCenter
                text: sessionMenu.currentSessionName
                font.family: loginfont.name
                font.italic: false
                font.pointSize: comboboxfontsize
                color: comboboxtextcolor
            }

            Image {
                anchors.right: parent.right
                anchors.rightMargin: 8
                anchors.verticalCenter: parent.verticalCenter
                source: Qt.resolvedUrl(comboboximage)
                height: parent.height * 0.5
                fillMode: Image.PreserveAspectFit
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    container.forceActiveFocus()
                    if (!sessionMenu.isExpanded) {
                        var pos = sessionMenu.mapToItem(container, 0, 0)
                        globalDropdown.x = pos.x
                        globalDropdown.y = pos.y + sessionMenu.height
                        globalDropdown.width = sessionMenu.width
                        sessionMenu.isExpanded = true
                    } else {
                        sessionMenu.isExpanded = false
                    }
                }
            }
        }

        Item {
            Repeater {
                model: sessionModel
                Item {
                    Component.onCompleted: {
                        if (index === sessionModel.lastIndex) {
                            sessionMenu.currentSessionName = model.name
                            sessionMenu.sessionIndex = index
                        }
                    }
                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        visible: typeof sessionMenu !== "undefined" && sessionMenu.isExpanded
        z: 99998
        onClicked: sessionMenu.isExpanded = false
    }

    Rectangle {
        id: globalDropdown
        visible: typeof sessionMenu !== "undefined" && sessionMenu.isExpanded
        z: 99999
        color: comboboxmenucolor
        border.color: comboboxbordercolor
        border.width: 1
        clip: true
        height: sessionList.count * comboboxheight

        ListView {
            id: sessionList
            anchors.fill: parent
            model: sessionModel
            interactive: false

            delegate: Rectangle {
                width: sessionList.width
                height: comboboxheight
                color: hoverArea.containsMouse ? comboboxtextcolor : "transparent"

                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 8
                    anchors.verticalCenter: parent.verticalCenter
                    text: model.name
                    font.family: loginfont.name
                    font.italic: false
                    font.pointSize: comboboxfontsize
                    // ZMIANA: Tekst po najechaniu staje się czarny (dosblack/comboboxcolor)
                    color: hoverArea.containsMouse ? comboboxcolor : comboboxtextcolor
                }

                MouseArea {
                    id: hoverArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        sessionMenu.sessionIndex = index
                        sessionMenu.currentSessionName = model.name
                        sessionMenu.isExpanded = false
                    }
                }
            }
        }
    }

    MouseArea {
        id: cursorTracker
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: Qt.BlankCursor
        z: 9999998
    }

    Image {
        id: customCursor
        source: Qt.resolvedUrl("Pointer.png")
        width: 32 //* (defaultscale / 5)
        height: 38 // * (defaultscale / 5)
        x: cursorTracker.mouseX
        y: cursorTracker.mouseY
        z: 9999999
        //smooth: false
    }

}

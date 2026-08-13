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

    property string amigablack : "#000000"
    property string amigablue : "#0055aa"
    property string amigabrown : "#8d4300"
    property string amigacyan : "#7ee7d0"
    property string amigadarkgrey : "#616161"
    property string amigagreen : "#76bb61"
    property string amigagrey : "#939393"
    property string amigalightblue : "#5796ec"
    property string amigalightgreen : "#cbffb6"
    property string amigalightgrey : "#cbcbcb"
    property string amigalightred : "#eb8499"
    property string amigaorange : "#ff8800"
    property string amigapurple : "#8f5abb"
    property string amigared : "#ad465c"
    property string amigawhite : "#ffffff"
    property string amigayellow : "#fff793"
    property string amigabackground : "#88aacc"

    property string borderimage : "AmigaOSBackground.png"

    property string titlebarimage : "tbarblank.svg"
    property int bgwidth : container.width
    property int bgheight : 40 * defaultscale

    property string titlebartextimage : "tbartext.svg"
    property int titlebartextwidth : 700 * defaultscale
    property int titlebartextheight : 30 * defaultscale

    property string backforthimage : "BackForth.svg"
    property int backforthwidth : 500 * defaultscale
    property int backforthheight : 40 * defaultscale

    property string fontstyle : "TopazPlus_a1200_v1.0.ttf"
    property int fsize : 30 * defaultscale
    property int fheight : 45 * defaultscale

    property int dialogboxtoppadding : 3 * defaultscale
    property int dialogboxleftpadding : 10 * defaultscale

    property string dialogboxtext : "SYSTEM LOGIN"
    property bool dialogboxtextvisible : true
    property string dialogboxtextcolor : amigablack
    property int dialogboxtextsize : 20 * defaultscale

    property string dialogboxtitleimage : "AmigaOSTitleBar.svg"
    property int dialogboxtitlewidth : 800 * defaultscale
    property int dialogboxtitleheight : 31 * defaultscale

    property string dialogboximage : "AmigaOSDBox.svg"
    property int dialogboximagewidth : 800 * defaultscale
    property int dialogboximageheight : 300 * defaultscale

    property int avatarleftpadding : 60 * defaultscale
    property int avatartoppadding : 60 * defaultscale
    property string cbmavatar : "AmigaOSAvatar.gif"
    property int avatarwidth : (24*7) * defaultscale
    property int avatarheight : (21*7) * defaultscale

    property int restartbuttonleftpadding : 40 * defaultscale
    property int restartbuttontoppadding : 230 * defaultscale
    property int restartbuttonimagewidth : 175 * defaultscale
    property int restartbuttonimageheight : 35 * defaultscale
    property string restartbuttonup : "AmigaOSRestartButtonUp.svg"
    property string restartbuttondown : "AmigaOSRestartButtonDown.svg"
    property string restartbuttonhover : "AmigaOSRestartButtonUp.svg"
    property string restartbuttontext : "RESTART"
    property string restartbuttoncolor : amigablack
    property int restartbuttonfontsize : 32

    property int shutdownleftpadding : 325 * defaultscale
    property int shutdowntoppadding : 230 * defaultscale
    property int shutdownimagewidth : 175 * defaultscale
    property int shutdownimageheight : 35 * defaultscale
    property string shutdownbuttonup : "AmigaOSShutdownButtonUp.svg"
    property string shutdownbuttondown : "AmigaOSShutdownButtonDown.svg"
    property string shutdownbuttonhover : "AmigaOSShutdownButtonUp.svg"
    property string shutdownbuttontext : "SHUTDOWN"
    property string shutdownbuttoncolor : amigablack
    property int shutdownbuttonfontsize : 32

    property int loginbuttonleftpadding : 585 * defaultscale
    property int loginbuttontoppadding : 230 * defaultscale
    property int loginbuttonimagewidth : 175 * defaultscale
    property int loginbuttonimageheight : 35 * defaultscale
    property string loginbuttonup : "AmigaOSButtonUp.svg"
    property string loginbuttondown : "AmigaOSButtonDown.svg"
    property string loginbuttonhover : "AmigaOSButtonUp.svg"
    property string loginbuttontext : "LOGIN"
    property string loginbuttoncolor : amigablack
    property int loginbuttonfontsize : 32

    property int usernameleftpadding : 295 * defaultscale
    property int usernametoppadding : 70 * defaultscale
    property int usernamewidth : 400 * defaultscale
    property int usernameheight : 35 * defaultscale
    property string usernametext : "USERNAME: "
    property string usernamecolor : amigawhite
    property int usernamefontsize : 25 * defaultscale

    property int usernametextboxleftpadding : 450 * defaultscale
    property int usernametextboxtoppadding : 65 * defaultscale
    property int usernametextboxwidth : 310 * defaultscale
    property int usernametextboxheight : 40 * defaultscale
    property string usernametextboximage : "AmigaOSUsernameBox.svg"
    property string usernametextboxcolor : amigablack
    property int usernametextboxfontsize : 20 * defaultscale

    property int passwordleftpadding : 295 * defaultscale
    property int passwordtoppadding : 135 * defaultscale
    property int passwordwidth : 400 * defaultscale
    property int passwordheight : 35 * defaultscale
    property string passwordtext : "PASSWORD: "
    property string passwordcolor : amigawhite
    property int passwordfontsize : 25 * defaultscale

    property int passwordtextboxleftpadding : 450 * defaultscale
    property int passwordtextboxtoppadding : 130 * defaultscale
    property int passwordtextboxwidth : 310 * defaultscale
    property int passwordtextboxheight : 40 * defaultscale
    property string passwordtextboximage : "AmigaOSPasswordBox.svg"
    property string passwordtextboxcolor : amigablack
    property int passwordtextboxfontsize : 20 * defaultscale

    property int comboboxleftpadding : 560 * defaultscale
    property int comboboxtoppadding : 180 * defaultscale
    property string comboboxcolor : amigabackground
    property string comboboxbordercolor : amigablack
    property string comboboxhovercolor : amigawhite
    property string comboboxfocuscolor : amigablack
    property string comboboxtextcolor : amigablack
    property string comboboxmenucolor : amigabackground
    property string comboboxarrowcolor : "transparent"
    property int comboboxfontsize : 32
    property int comboboxwidth : 200 * defaultscale
    property int comboboxheight : 35 * defaultscale
    property string comboboximage : "AmigaOSArrow.svg"
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

    color : "#4c719e"
    anchors.fill : parent

    onWidthChanged: { if (typeof sessionMenu !== "undefined") sessionMenu.isExpanded = false }
    onHeightChanged: { if (typeof sessionMenu !== "undefined") sessionMenu.isExpanded = false }

    Image {
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

    Image {
        id : backgroundImage1
        anchors.top : parent.top
        anchors.horizontalCenter : container.horizontalCenter
        width : bgwidth
        height : bgheight
        source : Qt.resolvedUrl(titlebarimage)
    }

    Image {
        id : backgroundImage2
        anchors.left : parent.left
        width : titlebartextwidth
        height : titlebartextheight
        source : Qt.resolvedUrl(titlebartextimage)
    }

    Image {
        id : backgroundImage3
        anchors.right : parent.right
        width : backforthwidth
        height : backforthheight
        source : Qt.resolvedUrl(backforthimage)
    }

    Image {
        id : dialogbox
        anchors.centerIn : parent
        anchors.verticalCenterOffset: -80
        anchors.horizontalCenterOffset: 0
        source : Qt.resolvedUrl(dialogboximage)
        width : dialogboximagewidth
        height : dialogboximageheight
        scale: 0.85
        visible : true

        Image {
            anchors.left : parent.left
            id : dialogboxtop
            source : Qt.resolvedUrl(dialogboxtitleimage)
            width : dialogboxtitlewidth
            height : dialogboxtitleheight
            visible : true

            Text {
                x : dialogboxleftpadding
                y : 15 //dialogboxtoppadding
                color : dialogboxtextcolor
                text : dialogboxtext
                visible : dialogboxtextvisible
                font.family : loginfont.name
                font.italic : false
                font.pointSize : 34
            }
        }

        AnimatedImage {
            id : avatar
            source : Qt.resolvedUrl(cbmavatar)
            width : avatarwidth
            height : avatarheight
            visible : true
            x : avatarleftpadding
            y : avatartoppadding
            playing : true
        }

        Image {
            id : restartButton
            source : Qt.resolvedUrl(restartbuttonup)
            width : restartbuttonimagewidth
            height : restartbuttonimageheight
            visible : true
            x : restartbuttonleftpadding
            y : restartbuttontoppadding

            MouseArea {
                anchors.fill : parent
                hoverEnabled : true
                onEntered : { parent.source = Qt.resolvedUrl(restartbuttonhover) }
                onExited : { parent.source = Qt.resolvedUrl(restartbuttonup) }
                onPressed : {
                    parent.source = Qt.resolvedUrl(restartbuttondown)
                    sddm.reboot()
                }
                onReleased : { parent.source = Qt.resolvedUrl(restartbuttonup) }
            }
            Text {
                verticalAlignment : Text.AlignVCenter
                text : restartbuttontext
                anchors.centerIn : parent
                font.family : loginfont.name
                font.italic : false
                font.pointSize : restartbuttonfontsize
                color : restartbuttoncolor
            }
        }

        Image {
            id : shutdownButton
            source : Qt.resolvedUrl(shutdownbuttonup)
            width : shutdownimagewidth
            height : shutdownimageheight
            visible : true
            x : shutdownleftpadding
            y : shutdowntoppadding

            MouseArea {
                anchors.fill : parent
                hoverEnabled : true
                onEntered : { parent.source = Qt.resolvedUrl(shutdownbuttonhover) }
                onExited : { parent.source = Qt.resolvedUrl(shutdownbuttonup) }
                onPressed : {
                    parent.source = Qt.resolvedUrl(shutdownbuttondown)
                    sddm.powerOff()
                }
                onReleased : { parent.source = Qt.resolvedUrl(shutdownbuttonup) }
            }
            Text {
                text : shutdownbuttontext
                anchors.centerIn : parent
                font.family : loginfont.name
                font.italic : false
                font.pointSize : shutdownbuttonfontsize
                color : shutdownbuttoncolor
            }
        }

        Text {
            id : lblLoginName
            x : usernameleftpadding
            y : usernametoppadding
            width : usernamewidth
            height : usernameheight
            visible : true
            text : usernametext
            font.pointSize : usernamefontsize
            font.italic : false
            verticalAlignment : Text.AlignVCenter
            color : usernamecolor
            font.family : loginfont.name
        }

        Item {
            x : usernametextboxleftpadding
            y : usernametextboxtoppadding
            width : usernametextboxwidth
            height : usernametextboxheight

            Image {
                anchors.fill : parent
                source : Qt.resolvedUrl(usernametextboximage)
            }

            TextInput {
                id : name
                anchors.fill : parent
                anchors.leftMargin : 8
                anchors.rightMargin : 8
                font.family : loginfont.name
                font.italic : false
                font.pointSize : usernametextboxfontsize
                color : usernametextboxcolor
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
            id : lblLoginPassword
            x : passwordleftpadding
            y : passwordtoppadding
            width : passwordwidth
            height : passwordheight
            visible : true
            text : passwordtext
            verticalAlignment : Text.AlignVCenter
            color : passwordcolor
            font.pointSize : passwordfontsize
            font.italic : false
            font.family : loginfont.name
        }

        Item {
            x : passwordtextboxleftpadding
            y : passwordtextboxtoppadding
            width : passwordtextboxwidth
            height : passwordtextboxheight

            Image {
                anchors.fill : parent
                source : Qt.resolvedUrl(passwordtextboximage)
            }

            TextInput {
                id : password
                anchors.fill : parent
                anchors.leftMargin : 8
                anchors.rightMargin : 8
                font.family : loginfont.name
                font.italic : false
                font.pointSize : passwordtextboxfontsize
                color : passwordtextboxcolor
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
            focus : true
        }

        Image {
            id : loginButton
            source : Qt.resolvedUrl(loginbuttonup)
            width : loginbuttonimagewidth
            height : loginbuttonimageheight
            visible : true
            x : loginbuttonleftpadding
            y : loginbuttontoppadding

            MouseArea {
                anchors.fill : parent
                hoverEnabled : true
                onEntered : { parent.source = Qt.resolvedUrl(loginbuttonhover) }
                onExited : { parent.source = Qt.resolvedUrl(loginbuttonup) }
                onPressed : {
                    parent.source = Qt.resolvedUrl(loginbuttondown)
                    sddm.login(name.text, password.text, sessionIndex)
                }
                onReleased : { parent.source = Qt.resolvedUrl(loginbuttonup) }
            }
            Text {
                text : loginbuttontext
                anchors.centerIn : parent
                font.family : loginfont.name
                font.italic : false
                font.pointSize : loginbuttonfontsize
                color : loginbuttoncolor
            }
        }

        Item {
            id: sessionMenu
            x: 1076
            y: comboboxtoppadding
            width: 475
            height: comboboxheight
            z: 100
            scale: 0.85
            visible: comboboxvisible

            property bool isExpanded: false
            property string currentSessionName: "Wybierz Sesję"
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
                            globalDropdown.y = pos.y + (sessionMenu.height * sessionMenu.scale)
                            globalDropdown.width = sessionMenu.width * sessionMenu.scale
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
                color: hoverArea.containsMouse ? comboboxhovercolor : "transparent"

                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 8
                    anchors.verticalCenter: parent.verticalCenter
                    text: model.name
                    font.family: loginfont.name
                    font.italic: false
                    font.pointSize: 32
                    color: hoverArea.containsMouse ? comboboxfocuscolor : comboboxtextcolor
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
        source: Qt.resolvedUrl("Pointer.svg")
        width: 76 * (defaultscale / 5)
        height: 76 * (defaultscale / 5)
        x: cursorTracker.mouseX
        y: cursorTracker.mouseY
        z: 9999999
        // smooth: false
    }
}

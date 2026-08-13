import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11
import SddmComponents 2.0
import QtMultimedia

Rectangle {
    id: container
    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true
    property int sessionIndex: sessionMenu.sessionIndex

    property int defaultscale: setdefaultScale()
    property int defaultspritescale: setdefaultspriteScale()

    property int targetscreenwidth: 2560
    property int targetscreenheight: 1440

    property int defaultscreenwidth: 2560
    property int defaultscreenheight: 1440

    property int defaultspritewidth: setdefaultspriteWidth()
    property int defaultspriteheight: setdefaultspriteHeight()

    property int defaultcharwidth: 8 * defaultscale
    property int defaultcharheight: 8 * defaultscale

    property int cbmheadertexttoppadding: setcbmheadertoppadding()

    property string c64black: "#000000"
    property string c64blue: "#104ea5"
    property string c64brown: "#8d4300"
    property string c64cyan: "#7ee7d0"
    property string c64darkgrey: "#616161"
    property string c64green: "#76bb61"
    property string c64grey: "#939393"
    property string c64lightblue: "#5796ec"
    property string c64lightgreen: "#cbffb6"
    property string c64lightgrey: "#cbcbcb"
    property string c64lightred: "#eb8499"
    property string c64orange: "#c36043"
    property string c64purple: "#8f5abb"
    property string c64red: "#ad465c"
    property string c64white: "#ffffff"
    property string c64yellow: "#fff793"

    property string petgreen: "#65d045"

    property string borderimage: "MasterAssets/Borders/CBMBorder-Black.png"

    property string backgroundimg: "MasterAssets/Backgrounds/Misc/CBMBackground-Black.png"
    property int bgwidth: defaultscreenwidth
    property int bgheight: defaultscreenheight

    property string fontstyle: "MasterAssets/Fonts/COMMODORE_PET.ttf"
    property int fsize: defaultcharwidth * 0.75
    property int fheight: defaultcharheight * 0.75

    property string headertext: "MasterAssets/HeaderText/CBMHeader-Pet.svg"
    property int headertexttoppadding: 20
    property int headertextimagewidth: 150 * defaultscale
    property int headertextimageheight: 30 * defaultscale
    property int headerleftpadding: 250
    property bool headervisible: true

    property int dialogboxtoppadding:  -(fsize * .5)

    property string dialogboxtext: "SYSTEM LOGIN"
    property bool dialogboxtextvisible: true
    property string dialogboxtextcolor: petgreen

    property int dialogboxtextsize: 40
    property string dialogboximage: "MasterAssets/Windows/CBMWindow-Pet.svg"
    property int dialogboximagewidth: 266 * defaultscale
    property int dialogboximageheight: 82 * defaultscale

    property int avatarleftpadding: fsize * 4
    property int avatartoppadding: fsize * 2.0
    property string cbmavatar: "MasterAssets/Avatars/Animated/CBMAvatar-AnimPETGlobe.gif"
    property int avatarwidth: defaultspritewidth + 35
    property int avatarheight: defaultspriteheight + 35

    property int restartbuttonleftpadding: fsize * 3
    property int restartbuttontoppadding: fsize * 11
    property int restartbuttonimagewidth: fsize * 11
    property int restartbuttonimageheight: fsize + 10
    property string restartbuttonup: "MasterAssets/Buttons/Restart/Up/CBMRestartButtonUp-Pet.svg"
    property string restartbuttondown: "MasterAssets/Buttons/Restart/Down/CBMRestartButtonDown-Pet.svg"
    property string restartbuttonhover: "MasterAssets/Buttons/Restart/Hover/CBMRestartButtonHover-Pet.svg"
    property string restartbuttontext: "RESTART"
    property string restartbuttoncolor: c64black
    property int restartbuttonfontsize: 34

    property int shutdownleftpadding: fsize * 29.5
    property int shutdowntoppadding: fsize * 11
    property int shutdownimagewidth: fsize * 12.5
    property int shutdownimageheight: fsize + 10
    property string shutdownbuttonup: "MasterAssets/Buttons/Shutdown/Up/CBMShutdownButtonUp-Pet.svg"
    property string shutdownbuttondown: "MasterAssets/Buttons/Shutdown/Down/CBMShutdownButtonDown-Pet.svg"
    property string shutdownbuttonhover: "MasterAssets/Buttons/Shutdown/Hover/CBMShutdownButtonHover-Pet.svg"
    property string shutdownbuttontext: "SHUTDOWN"
    property string shutdownbuttoncolor: c64black
    property int shutdownbuttonfontsize: 34

    property int loginbuttonleftpadding: fsize * 33
    property int loginbuttontoppadding: fsize * 8.5
    property int loginbuttonimagewidth: fsize * 9
    property int loginbuttonimageheight: fsize + 10
    property string loginbuttonup: "MasterAssets/Buttons/Login/Up/CBMLoginButtonUp-Pet2.svg"
    property string loginbuttondown: "MasterAssets/Buttons/Login/Down/CBMLoginButtonDown-Pet2.svg"
    property string loginbuttonhover: "MasterAssets/Buttons/Login/Hover/CBMLoginButtonHover-Pet2.svg"
    property string loginbuttontext: "LOGIN"
    property string loginbuttoncolor: petgreen
    property int loginbuttonfontsize: fsize - 2

    property int usernameleftpadding: fsize * 17
    property int usernametoppadding: fsize * 3
    property int usernamewidth: fsize * 13
    property int usernameheight: fsize
    property string usernametext: "USERNAME: "
    property string usernamecolor: petgreen
    property int usernamefontsize: fsize

    property int usernametextboxleftpadding: fsize * 30
    property int usernametextboxtoppadding: fsize * 2.7
    property int usernametextboxwidth: fsize * 12
    property int usernametextboxheight: fsize * 1.4
    property string usernametextboximage: "MasterAssets/UsernameBox/CBMUsernameBox-Pet.svg"
    property string usernametextboxcolor: c64black
    property int usernametextboxfontsize: fsize - 2

    property int passwordleftpadding: fsize * 17
    property int passwordtoppadding: fsize * 6
    property int passwordwidth: fsize * 13
    property int passwordheight: fsize
    property string passwordtext: "PASSWORD: "
    property string passwordcolor: petgreen
    property int passwordfontsize: fsize

    property int passwordtextboxleftpadding: fsize * 30
    property int passwordtextboxtoppadding: fsize * 5.7
    property int passwordtextboxwidth: fsize * 12
    property int passwordtextboxheight: fsize * 1.4
    property string passwordtextboximage: "MasterAssets/PasswordBox/CBMPasswordBox-Pet.svg"
    property string passwordtextboxcolor: c64black
    property int passwordtextboxfontsize: fsize - 8

    property int comboboxleftpadding: fsize * 17
    property int comboboxtoppadding: fsize * 8.5
    property string comboboxcolor: petgreen
    property string comboboxbordercolor: petgreen
    property string comboboxhovercolor: petgreen
    property string comboboxfocuscolor: c64black
    property string comboboxtextcolor: c64black
    property string comboboxmenucolor: petgreen
    property string comboboxarrowcolor: "transparent"
    property int comboboxfontsize: fsize - 2
    property int comboboxwidth: fsize * 9
    property int comboboxheight: fsize * 1.4
    property string comboboximage: "MasterAssets/Arrows//CBMArrow-Black.svg"
    property bool comboboxvisible: true

    function setdefaultScale() {
        if (Screen.width >= 2560 && Screen.height >= 1600) return 8;
        if (Screen.width >= 2560 && Screen.height <= 1440) return 7;
        return 5;
    }

    function setdefaultspriteScale() {
        if (Screen.width >= 2560 && Screen.height >= 1600) return 12;
        if (Screen.width >= 2560 && Screen.height <= 1440) return 11;
        return 10;
    }

    function setdefaultspriteWidth() { return Screen.width >= 2560 ? (24 * defaultspritescale) * 1.5 : 24 * defaultspritescale; }
    function setdefaultspriteHeight() { return Screen.width >= 2560 ? (21 * defaultspritescale) *  1.5 : 21 * defaultspritescale; }
    function setcbmheadertoppadding() { return Screen.width >= 2560 ? 5 : 2; }

    TextConstants { id: textConstants }

    FontLoader {
        id: loginfont
        source: Qt.resolvedUrl(fontstyle)
    }

    Connections {
        target: sddm
        function onLoginSucceeded() {
            errorMessage.color = "green"
            errorMessage.text = textConstants.loginSucceeded
        }
        function onLoginFailed() {
            password.text = ""
            // ...
        }
    }

    color: "#000000"
    anchors.fill: parent

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

    Image {
        id: backgroundImage
        anchors.centerIn: container
        source: Qt.resolvedUrl(backgroundimg)
        width: bgwidth
        height: bgheight
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
        id: entryColumn64
        anchors.left: parent.left
        topPadding: 60
        leftPadding: 100
        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            id: header
            source: Qt.resolvedUrl(headertext)
            width: headertextimagewidth
            height: headertextimageheight
            visible: headervisible
        }
    }

    Image {
        id: promptbox
        scale: 0.9
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -20
        anchors.verticalCenterOffset: 10
        source: Qt.resolvedUrl(dialogboximage)
        width: dialogboximagewidth
        height: dialogboximageheight
        visible: true

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            y: dialogboxtoppadding
            color: dialogboxtextcolor
            text: dialogboxtext
            visible: dialogboxtextvisible
            font.family: loginfont.name
            font.italic: false
            font.pointSize: dialogboxtextsize
        }

        AnimatedImage {
            id: avatar
            source: Qt.resolvedUrl(cbmavatar)
            width: avatarwidth
            height: avatarheight
            x: avatarleftpadding
            y: avatartoppadding
            playing: true
        }

        Image {
            id: restartButton
            source: Qt.resolvedUrl(restartbuttonup)
            width: restartbuttonimagewidth
            height: restartbuttonimageheight
            x: restartbuttonleftpadding
            y: restartbuttontoppadding

            Text {
                text: restartbuttontext
                anchors.centerIn: parent
                font.family: loginfont.name
                font.pointSize: restartbuttonfontsize
                color: restartbuttoncolor
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: { parent.source = Qt.resolvedUrl(restartbuttonhover) }
                onExited: { parent.source = Qt.resolvedUrl(restartbuttonup) }
                onPressed: { parent.source = Qt.resolvedUrl(restartbuttondown); sddm.reboot() }
                onReleased: { parent.source = Qt.resolvedUrl(restartbuttonup) }
            }
        }

        Image {
            id: shutdownButton
            source: Qt.resolvedUrl(shutdownbuttonup)
            width: shutdownimagewidth
            height: shutdownimageheight
            x: shutdownleftpadding
            y: shutdowntoppadding

            Text {
                text: shutdownbuttontext
                anchors.centerIn: parent
                font.family: loginfont.name
                font.pointSize: shutdownbuttonfontsize
                color: shutdownbuttoncolor
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: { parent.source = Qt.resolvedUrl(shutdownbuttonhover) }
                onExited: { parent.source = Qt.resolvedUrl(shutdownbuttonup) }
                onPressed: { parent.source = Qt.resolvedUrl(shutdownbuttondown); sddm.powerOff() }
                onReleased: { parent.source = Qt.resolvedUrl(shutdownbuttonup) }
            }
        }

        Text {
            id: lblLoginName
            x: usernameleftpadding
            y: usernametoppadding
            width: usernamewidth
            height: usernameheight
            text: usernametext
            font.pointSize: usernamefontsize
            verticalAlignment: Text.AlignVCenter
            color: usernamecolor
            font.family: loginfont.name
        }

        Item {
            x: usernametextboxleftpadding
            y: usernametextboxtoppadding
            width: usernametextboxwidth
            height: usernametextboxheight

            Image {
                anchors.fill: parent
                source: Qt.resolvedUrl(usernametextboximage)
            }

            TextInput {
                id: name
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                font.family: loginfont.name
                font.pointSize: usernametextboxfontsize
                color: usernametextboxcolor
                text: userModel.lastUser
                verticalAlignment: Text.AlignVCenter
                clip: true
                KeyNavigation.tab: password
                Keys.onPressed: (event) => {
                    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        password.forceActiveFocus()
                        event.accepted = true
                    }
                }
            }
        }

        Text {
            id: lblLoginPassword
            x: passwordleftpadding
            y: passwordtoppadding
            width: passwordwidth
            height: passwordheight
            text: passwordtext
            verticalAlignment: Text.AlignVCenter
            color: passwordcolor
            font.pointSize: passwordfontsize
            font.family: loginfont.name
        }

        Item {
            x: passwordtextboxleftpadding
            y: passwordtextboxtoppadding
            width: passwordtextboxwidth
            height: passwordtextboxheight

            Image {
                anchors.fill: parent
                source: Qt.resolvedUrl(passwordtextboximage)
            }

            TextInput {
                id: password
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                font.family: loginfont.name
                font.pointSize: passwordtextboxfontsize
                color: passwordtextboxcolor
                echoMode: TextInput.Password
                verticalAlignment: Text.AlignVCenter
                clip: true
                KeyNavigation.tab: loginButtonAction
                Keys.onPressed: (event) => {
                    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        sddm.login(name.text, password.text, sessionMenu.sessionIndex)
                        event.accepted = true
                    }
                }
            }
        }

        Image {
            id: loginButton
            source: Qt.resolvedUrl(loginbuttonup)
            width: loginbuttonimagewidth
            height: loginbuttonimageheight
            x: loginbuttonleftpadding
            y: loginbuttontoppadding

            Item { id: loginButtonAction; focus: true }

            Text {
                text: loginbuttontext
                anchors.centerIn: parent
                font.family: loginfont.name
                font.pointSize: 32
                color: loginbuttoncolor
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: { parent.source = Qt.resolvedUrl(loginbuttonhover) }
                onExited: { parent.source = Qt.resolvedUrl(loginbuttonup) }
                onPressed: { parent.source = Qt.resolvedUrl(loginbuttondown); sddm.login(name.text, password.text, sessionMenu.sessionIndex) }
                onReleased: { parent.source = Qt.resolvedUrl(loginbuttonup) }
            }
        }

        Item {
            id: sessionMenu
            x: comboboxleftpadding
            y: comboboxtoppadding
            width: comboboxwidth
            height: comboboxheight
            z: 100

            property bool isExpanded: false
            property string currentSessionName: "Select Session"
            property int sessionIndex: sessionModel.lastIndex

            Rectangle {
                anchors.fill: parent
                color: comboboxcolor
                border.color: comboboxbordercolor
                border.width: 1 * (defaultscale / 5)

                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 8
                    anchors.verticalCenter: parent.verticalCenter
                    text: sessionMenu.currentSessionName
                    font.family: loginfont.name
                    font.pointSize: 30
                    color: c64black
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
        border.color: c64black
        border.width: 1 * (defaultscale / 5)
        clip: true
        height: Math.min(sessionList.count, 6) * comboboxheight

        ListView {
            id: sessionList
            anchors.fill: parent
            model: sessionModel
            interactive: true
            boundsBehavior: Flickable.StopAtBounds

            delegate: Rectangle {
                width: sessionList.width
                height: comboboxheight
                color: hoverArea.containsMouse ? c64black : "transparent"

                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 8
                    anchors.verticalCenter: parent.verticalCenter
                    text: model.name
                    font.family: loginfont.name
                    font.pointSize: 30
                    color: hoverArea.containsMouse ? petgreen : c64black
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
        width: 32 * (defaultscale / 5)
        height: 32 * (defaultscale / 5)
        x: cursorTracker.mouseX
        y: cursorTracker.mouseY
        z: 9999999
        // smooth: false
    }

}

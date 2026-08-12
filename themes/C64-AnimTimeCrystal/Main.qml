import QtQuick 2.15
import QtQuick.Window 2.15
import SddmComponents 2.0

Rectangle {
    id: container
    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true
    property int sessionIndex: typeof sessionMenu !== "undefined" ? sessionMenu.sessionIndex : sessionModel.lastIndex

    property int defaultscale: setdefaultScale()
    property int defaultspritescale: setdefaultspriteScale()

    property int targetscreenwidth: container.width
    property int targetscreenheight: container.height

    property int defaultscreenwidth: 320 * defaultscale
    property int defaultscreenheight: 200 * defaultscale

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

    property string borderimage: "MasterAssets/Borders/CBMBorder-Black.png"

    property string backgroundimg: "MasterAssets/Backgrounds/Animated/CBMBackground-AnimTimeCrystal.gif"
    property int bgwidth: defaultscreenwidth
    property int bgheight: defaultscreenheight

    property string fontstyle: "MasterAssets/Fonts/C64_Pro_Mono-STYLE.ttf"
    property int fsize: defaultcharwidth * 0.75
    property int fheight: defaultcharheight * 0.75

    property string headertext: "MasterAssets/HeaderText/CBMHeader-LightBlue.svg"
    property int headertexttoppadding: fsize * cbmheadertexttoppadding
    property int headertextimagewidth: 302 * defaultscale
    property int headertextimageheight: 23 * defaultscale
    property bool headervisible: false

    property int dialogboxtoppadding: -(fsize * .5)

    property string dialogboxtext: "SYSTEM LOGIN"
    property bool dialogboxtextvisible: false
    property string dialogboxtextcolor: c64black

    property int dialogboxtextsize: fsize
    property string dialogboximage: "MasterAssets/Windows/Solid/CBMWindow-Solid-Black-LightBlue60Percent.svg"
    property int dialogboximagewidth: 266 * defaultscale
    property int dialogboximageheight: 82 * defaultscale

    property int avatarleftpadding: fsize * 4
    property int avatartoppadding: fsize * 2
    property string cbmavatar: "MasterAssets/Avatars/Animated/CBMAvatar-AnimTCCraft.gif"
    property int avatarwidth: defaultspritewidth
    property int avatarheight: defaultspriteheight

    property int restartbuttonleftpadding: fsize * 3
    property int restartbuttontoppadding: fsize * 11
    property int restartbuttonimagewidth: fsize * 11
    property int restartbuttonimageheight: fsize + 10
    property string restartbuttonup: "MasterAssets/Buttons/Restart/Up/CBMRestartButtonUp-Green.svg"
    property string restartbuttondown: "MasterAssets/Buttons/Restart/Down/CBMRestartButtonDown-Green.svg"
    property string restartbuttonhover: "MasterAssets/Buttons/Restart/Hover/CBMRestartButtonHover-Green.svg"
    property string restartbuttontext: "RESTART"
    property string restartbuttoncolor: c64black
    property int restartbuttonfontsize: fsize - 3

    property int shutdownleftpadding: fsize * 29.5
    property int shutdowntoppadding: fsize * 11
    property int shutdownimagewidth: fsize * 12.5
    property int shutdownimageheight: fsize + 10
    property string shutdownbuttonup: "MasterAssets/Buttons/Shutdown/Up/CBMShutdownButtonUp-Green.svg"
    property string shutdownbuttondown: "MasterAssets/Buttons/Shutdown/Down/CBMShutdownButtonDown-Green.svg"
    property string shutdownbuttonhover: "MasterAssets/Buttons/Shutdown/Hover/CBMShutdownButtonHover-Green.svg"
    property string shutdownbuttontext: "SHUTDOWN"
    property string shutdownbuttoncolor: c64black
    property int shutdownbuttonfontsize: fsize - 3

    property int loginbuttonleftpadding: fsize * 33
    property int loginbuttontoppadding: fsize * 8.5
    property int loginbuttonimagewidth: fsize * 9
    property int loginbuttonimageheight: fsize + 10
    property string loginbuttonup: "MasterAssets/Buttons/Login/Up/CBMLoginButtonUp-Blue.svg"
    property string loginbuttondown: "MasterAssets/Buttons/Login/Down/CBMLoginButtonDown-Blue.svg"
    property string loginbuttonhover: "MasterAssets/Buttons/Login/Hover/CBMLoginButtonHover-Blue.svg"
    property string loginbuttontext: "LOGIN"
    property string loginbuttoncolor: c64white
    property int loginbuttonfontsize: fsize - 2

    property int usernameleftpadding: fsize * 17
    property int usernametoppadding: fsize * 3
    property int usernamewidth: fsize * 13
    property int usernameheight: fsize
    property string usernametext: "USERNAME: "
    property string usernamecolor: c64white
    property int usernamefontsize: fsize

    property int usernametextboxleftpadding: fsize * 29
    property int usernametextboxtoppadding: fsize * 2.7
    property int usernametextboxwidth: fsize * 13
    property int usernametextboxheight: fsize * 1.4
    property string usernametextboximage: "MasterAssets/UsernameBox/CBMUsernameBox-Blue.svg"
    property string usernametextboxcolor: c64yellow
    property int usernametextboxfontsize: fsize - 2

    property int passwordleftpadding: fsize * 17
    property int passwordtoppadding: fsize * 6
    property int passwordwidth: fsize * 13
    property int passwordheight: fsize
    property string passwordtext: "PASSWORD: "
    property string passwordcolor: c64white
    property int passwordfontsize: fsize

    property int passwordtextboxleftpadding: fsize * 29
    property int passwordtextboxtoppadding: fsize * 5.7
    property int passwordtextboxwidth: fsize * 13
    property int passwordtextboxheight: fsize * 1.4
    property string passwordtextboximage: "MasterAssets/PasswordBox/CBMPasswordBox-Blue.svg"
    property string passwordtextboxcolor: c64yellow
    property int passwordtextboxfontsize: fsize - 2

    property int comboboxleftpadding: fsize * 17
    property int comboboxtoppadding: fsize * 8.5
    property string comboboxcolor: c64lightblue
    property string comboboxbordercolor: c64black
    property string comboboxhovercolor: c64black
    property string comboboxfocuscolor: c64black
    property string comboboxtextcolor: c64white
    property string comboboxmenucolor: c64yellow
    property string comboboxarrowcolor: "transparent"
    property int comboboxfontsize: fsize - 2
    property int comboboxwidth: fsize * 9
    property int comboboxheight: fsize * 1.4
    property string comboboximage: "MasterAssets/Arrows/CBMArrow-Black.svg"
    property bool comboboxvisible: true

    function setdefaultScale() {
        var setscale = 5
        if (container.width > 1920) {
            setscale = 8
        }
        return setscale
    }

    function setdefaultspriteScale() {
        var setspritescale = 10
        if (container.width > 1920) {
            setspritescale = 12
        }
        return setspritescale
    }

    function setdefaultspriteWidth() {
        var setwidth = 24 * defaultspritescale
        if (container.width > 1920) {
            setwidth = (24 * defaultspritescale) * 1.5
        }
        return setwidth
    }

    function setdefaultspriteHeight() {
        var setheight = 21 * defaultspritescale
        if (container.width > 1920) {
            setheight = (21 * defaultspritescale) * 1.5
        }
        return setheight
    }

    function setcbmheadertoppadding() {
        var cbmheader = 2
        if (container.width > 1920) {
            cbmheader = 6
        }
        return cbmheader
    }

    TextConstants {
        id: textConstants
    }

    FontLoader {
        id: loginfont
        source: Qt.resolvedUrl(fontstyle)
    }

    Connections {
        target: sddm
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

    color: "#4c719e"
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

    AnimatedImage {
        id: backgroundImage
        anchors.centerIn: container
        source: Qt.resolvedUrl(backgroundimg)
        width: bgwidth
        height: bgheight
        playing: true
    }

    Column {
        id: entryColumn64
        anchors.horizontalCenter: parent.horizontalCenter
        topPadding: headertexttoppadding
        Image {
            id: header
            anchors.horizontalCenter: parent.horizontalCenter
            source: Qt.resolvedUrl(headertext)
            width: headertextimagewidth
            height: headertextimageheight
            visible: headervisible
        }
    }

    Image {
        id: promptbox
        anchors.centerIn: parent
        source: Qt.resolvedUrl(dialogboximage)
        scale: 0.8
        width: dialogboximagewidth
        height: dialogboximageheight
        anchors.horizontalCenterOffset: -20
        anchors.verticalCenterOffset: -30
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

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: { parent.source = Qt.resolvedUrl(restartbuttonhover) }
                onExited: { parent.source = Qt.resolvedUrl(restartbuttonup) }
                onPressed: { parent.source = Qt.resolvedUrl(restartbuttondown); sddm.reboot() }
                onReleased: { parent.source = Qt.resolvedUrl(restartbuttonup) }
            }
            Text {
                verticalAlignment: Text.AlignVCenter
                text: restartbuttontext
                anchors.centerIn: parent
                font.family: loginfont.name
                font.italic: false
                font.pointSize: 34
                color: restartbuttoncolor
            }
        }

        Image {
            id: shutdownButton
            source: Qt.resolvedUrl(shutdownbuttonup)
            width: shutdownimagewidth
            height: shutdownimageheight
            x: shutdownleftpadding
            y: shutdowntoppadding

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: { parent.source = Qt.resolvedUrl(shutdownbuttonhover) }
                onExited: { parent.source = Qt.resolvedUrl(shutdownbuttonup) }
                onPressed: { parent.source = Qt.resolvedUrl(shutdownbuttondown); sddm.powerOff() }
                onReleased: { parent.source = Qt.resolvedUrl(shutdownbuttonup) }
            }
            Text {
                text: shutdownbuttontext
                anchors.centerIn: parent
                font.family: loginfont.name
                font.italic: false
                font.pointSize: 34
                color: shutdownbuttoncolor
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
            font.italic: false
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
                font.italic: false
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
            font.italic: false
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
                font.italic: false
                font.pointSize: passwordtextboxfontsize
                color: passwordtextboxcolor
                echoMode: TextInput.Password
                verticalAlignment: Text.AlignVCenter
                clip: true
                KeyNavigation.tab: loginButtonAction
                Keys.onPressed: (event) => {
                    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        sddm.login(name.text, password.text, sessionIndex)
                        event.accepted = true
                    }
                }
            }
        }

        Item {
            id: loginButtonAction
            focus: true
        }

        Image {
            id: loginButton
            source: Qt.resolvedUrl(loginbuttonup)
            width: loginbuttonimagewidth
            height: loginbuttonimageheight
            x: loginbuttonleftpadding
            y: loginbuttontoppadding

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: { parent.source = Qt.resolvedUrl(loginbuttonhover) }
                onExited: { parent.source = Qt.resolvedUrl(loginbuttonup) }
                onPressed: { parent.source = Qt.resolvedUrl(loginbuttondown); sddm.login(name.text, password.text, sessionIndex) }
                onReleased: { parent.source = Qt.resolvedUrl(loginbuttonup) }
            }
            Text {
                text: loginbuttontext
                anchors.centerIn: parent
                font.family: loginfont.name
                font.italic: false
                font.pointSize: 32
                color: loginbuttoncolor
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
                border.width: 1 * (defaultscale / 5)

                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 8
                    anchors.verticalCenter: parent.verticalCenter
                    text: sessionMenu.currentSessionName
                    font.family: loginfont.name
                    font.italic: false
                    font.pointSize: 28
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
        border.width: 1 * (defaultscale / 5)
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
                    font.pointSize: 20
                    color: "#104ea5"
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
}

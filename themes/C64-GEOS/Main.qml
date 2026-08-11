import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11
import SddmComponents 2.0

Rectangle {
    id : container
    LayoutMirroring.enabled : Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit : true

    property int defaultscale : setdefaultScale()
    property int defaultspritescale : setdefaultspriteScale()

    property int targetscreenwidth : 2560
    property int targetscreenheight : 1440

    property int defaultscreenwidth : 2560
    property int defaultscreenheight : 1440

    property int defaultspritewidth :  setdefaultspriteWidth()
    property int defaultspriteheight : setdefaultspriteHeight()

    property int defaultcharwidth : 8 * defaultscale
    property int defaultcharheight : 8 * defaultscale

    property int cbmheadertexttoppadding : setcbmheadertoppadding()

    property string c64black : "#000000"
    property string c64darkgrey : "#616161"
    property string c64lightgrey : "#cbcbcb"

    property string borderimage : "MasterAssets/Borders/CBMBorder-DarkGrey.png"
    property string backgroundimg : "MasterAssets/Backgrounds/Misc/CBMBackground-GEOS4.png"
    property int bgwidth : defaultscreenwidth
    property int bgheight : defaultscreenheight

    property string fontstyle : "MasterAssets/Fonts/Berkelium64.ttf"
    property int fsize : defaultcharwidth * 0.7
    property int fheight : defaultcharheight * 0.7

    property string headertext : "MasterAssets/HeaderText/CBMHeader-DarkGrey.svg"
    property int headertexttoppadding : fsize * cbmheadertexttoppadding
    property int headertextimagewidth : 250 * defaultscale
    property int headertextimageheight : 23 * defaultscale
    property bool headervisible : false

    property int dialogboxtoppadding : 11
    property int dialogboxleftppadding : 20 * defaultscale
    property string dialogboxtext : "SYSTEM LOGIN"
    property bool dialogboxtextvisible : true
    property string dialogboxtextcolor : c64black
    property int dialogboxtextsize : fsize-7
    property string dialogboximage : "MasterAssets/Windows/Misc/CBMWindow-Solid-GEOS.svg"
    property int dialogboximagewidth : 220 * defaultscale
    property int dialogboximageheight : 82 * defaultscale

    property int avatarleftpadding : fsize * 3
    property int avatartoppadding : fsize * 2.5
    property string cbmavatar : "MasterAssets/Avatars/Misc/CBMAvatar-GEOSMouse.png"
    property int avatarwidth : defaultspritewidth
    property int avatarheight : defaultspriteheight

    property int restartbuttonleftpadding : fsize * 2
    property int restartbuttontoppadding : fsize * 11
    property int restartbuttonimagewidth : fsize * 7
    property int restartbuttonimageheight : fsize + 10
    property string restartbuttonup : "MasterAssets/Buttons/Restart/Up/Misc/CBMRestartButtonUp-GEOS.svg"
    property string restartbuttondown : "MasterAssets/Buttons/Restart/Down/Misc/CBMRestartButtonDown-GEOS.svg"
    property string restartbuttonhover : "MasterAssets/Buttons/Restart/Hover/Misc/CBMRestartButtonHover-GEOS.svg"
    property string restartbuttontext : "RESTART"
    property int restartbuttonfontsize : fsize-3

    property int shutdownleftpadding : fsize * 27
    property int shutdowntoppadding : fsize * 11
    property int shutdownimagewidth : fsize * 7
    property int shutdownimageheight : fsize + 10
    property string shutdownbuttonup : "MasterAssets/Buttons/Shutdown/Up/Misc/CBMShutdownButtonUp-GEOS.svg"
    property string shutdownbuttondown : "MasterAssets/Buttons/Shuttdown/Down/Misc/CBMRestartButtonDown-GEOS.svg"
    property string shutdownbuttonhover : "MasterAssets/Buttons/Shutdown/Hover/Misc/CBMShutdownButtonHover-GEOS.svg"
    property string shutdownbuttontext : "SHUTDOWN"
    property int shutdownbuttonfontsize : fsize - 5

    property int loginbuttonleftpadding : fsize * 27
    property int loginbuttontoppadding : fsize * 8.5
    property int loginbuttonimagewidth : fsize * 7
    property int loginbuttonimageheight : fsize + 10
    property string loginbuttonup : "MasterAssets/Buttons/Login/Up/Misc/CBMLoginButtonUp-GEOS.svg"
    property string loginbuttondown : "MasterAssets/Buttons/Login/Down/Misc/CBMLoginButtonDown-GEOS.svg"
    property string loginbuttonhover : "MasterAssets/Buttons/Login/Hover/Misc/CBMLoginButtonHover-GEOS.svg"
    property string loginbuttontext : "LOGIN"
    property int loginbuttonfontsize : fsize-5

    property int usernameleftpadding : fsize * 15.5
    property int usernametoppadding : fsize * 3
    property int usernamewidth : fsize * 13
    property int usernameheight : fsize
    property string usernametext : "USERNAME: "

    property int usernametextboxleftpadding : fsize * 23
    property int usernametextboxtoppadding : fsize * 2.7
    property int usernametextboxwidth : fsize * 11
    property int usernametextboxheight : fsize * 1.4
    property string usernametextboximage : "MasterAssets/UsernameBox/Misc/CBMUsernameBox-GEOS.svg"

    property int passwordleftpadding : fsize * 15.5
    property int passwordtoppadding : fsize * 6
    property int passwordwidth : fsize * 13
    property int passwordheight : fsize
    property string passwordtext : "PASSWORD: "

    property int passwordtextboxleftpadding : fsize * 23
    property int passwordtextboxtoppadding : fsize * 5.7
    property int passwordtextboxwidth : fsize * 11
    property int passwordtextboxheight : fsize * 1.4
    property string passwordtextboximage : "MasterAssets/PasswordBox/Misc/CBMPasswordBox-GEOS.svg"

    property int comboboxleftpadding : fsize * 14
    property int comboboxtoppadding : fsize * 11
    property string comboboxcolor : c64lightgrey
    property string comboboxbordercolor : c64darkgrey
    property string comboboxhovercolor : c64darkgrey
    property string comboboxtextcolor : c64black
    property string comboboxmenucolor : c64darkgrey
    property int comboboxfontsize : fsize - 2
    property int comboboxwidth : fsize * 9
    property int comboboxheight : fsize * 1.4
    property string comboboximage : "MasterAssets/Arrows/CBMArrow-DarkGrey.svg"

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

    TextConstants { id : textConstants }

    FontLoader {
        id : loginfont
        source : Qt.resolvedUrl(fontstyle)
    }

    Connections {
        target : sddm
        function onLoginSucceeded() { }
        function onLoginFailed() { password.text = "" }
    }

    color : "#616161"
    anchors.fill : parent

    Background {
        anchors.fill: parent
        source: Qt.resolvedUrl(borderimage)
        fillMode: Image.Stretch
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            container.forceActiveFocus()
            sessionMenu.isExpanded = false
        }
    }

    Image {
        id : backgroundImage
        anchors.centerIn : container
        source : Qt.resolvedUrl(backgroundimg)
        width : bgwidth
        height : bgheight
    }

    Column {
        id : entryColumn64
        anchors.horizontalCenter : parent.horizontalCenter
        topPadding : headertexttoppadding
        Image {
            anchors.centerIn : top
            id : header
            source : Qt.resolvedUrl(headertext)
            width :  headertextimagewidth
            height : headertextimageheight
            visible : headervisible
        }
    }

    Image {
        id : promptbox
        anchors.centerIn : parent
        anchors.horizontalCenterOffset: -20
        anchors.verticalCenterOffset: -50
        source : Qt.resolvedUrl(dialogboximage)
        width : dialogboximagewidth
        height : dialogboximageheight
        visible : true

        Text {
            anchors.horizontalCenter : parent.horizontalCenter
            y: dialogboxtoppadding
            color : dialogboxtextcolor
            text : dialogboxtext
            visible : dialogboxtextvisible
            font.family : loginfont.name
            font.pointSize : dialogboxtextsize
        }

        Image {
            id : avatar
            source : Qt.resolvedUrl(cbmavatar)
            width : avatarwidth
            height : avatarheight
            x: avatarleftpadding
            y: avatartoppadding
        }

        Image {
            id : restartButton
            source : Qt.resolvedUrl(restartbuttonup)
            width : restartbuttonimagewidth
            height : restartbuttonimageheight
            x: restartbuttonleftpadding
            y: restartbuttontoppadding

            Text {
                text : restartbuttontext
                anchors.centerIn : parent
                font.family : loginfont.name
                font.pointSize : restartbuttonfontsize
                color : c64black
            }

            MouseArea {
                anchors.fill : parent
                hoverEnabled : true
                onEntered : parent.source = Qt.resolvedUrl(restartbuttonhover)
                onExited : parent.source = Qt.resolvedUrl(restartbuttonup)
                onPressed : { parent.source = Qt.resolvedUrl(restartbuttondown); sddm.reboot(); }
                onReleased : parent.source = Qt.resolvedUrl(restartbuttonup)
            }
        }

        Image {
            id : shutdownButton
            source : Qt.resolvedUrl(shutdownbuttonup)
            width : shutdownimagewidth
            height : shutdownimageheight
            x: shutdownleftpadding
            y: shutdowntoppadding

            Text {
                text : shutdownbuttontext
                anchors.centerIn : parent
                font.family : loginfont.name
                font.pointSize : shutdownbuttonfontsize
                color : c64black
            }

            MouseArea {
                anchors.fill : parent
                hoverEnabled : true
                onEntered : parent.source = Qt.resolvedUrl(shutdownbuttonhover)
                onExited : parent.source = Qt.resolvedUrl(shutdownbuttonup)
                onPressed : { parent.source = Qt.resolvedUrl(shutdownbuttondown); sddm.powerOff(); }
                onReleased : parent.source = Qt.resolvedUrl(shutdownbuttonup)
            }
        }

        Text {
            id : lblLoginName
            x: usernameleftpadding
            y: usernametoppadding
            width : usernamewidth
            height : usernameheight
            text : usernametext
            font.pointSize : 36
            verticalAlignment : Text.AlignVCenter
            color : c64black
            font.family : loginfont.name
        }

        Item {
            x: usernametextboxleftpadding
            y: usernametextboxtoppadding
            width : usernametextboxwidth
            height : usernametextboxheight

            Image { anchors.fill: parent; source : Qt.resolvedUrl(usernametextboximage) }

            TextInput {
                id : name
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                font.family : loginfont.name
                font.pointSize : fsize - 2
                color : c64black
                text : userModel.lastUser
                verticalAlignment : Text.AlignVCenter
                clip: true
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
            x: passwordleftpadding
            y: passwordtoppadding
            width : passwordwidth
            height : passwordheight
            text : passwordtext
            verticalAlignment : Text.AlignVCenter
            color : c64black
            font.pointSize : fsize - 2
            font.family : loginfont.name
        }

        Item {
            x: passwordtextboxleftpadding
            y: passwordtextboxtoppadding
            width : passwordtextboxwidth
            height : passwordtextboxheight

            Image { anchors.fill: parent; source : Qt.resolvedUrl(passwordtextboximage) }

            TextInput {
                id : password
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                font.family : loginfont.name
                font.pointSize : fsize - 15
                color : c64black
                echoMode : TextInput.Password
                verticalAlignment : Text.AlignVCenter
                clip: true
                KeyNavigation.tab : loginButtonAction
                Keys.onPressed : (event) => {
                    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        sddm.login(name.text, password.text, sessionMenu.sessionIndex)
                        event.accepted = true
                    }
                }
            }
        }

        Image {
            id : loginButton
            source : Qt.resolvedUrl(loginbuttonup)
            width : loginbuttonimagewidth
            height : loginbuttonimageheight
            x: loginbuttonleftpadding
            y: loginbuttontoppadding

            Item { id: loginButtonAction; focus: true }

            Text {
                text : loginbuttontext
                anchors.centerIn : parent
                font.family : loginfont.name
                font.pointSize : loginbuttonfontsize
                color : c64black
            }

            MouseArea {
                anchors.fill : parent
                hoverEnabled : true
                onEntered : parent.source = Qt.resolvedUrl(loginbuttonhover)
                onExited : parent.source = Qt.resolvedUrl(loginbuttonup)
                onPressed : { parent.source = Qt.resolvedUrl(loginbuttondown); sddm.login(name.text, password.text, sessionMenu.sessionIndex); }
                onReleased : parent.source = Qt.resolvedUrl(loginbuttonup)
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

            MouseArea {
                x: -5000
                y: -5000
                width: 10000
                height: 10000
                visible: sessionMenu.isExpanded
                z: -1
                onClicked: {
                    sessionMenu.isExpanded = false
                }
            }

            Rectangle {
                anchors.fill: parent
                color: comboboxcolor
                border.color: comboboxbordercolor
                border.width: 1 * (defaultscale /5)

                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 8
                    anchors.verticalCenter: parent.verticalCenter
                    text: sessionMenu.currentSessionName
                    font.family: loginfont.name
                    font.pointSize: comboboxfontsize
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
                        sessionMenu.isExpanded = !sessionMenu.isExpanded
                    }
                }
            }

            Rectangle {
                width: parent.width
                height: Math.min(sessionList.contentHeight, fsize * 10)
                anchors.top: parent.bottom
                anchors.topMargin: -1
                color: comboboxmenucolor
                border.color: comboboxbordercolor
                border.width: 1 * (defaultscale /5)
                visible: sessionMenu.isExpanded
                clip: true
                z: 2

                ListView {
                    id: sessionList
                    anchors.fill: parent
                    model: sessionModel
                    interactive: contentHeight > height

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
                            font.pointSize: comboboxfontsize
                            color: c64black
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
}

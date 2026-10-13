import QtQuick 2.15
import QtQuick.Window 2.15
import SddmComponents 2.0

Rectangle {
    id: container
    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true
    property int sessionIndex: typeof sessionMenu !== "undefined" ? sessionMenu.sessionIndex : sessionModel.lastIndex

    property int defaultscale: setdefaultScale()

    property int targetscreenwidth: container.width
    property int targetscreenheight: container.height

    property int defaultscreenwidth: 1920 * defaultscale
    property int defaultscreenheight: 1200 * defaultscale

    property int defaultcharwidth: 8 * defaultscale
    property int defaultcharheight: 8 * defaultscale

    property string doscolor: "#9effe9"
    property string dosblack: "#000000"

    property string borderimage: "Background.png"

    property string fontstyle: "wartext.ttf"
    property int dosfontsize: 20 * defaultscale

    property int welcometoppadding: 50 * defaultscale
    property int welcomeleftpadding: 50 * defaultscale
    property string welcometext: "TRZ. 34/53/76\nACTIVE PORTS: 34,53,75,94\n#45/34/53  ALT MODE FUNCT: PV-8-AY345  STANDBY MODE ACTIVE\n#543.654\n\n-:LOGON REQUIRED:-\n\n"
    property bool welcometextvisible: true

    property int usernametoppadding: 253 * defaultscale
    property int usernameleftpadding: 150 * defaultscale
    property int usernamewidth: 200 * defaultscale
    property int usernameheight: 50 * defaultscale
    property string usernametext: "USERNAME:"
    property bool usernametextvisible: true

    property int usernameboxtoppadding: 238 * defaultscale
    property int usernameboxleftpadding: 240 * defaultscale
    property int usernameboxwidth: 200 * defaultscale
    property int usernameboxheight: 50 * defaultscale
    property string usernameboxtextboximage: ""

    property int passwordtoppadding: 325 * defaultscale
    property int passwordleftpadding: 150 * defaultscale
    property string passwordtext: "PASSWORD:"

    property int passwordboxtoppadding: 315 * defaultscale
    property int passwordboxleftpadding: 240 * defaultscale
    property int passwordboxwidth: 400 * defaultscale
    property int passwordboxheight: 40 * defaultscale
    property string passwordtextboximage: ""

    property int loginbuttontoppadding: 400 * defaultscale
    property int loginbuttonleftpadding: 150 * defaultscale
    property int loginbuttonimagewidth: 100 * defaultscale
    property int loginbuttonimageheight: 50 * defaultscale
    property string logintbuttonup: "None.png"
    property string loginbuttondown: "None.png"
    property string loginbuttonhover: "None.png"
    property string loginbuttontext: "LOGIN"
    property string loginbuttoncolor: doscolor
    property int loginbuttonfontsize: 32

    property int restartbuttontoppadding: 400 * defaultscale
    property int restartbuttonleftpadding: 300 * defaultscale
    property int restartbuttonimagewidth: 100 * defaultscale
    property int restartbuttonimageheight: 50 * defaultscale
    property string restartbuttonup: "None.png"
    property string restartbuttondown: "None.png"
    property string restartbuttonhover: "None.png"
    property string restartbuttontext: "RESTART"
    property string restartbuttoncolor: doscolor
    property int restartbuttonfontsize: 32

    property int shutdownbuttontoppadding: 400 * defaultscale
    property int shutdownbuttonleftpadding: 450 * defaultscale
    property int shutdownbuttonimagewidth: 100 * defaultscale
    property int shutdownbuttonimageheight: 50 * defaultscale
    property string shutdownbuttonup: "None.png"
    property string shutdownbuttondown: "None.png"
    property string shutdownbuttonhover: "None.png"
    property string shutdownbuttontext: "SHUTDOWN"
    property string shutdownbuttoncolor: doscolor
    property int shutdownbuttonfontsize: 32

    property int comboboxtoppadding: 110 * defaultscale
    property int comboboxleftpadding: 1150 * defaultscale
    property string comboboxcolor: dosblack
    property string comboboxbordercolor: dosblack
    property string comboboxhovercolor: dosblack
    property string comboboxfocuscolor: dosblack
    property string comboboxtextcolor: doscolor
    property string comboboxmenucolor: dosblack
    property string comboboxarrowcolor: "transparent"
    property int comboboxwidth: 170 * defaultscale
    property int comboboxheight: 50 * defaultscale
    property string comboboximage: "Arrow.png"
    property int comboboxfontsize: 32
    property bool comboboxvisible: true

    function setdefaultScale() {
        var setscale = 1
        if (container.width > 1920) {
            setscale = 2
        }
        return setscale
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

    color: doscolor
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
        id: entryColumn1
        anchors.left: parent.left
        topPadding: welcometoppadding
        leftPadding: welcomeleftpadding
        Text {
            color: doscolor
            text: welcometext
            visible: welcometextvisible
            font.family: loginfont.name
            font.italic: false
            font.pointSize: dosfontsize
        }
    }

    Column {
        id: entryColumn2
        anchors.left: parent.left
        topPadding: usernametoppadding
        leftPadding: usernameleftpadding

        Text {
            color: doscolor
            text: usernametext
            visible: usernametextvisible
            font.family: loginfont.name
            font.italic: false
            font.pointSize: dosfontsize
        }
    }

    Column {
        id: entryColumn3
        anchors.left: parent.left
        topPadding: usernameboxtoppadding
        leftPadding: usernameboxleftpadding

        Item {
            width: usernameboxwidth
            height: usernameboxheight

            Image {
                anchors.fill: parent
                source: usernameboxtextboximage !== "" ? Qt.resolvedUrl(usernameboxtextboximage) : ""
            }

            TextInput {
                id: name
                anchors.fill: parent
                font.family: loginfont.name
                font.italic: false
                font.pointSize: dosfontsize
                color: doscolor
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
    }

    Column {
        id: entryColumn4
        anchors.left: parent.left
        topPadding: passwordtoppadding
        leftPadding: passwordleftpadding

        Text {
            color: doscolor
            text: passwordtext
            visible: true
            font.family: loginfont.name
            font.italic: false
            font.pointSize: dosfontsize
        }
    }

    Column {
        id: entryColumn5
        anchors.left: parent.left
        topPadding: passwordboxtoppadding
        leftPadding: passwordboxleftpadding

        Item {
            width: passwordboxwidth
            height: passwordboxheight

            Image {
                anchors.fill: parent
                source: passwordtextboximage !== "" ? Qt.resolvedUrl(passwordtextboximage) : ""
            }

            TextInput {
                id: password
                anchors.fill: parent
                font.family: loginfont.name
                font.italic: false
                font.pointSize: dosfontsize
                color: doscolor
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
    }

    Item {
        id: loginButtonAction
        focus: true
    }

    Column {
        id: entryColumn7
        anchors.left: parent.left
        topPadding: loginbuttontoppadding
        leftPadding: loginbuttonleftpadding

        Image {
            id: loginButton
            source: logintbuttonup !== "" ? Qt.resolvedUrl(logintbuttonup) : ""
            width: loginbuttonimagewidth
            height: loginbuttonimageheight
            visible: true

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: { parent.source = loginbuttonhover !== "" ? Qt.resolvedUrl(loginbuttonhover) : "" }
                onExited: { parent.source = logintbuttonup !== "" ? Qt.resolvedUrl(logintbuttonup) : "" }
                onPressed: {
                    parent.source = loginbuttondown !== "" ? Qt.resolvedUrl(loginbuttondown) : ""
                    sddm.login(name.text, password.text, sessionIndex)
                }
                onReleased: { parent.source = logintbuttonup !== "" ? Qt.resolvedUrl(logintbuttonup) : "" }
            }

            Text {
                text: loginbuttontext
                anchors.centerIn: parent
                font.family: loginfont.name
                font.italic: false
                font.pointSize: loginbuttonfontsize
                color: loginbuttoncolor
            }
        }
    }

    Column {
        id: entryColumn8
        anchors.left: parent.left
        topPadding: restartbuttontoppadding
        leftPadding: restartbuttonleftpadding

        Image {
            id: restartButton
            source: restartbuttonup !== "" ? Qt.resolvedUrl(restartbuttonup) : ""
            width: restartbuttonimagewidth
            height: restartbuttonimageheight
            visible: true

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: { parent.source = restartbuttonhover !== "" ? Qt.resolvedUrl(restartbuttonhover) : "" }
                onExited: { parent.source = restartbuttonup !== "" ? Qt.resolvedUrl(restartbuttonup) : "" }
                onPressed: {
                    parent.source = restartbuttondown !== "" ? Qt.resolvedUrl(restartbuttondown) : ""
                    sddm.reboot()
                }
                onReleased: { parent.source = restartbuttonup !== "" ? Qt.resolvedUrl(restartbuttonup) : "" }
            }

            Text {
                text: restartbuttontext
                anchors.centerIn: parent
                font.family: loginfont.name
                font.italic: false
                font.pointSize: restartbuttonfontsize
                color: restartbuttoncolor
            }
        }
    }

    Column {
        id: entryColumn9
        anchors.left: parent.left
        topPadding: shutdownbuttontoppadding
        leftPadding: shutdownbuttonleftpadding

        Image {
            id: shutdownButton
            source: shutdownbuttonup !== "" ? Qt.resolvedUrl(shutdownbuttonup) : ""
            width: shutdownbuttonimagewidth
            height: shutdownbuttonimageheight
            visible: true

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: { parent.source = shutdownbuttonhover !== "" ? Qt.resolvedUrl(shutdownbuttonhover) : "" }
                onExited: { parent.source = shutdownbuttonup !== "" ? Qt.resolvedUrl(shutdownbuttonup) : "" }
                onPressed: {
                    parent.source = shutdownbuttondown !== "" ? Qt.resolvedUrl(shutdownbuttondown) : ""
                    sddm.powerOff()
                }
                onReleased: { parent.source = shutdownbuttonup !== "" ? Qt.resolvedUrl(shutdownbuttonup) : "" }
            }

            Text {
                text: shutdownbuttontext
                anchors.centerIn: parent
                font.family: loginfont.name
                font.italic: false
                font.pointSize: shutdownbuttonfontsize
                color: shutdownbuttoncolor
            }
        }
    }

    Column {
        id: entryColumn10
        anchors.left: parent.left
        topPadding: comboboxtoppadding
        leftPadding: comboboxleftpadding

        Item {
            id: sessionMenu
            width: comboboxwidth
            height: comboboxheight
            z: 100
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
                    source: comboboximage !== "" ? Qt.resolvedUrl(comboboximage) : ""
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

    Column {
        id: entryColumn22
        anchors.top: parent.top
        anchors.horizontalCenter: container.horizontalCenter
        topPadding: welcometoppadding

        Text {
            color: doscolor
            text: "SYS PROC 3435.45.6456"
            visible: true
            font.family: loginfont.name
            font.italic: false
            font.pointSize: dosfontsize
        }
    }

    Column {
        id: entryColumn222
        anchors.top: parent.top
        anchors.horizontalCenter: container.horizontalCenter
        topPadding: welcometoppadding

        Text {
            color: doscolor
            text: "\n\n\n#989.283      #028.392      #099.293      #934.905"
            visible: true
            font.family: loginfont.name
            font.italic: false
            font.pointSize: dosfontsize
        }
    }

    Column {
        id: entryColumn33
        anchors.right: parent.right
        topPadding: welcometoppadding
        rightPadding: welcomeleftpadding

        Text {
            color: doscolor
            text: "XCOMP STATUS: PV-450\nCPU TM USED: 23:43"
            visible: true
            font.family: loginfont.name
            font.italic: false
            font.pointSize: dosfontsize
        }
    }

    Column {
        id: entryColumn44
        anchors.right: parent.right
        topPadding: welcometoppadding
        rightPadding: welcomeleftpadding

        Text {
            color: doscolor
            text: "XCOMP STATUS: PV-450\nCPU TM USED: 23:43\n\n#261.372"
            visible: true
            font.family: loginfont.name
            font.italic: false
            font.pointSize: dosfontsize
        }
    }

    Column {
        id: entryColumn55
        anchors.right: parent.right
        topPadding: welcometoppadding
        rightPadding: welcomeleftpadding

        Text {
            color: doscolor
            text: "#989.283"
            visible: true
            font.family: loginfont.name
            font.italic: false
            font.pointSize: dosfontsize
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
        height: Math.min(sessionList.count, 8) * comboboxheight

        ListView {
            id: sessionList
            anchors.fill: parent
            model: sessionModel
            interactive: true
            boundsBehavior: Flickable.StopAtBounds

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
        source: Qt.resolvedUrl("Pointer.png")
        width: 32
        height: 38
        x: cursorTracker.mouseX
        y: cursorTracker.mouseY
        z: 9999999
    }
}

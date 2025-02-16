import QtQuick 2.15
import QtGraphicalEffects 1.15
import SddmComponents 2.0

Rectangle {
    width: 1920
    height: 1080
    color: "#000000"

    Background {
        id: background
        anchors.fill: parent
        source: {
            if (status == Image.Error && source != config.background) {
            source = "file:///usr/share/sddm/themes/customTheme/theme_background.jpeg"
            }
        }
        fillMode: Image.PreserveAspectCrop
        onStatusChanged: {
            if (status == Image.Error && source != config.background) {
                source = config.defaultBackground  // Fallback background
            }
        }
    }


    FastBlur {
        id: blurEffect
        anchors.fill: parent
        source: background
        radius: passwordInput.activeFocus ? 20 : 0 
        Behavior on radius {
            NumberAnimation {
                duration: 300
                easing.type: Easing.InOutQuad
            }
        }
    }

    PasswordBox {
        id: passwordInput
        width: 300
        height: 50
        font.pixelSize: 18
        color: "white"
        echoMode: TextInput.Password
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        focus: true
}

Component.onCompleted: {
    if (typeof keyboard === "undefined") {
        keyboard = QtObject {
            function open() { console.log("Keyboard opened (simulated)") }
            function close() { console.log("Keyboard closed (simulated)") }
        }
    }
}


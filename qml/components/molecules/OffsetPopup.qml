import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../atoms"

Popup {
    id: offsetPopup
    modal: true
    focus: true
    parent: Overlay.overlay
    anchors.centerIn: Overlay.overlay
    closePolicy: Popup.CloseOnPressOutside

    width: Math.min(Overlay.overlay.width * 0.50, 700)
    height: Math.min(Overlay.overlay.height * 0.70, 600)

    property string actualPositionName: ""
    property bool isJointMode: false
    property alias dxValue: tcpDx.value
    property alias dyValue: tcpDy.value
    property alias dzValue: tcpDz.value
    property alias drxValue: tcpDrx.value
    property alias dryValue: tcpDry.value
    property alias drzValue: tcpDrz.value
    property alias dj1Value: jointDj1.value
    property alias dj2Value: jointDj2.value
    property alias dj3Value: jointDj3.value
    property alias dj4Value: jointDj4.value
    property alias dj5Value: jointDj5.value
    property alias dj6Value: jointDj6.value

    signal saveClicked()

    function openWithTcp(name, dx, dy, dz, drx, dry, drz) {
        actualPositionName = name || ""
        isJointMode = false
        tcpDx.value = (dx !== undefined && dx !== null) ? String(dx) : "0.0"
        tcpDy.value = (dy !== undefined && dy !== null) ? String(dy) : "0.0"
        tcpDz.value = (dz !== undefined && dz !== null) ? String(dz) : "0.0"
        tcpDrx.value = (drx !== undefined && drx !== null) ? String(drx) : "0.0"
        tcpDry.value = (dry !== undefined && dry !== null) ? String(dry) : "0.0"
        tcpDrz.value = (drz !== undefined && drz !== null) ? String(drz) : "0.0"
        open()
    }

    function openWithJoints(name, dj1, dj2, dj3, dj4, dj5, dj6) {
        actualPositionName = name || ""
        isJointMode = true
        jointDj1.value = (dj1 !== undefined && dj1 !== null) ? String(dj1) : "0.0"
        jointDj2.value = (dj2 !== undefined && dj2 !== null) ? String(dj2) : "0.0"
        jointDj3.value = (dj3 !== undefined && dj3 !== null) ? String(dj3) : "0.0"
        jointDj4.value = (dj4 !== undefined && dj4 !== null) ? String(dj4) : "0.0"
        jointDj5.value = (dj5 !== undefined && dj5 !== null) ? String(dj5) : "0.0"
        jointDj6.value = (dj6 !== undefined && dj6 !== null) ? String(dj6) : "0.0"
        open()
    }

    function clearState() {
        actualPositionName = ""
        isJointMode = false
        tcpDx.value = "0.0"
        tcpDy.value = "0.0"
        tcpDz.value = "0.0"
        tcpDrx.value = "0.0"
        tcpDry.value = "0.0"
        tcpDrz.value = "0.0"
        jointDj1.value = "0.0"
        jointDj2.value = "0.0"
        jointDj3.value = "0.0"
        jointDj4.value = "0.0"
        jointDj5.value = "0.0"
        jointDj6.value = "0.0"
    }

    onClosed: clearState()

    background: Rectangle {
        anchors.fill: parent
        color: "#eeeeee"
        radius: 20
        border.color: "#d0d0d0"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 14
        spacing: 8

        Label {
            text: "Editar offset"
            color: "#525252"
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        Label {
            text: `Posicao: ${actualPositionName}`
            color: "#6a6a6a"
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle { height: 1; color: "#b8b8b8"; Layout.fillWidth: true }

        GridLayout {
            id: tcpGrid
            columns: 3
            rowSpacing: 10
            columnSpacing: 10
            Layout.leftMargin: 8
            Layout.rightMargin: 8
            Layout.alignment: Qt.AlignHCenter
            visible: !offsetPopup.isJointMode

            PoseInput { id: tcpDx; nameInput: "dX"; value: "0.0" }
            PoseInput { id: tcpDy; nameInput: "dY"; value: "0.0" }
            PoseInput { id: tcpDz; nameInput: "dZ"; value: "0.0" }
            PoseInput { id: tcpDrx; nameInput: "dRX"; value: "0.0" }
            PoseInput { id: tcpDry; nameInput: "dRY"; value: "0.0" }
            PoseInput { id: tcpDrz; nameInput: "dRZ"; value: "0.0" }
        }

        GridLayout {
            id: jointGrid
            columns: 3
            rowSpacing: 10
            columnSpacing: 10
            Layout.leftMargin: 8
            Layout.rightMargin: 8
            Layout.alignment: Qt.AlignHCenter
            visible: offsetPopup.isJointMode

            PoseInput { id: jointDj1; nameInput: "dJ1"; value: "0.0" }
            PoseInput { id: jointDj2; nameInput: "dJ2"; value: "0.0" }
            PoseInput { id: jointDj3; nameInput: "dJ3"; value: "0.0" }
            PoseInput { id: jointDj4; nameInput: "dJ4"; value: "0.0" }
            PoseInput { id: jointDj5; nameInput: "dJ5"; value: "0.0" }
            PoseInput { id: jointDj6; nameInput: "dJ6"; value: "0.0" }
        }

        Rectangle { height: 1; color: "#b8b8b8"; Layout.fillWidth: true }

        RowLayout {
            Layout.fillWidth: true
            spacing: 0
            CommonBtn {
                text: "Cancelar"
                style: "danger"
                onClicked: offsetPopup.close()
            }
            CommonBtn {
                text: "Salvar"
                style: "success"
                onClicked: {
                    if (actualPositionName.length === 0) return
                    saveClicked()
                    offsetPopup.close()
                }
            }
        }
    }
}

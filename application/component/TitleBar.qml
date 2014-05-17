import QtQuick 2.0
import QtQuick.Layouts 1.0

Rectangle{
    id: titlebar

    property variant title
    property variant isfullscreen
    property variant minIcon
    property variant minHoverIcon
    property variant maxIcon
    property variant maxHoverIcon
    property variant normalIcon
    property variant normalHoverIcon
    property variant closeIcon
    property variant closeHoverIcon

    signal minClicked()
    signal maxClicked()
    signal closeClicked()
    signal doubleClicked()

    width: parent.width
    color: 'transparent'

    RowLayout{
        anchors.fill: parent
        Text{
            id: text
            anchors.left: parent.left
            anchors.right: min.left
            height: parent.height
            text: titlebar.title

            MouseArea {
                anchors.fill: parent
                hoverEnabled: false
                onEntered: {}
                onExited: {}
                onWheel: {}
                onClicked: {}
                onDoubleClicked:{
                    titlebar.doubleClicked();
                }
            }
        }

        Rectangle{
            id: min
            anchors.right: max.left
            width: parent.height
            height: parent.height
            color: "transparent"

            Image{
                id: minimage
                anchors.fill: parent
                source: titlebar.minIcon
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color="lightgreen";
                    minimage.source = titlebar.minHoverIcon
                }
                onExited: {
                    parent.color="transparent";
                    minimage.source = titlebar.minIcon
                }
                onWheel: {}
                onClicked: {
                    titlebar.minClicked();
                }
            }
        }

        Rectangle{
            id: max
            anchors.right: close.left
            width: parent.height
            height: parent.height
            color: "transparent"
            Image{
                id: maximage
                anchors.fill: parent
                source: titlebar.isfullscreen? titlebar.maxIcon : titlebar.normalIcon
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color = "lightgreen";
                    maximage.source =  titlebar.isfullscreen ? titlebar.maxHoverIcon : titlebar.normalHoverIcon

                }
                onExited: {
                    parent.color = "transparent";
                    maximage.source =  titlebar.isfullscreen ? titlebar.maxIcon : titlebar.normalIcon

                }
                onWheel: {}
                onClicked: {
                    titlebar.maxClicked();
                }
            }
        }

        Rectangle{
            id: close
            anchors.right: parent.right
            width: parent.height
            height: parent.height
            color: "transparent"

            Image{
                id: closeimage
                anchors.fill: parent
                source: titlebar.closeIcon
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color="lightgreen";
                    closeimage.source = titlebar.closeHoverIcon
                }
                onExited: {
                    parent.color="transparent";
                    closeimage.source = titlebar.closeIcon
                }
                onWheel: {}

                onClicked: {
                    titlebar.closeClicked();
                }
            }
        }
    }
}
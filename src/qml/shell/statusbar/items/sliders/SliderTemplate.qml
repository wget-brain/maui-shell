import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Templates 2.15 as T

import org.kde.kirigami 2.14 as Kirigami
import org.mauikit.controls 1.2 as Maui

import QtGraphicalEffects 1.15

T.Slider
{
    id: control
    implicitHeight: 22 + topPadding + bottomPadding
//topInset: 0-topPadding
//bottomInset: 0-bottomPadding
    property alias iconSource : _icon.source
    property alias animatedRec : _animatedRec

    background: Rectangle
    {

        radius: height/2
        color: Qt.darker(Kirigami.Theme.backgroundColor, 1.2)

        Rectangle
        {
            id: _bg

            width: Math.max(height, control.visualPosition * parent.width)
            height: control.height
            anchors.verticalCenter: parent.verticalCenter
            color: Kirigami.Theme.highlightColor
            radius: height/2
            clip: true

            Rectangle
            {
                id: _animatedRec
                height: parent.height
                color: Qt.lighter(parent.color)
                opacity: 0.5
                Behavior on width
                {
                    NumberAnimation
                    {
                        id: animation
                        duration: Kirigami.Units.shortDuration
                        easing.type: Easing.OutQuad
                    }
                }
            }


            layer.enabled: true
            layer.effect: OpacityMask
            {
                maskSource: Rectangle
                {
                    width: _bg.width
                    height: _bg.height
                    radius: _bg.radius
                }
            }

        }
    }

    handle: Rectangle
    {
        x: Math.max(0,(control.visualPosition * parent.availableWidth) - width)
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: control.height
        implicitHeight: control.height
        color: Kirigami.Theme.highlightColor
        radius: height/2
        Kirigami.Icon
        {
            id: _icon
            height: 16
            width : 16
            color: Kirigami.Theme.highlightedTextColor
            anchors.centerIn: parent
        }
    }
}

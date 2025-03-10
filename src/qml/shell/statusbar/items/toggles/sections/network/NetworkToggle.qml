import QtQuick 2.15
import QtQuick.Controls 2.15

import org.kde.kirigami 2.14 as Kirigami
import org.mauikit.controls 1.3 as Maui
import org.kde.plasma.networkmanagement 0.2 as PlasmaNM

import org.maui.cask 1.0 as Cask
import "../.."

ToggleTemplate
{
    icon.name: connectionIconProvider.connectionIcon
    template.label1.text:  networkStatus.activeConnections.split(" ").pop()
    tooltipText: networkStatus.activeConnections
    display: ToolButton.TextBesideIcon

    property alias handler : handler

    BusyIndicator {
        id: connectingIndicator

        anchors.centerIn: parent
        height: Math.min (parent.width, parent.height)
        width: height
        running: connectionIconProvider.connecting
    }

    page: NetworkPage
    {

    }

    PlasmaNM.NetworkStatus
    {
        id: networkStatus
    }

    PlasmaNM.ConnectionIcon
    {
        id: connectionIconProvider
    }

    PlasmaNM.Handler
    {
        id: handler
    }

}

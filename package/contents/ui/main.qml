/*
    SPDX-FileCopyrightText: %{CURRENT_YEAR} %{AUTHOR} <%{EMAIL}>
    SPDX-License-Identifier: LGPL-2.1-or-later
*/

import QtQuick 2.1
import QtQuick.Layouts 1.1
 import QtQuick.Controls 2.5
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {

    function get_hitokoto(){
        var xmlhttp = null;
        xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange=function() {
            var sentence = JSON.parse(xmlhttp.responseText);
            label.text = ((sentence.from_who != null && sentence != "undefined")?sentence.from_who + ":":"") +  "<h3>" + sentence.hitokoto + "<\h1>"
        }
        xmlhttp.open("GET","https://v1.hitokoto.cn",true);
        xmlhttp.send();
    }
    Label {
        id: label
        textFormat: "RichText";
        text: "waiting..."
        MouseArea {
            anchors.fill: parent;
            onClicked: {
                get_hitokoto();
            }
        }

    }

    Timer {
        interval: 30000;
        triggeredOnStart: true;
        running: true;
        onTriggered: {
            get_hitokoto();
        }
    }
}

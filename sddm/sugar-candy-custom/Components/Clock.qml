//
// This file is part of SDDM Sugar Candy.
// A theme for the Simple Display Desktop Manager.
//
// Copyright (C) 2018–2020 Marian Arlt
//
// SDDM Sugar Candy is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or any later version.
//
// You are required to preserve this and any additional legal notices, either
// contained in this file or in other files that you received along with
// SDDM Sugar Candy that refer to the author(s) in accordance with
// sections §4, §5 and specifically §7b of the GNU General Public License.
//
// SDDM Sugar Candy is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with SDDM Sugar Candy. If not, see <https://www.gnu.org/licenses/>
//

import QtQuick 2.11
import QtQuick.Controls 2.4

Column {
    id: clock
    spacing: 0
    width: parent.width / 2

    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: config.HeaderText !=="" ? root.font.pointSize * 3 : 0
        color: root.palette.text
        renderType: Text.QtRendering
        text: config.HeaderText
    }

    Label {
        id: timeLabel
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: root.font.pointSize * 8
        color: root.palette.text
        renderType: Text.QtRendering
        function updateTime() {
            var time = new Date().toLocaleTimeString(Qt.locale(config.Locale), config.HourFormat == "long" ? Locale.LongFormat 
            : config.HourFormat !== "" ? config.HourFormat : Locale.ShortFormat)

            if (time.charAt(0) === "0" && time.charAt(1) !== "1") {
                time = time.substring(1);
            }

            text = time;
        }
    }

    Label {
        id: dateLabel
        anchors.horizontalCenter: parent.horizontalCenter
        color: root.palette.text
        renderType: Text.QtRendering

        function getOrdinalSuffix(day) {
            if (day >= 11 && day <= 13) return "th";
            switch (day % 10) {
                case 1: return "st";
                case 2: return "nd";
                case 3: return "rd";
                default: return "th";
            }
        }

        function updateTime() {
            var date = new Date();
            var day = date.getDate();
            var month = date.toLocaleDateString(Qt.locale(config.Locale), "MMMM");
            var weekday = date.toLocaleDateString(Qt.locale(config.Locale), "dddd");
            var formattedDate = weekday + ", " + month + " " + day + getOrdinalSuffix(day);
            text = formattedDate;
        }
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            dateLabel.updateTime()
            timeLabel.updateTime()
        }
    }

    Component.onCompleted: {
        dateLabel.updateTime()
        timeLabel.updateTime()
    }
}

/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Mobility Components.
**
** $QT_BEGIN_LICENSE:LGPL21$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 or version 3 as published by the Free
** Software Foundation and appearing in the file LICENSE.LGPLv21 and
** LICENSE.LGPLv3 included in the packaging of this file. Please review the
** following information to ensure the GNU Lesser General Public License
** requirements will be met: https://www.gnu.org/licenses/lgpl.html and
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** As a special exception, The Qt Company gives you certain additional
** rights. These rights are described in The Qt Company LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0

Effect {
    id: root
    parameters: ListModel {
        ListElement {
            name: "Amplitude"
            value: 0.5
        }
    }

    // Transform slider values, and bind result to shader uniforms
    property real granularity: parameters.get(0).value * 20
    property real weight: parameters.get(0).value

    property real centerX
    property real centerY
    property real time

    SequentialAnimation {
        running: true
        loops: Animation.Infinite
        ScriptAction {
            script: {
                centerX = Math.random()
                centerY = Math.random()
            }
        }
        NumberAnimation {
            target: root
            property: "time"
            from: 0
            to: 1
            duration: 1000
        }
    }

    fragmentShaderFilename: "shockwave.fsh"
}
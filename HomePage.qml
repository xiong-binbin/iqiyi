import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2 as Controls2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.2
import QtQml 2.2
Rectangle{
    anchors.fill: parent
    color: "#1b2226"

    Rectangle{
        id: statusBar
        width: parent.width
        height: menuBar.minWidth
        z: 50
        color: "#272d31"

        Image {
            source: "./ico/TitleLogo.scale-200.png"
            scale: 0.36
            x: -5
            y: -5
        }

        Text {
            font.pointSize: 12
            color: "#838485"
            x: 80
            y: 18
            text: qsTr("首页")
        }

        Canvas{
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d");
                ctx.strokeStyle = "green"
                ctx.lineWidth = 1
                ctx.moveTo(65,18);
                ctx.lineTo(65,38);
                ctx.stroke();
            }
        }

        Button{
            id: searchButton
            x: parent.width - width -20
            y: (menuBar.minWidth - height)/2
            width: 280
            height: 36
            style: ButtonStyle{
                background: Rectangle{
                    radius: 20
                    border.width: 1
                    border.color: "green"
                    color: control.hovered ? "#1b2226":"#272d31"

                    Text {
                        font.pointSize: 10
                        color: "#606061"
                        x: 14
                        y: (parent.height - height)/2
                        text: qsTr("搜索")
                    }

                    Rectangle{
                        x: parent.width - width - 3
                        y: (parent.height - height)/2
                        width: 90
                        height: parent.height - 6
                        radius: 20
                        color: "#0bbe06"

                        Image {
                            source: "./ico/search/search.scale-200.png"
                            scale: 0.3
                            x: -2
                            y: -5
                        }

                        Text {
                            font.pointSize: 10
                            color: "white"
                            x: 28
                            y: (parent.height - height)/2
                            text: qsTr("搜全网")
                        }
                    }
                }
            }
        }
    }

    Controls2.BusyIndicator{
        anchors.centerIn: homeContentLoader
        running: loadTimer.running
    }

    Controls2.TabBar{
        id: homeTabBar
        x: parent.x
        y: parent.y + statusBar.height
        z: statusBar.z
        width: parent.width
        height: statusBar.height

        Material.background: "#272d31"
        Material.accent: "#17be08"
        Material.foreground: "#838485"
        font.pointSize: 13

        Timer {
            id: loadTimer
            running: false
            interval: 600

            property var componentList: [
                "/component/HomeContent1.qml",
                "/component/HomeContent2.qml",
                "/component/HomeContent1.qml",
                "/component/HomeContent2.qml",
                "/component/HomeContent1.qml",
                "/component/HomeContent2.qml",
                "/component/HomeContent1.qml",
                "/component/HomeContent2.qml",
                "/component/HomeContent1.qml"
            ]
            onRunningChanged: {
                if(running == true)
                {
                    homeContentLoader.sourceComponent = Qt.createComponent(componentList[homeTabBar.currentIndex])
                }
            }
            onTriggered: {
                homeContentLoader.visible = true
            }
        }

        Controls2.TabButton{
            text: qsTr("推荐")
            onClicked: {
                loadTimer.running = true
                homeContentLoader.visible = false
            }
        }
        Controls2.TabButton{
            text: qsTr("电视剧")
            onClicked: {
                loadTimer.running = true
                homeContentLoader.visible = false
            }
        }
        Controls2.TabButton{
            text: qsTr("电影")
            onClicked: {
                loadTimer.running = true
                homeContentLoader.visible = false
            }
        }
        Controls2.TabButton{
            text: qsTr("动漫")
            onClicked: {
                loadTimer.running = true
                homeContentLoader.visible = false
            }
        }
        Controls2.TabButton{
            text: qsTr("综艺")
            onClicked: {
                loadTimer.running = true
                homeContentLoader.visible = false
            }
        }
        Controls2.TabButton{
            text: qsTr("搞笑")
            onClicked: {
                loadTimer.running = true
                homeContentLoader.visible = false
            }
        }
        Controls2.TabButton{
            text: qsTr("娱乐")
            onClicked: {
                loadTimer.running = true
                homeContentLoader.visible = false
            }
        }
        Controls2.TabButton{
            text: qsTr("儿童")
            onClicked: {
                loadTimer.running = true
                homeContentLoader.visible = false
            }
        }
        Controls2.TabButton{
            text: qsTr("资讯")
            onClicked: {
                loadTimer.running = true
                homeContentLoader.visible = false
            }
        }
    }

    Loader{
        id: homeContentLoader
        x: parent.x
        y: homeTabBar.y + homeTabBar.height
        width: parent.width
        height: parent.height - statusBar.height*2
        sourceComponent: Qt.createComponent("/component/HomeContent1.qml")
    }

    Component.onCompleted: {
    }
}

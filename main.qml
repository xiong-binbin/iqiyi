import QtQuick 2.8
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window {
    id: mainWindow
    visible: true
    width: defaultWidth
    height: defaultHeight
    color: "#1b2226"
    flags: Qt.FramelessWindowHint | Qt.Window
    property int defaultWidth: 1202
    property int defaultHeight: 900

    Canvas{
        anchors.fill: parent
        z: 200
        onPaint: {
            var ctx = getContext("2d");
            ctx.strokeStyle = "#1b2226"
            ctx.lineWidth = 2
            ctx.strokeRect(0,0,parent.width,parent.height);
            ctx.stroke();
        }
    }

    //-------------------------------标题栏--------------------------------------

    Rectangle{
        id: windowTitle
        x: 1
        y: 1
        z: 100
        width: parent.width - 2
        height: 30
        color: "#242528"
        property real pressX: 0
        property real pressY: 0

        Text{
            x: y
            y: (windowTitle.height-height)/2
            color: "white"
            text: "爱奇艺"
        }

        MouseArea{                    //窗口可移动
            anchors.fill: parent
            onPressed:{
                windowTitle.pressX = mouseX
                windowTitle.pressY = mouseY
            }
            onPositionChanged: {
                mainWindow.x = mouseX + mainWindow.x - windowTitle.pressX
                mainWindow.y = mouseY + mainWindow.y - windowTitle.pressY
            }
        }

        Button{
            id: closeButton
            width: 45
            height: parent.height
            x: parent.width - width
            y: 0
            z : parent.z + 1
            iconSource: "./ico/close.png"
            style: ButtonStyle{
                background: Rectangle{
                    color: control.hovered ? "#e81123" : "#242528"
                }
            }
            onClicked: Qt.quit()
        }

        Button{
            id: maxButton
            width: 45
            height: parent.height
            x: parent.width - 2*width
            y: 0
            z : parent.z + 1
            iconSource: mainWindow.height > defaultHeight ? "./ico/normal.png" : "./ico/max.png"
            style: ButtonStyle{
                background: Rectangle{
                    color: control.hovered ? "#05c900" : "#242528"
                }
            }
            onClicked: {
                if(mainWindow.height > defaultHeight)
                {
                    mainWindow.showNormal();
                }
                else
                {
                    mainWindow.showMaximized();
                }
            }
        }

        Button{
            id: minButton
            width: 45
            height: parent.height
            x: parent.width - 3*width
            y: 0
            z : parent.z + 1
            iconSource: "./ico/min.png"
            style: ButtonStyle{
                background: Rectangle{
                    color: control.hovered ? "#05c900" : "#242528"
                }
            }
            onClicked: mainWindow.showMinimized()
        }
    }

    //-------------------------------菜单栏--------------------------------------
    Loader{
        id: pageLoader
        x: menuBar.width + 1
        y: windowTitle.height + 1
        width: windowTitle.width - menuBar.width
        height: menuBar.height
        sourceComponent: Qt.createComponent("HomePage.qml")
    }

    Rectangle {
        id: menuBar
        z: windowTitle.z
        x: 1
        y: windowTitle.height + 1
        width: menuBar.minWidth
        height: mainWindow.height - windowTitle.height - 2
        color: "#333e46"
        property int minWidth: 52
        property int maxWidth: 220

        ExclusiveGroup{             //设置菜单按钮互斥
            id: menuButtonGroup
        }

        Button{
            id: menuButton
            x: 0
            y: 0
            width: menuBar.minWidth
            height: menuBar.minWidth
            style: ButtonStyle{
                background: Rectangle{
                    color: control.hovered ? "#1d8323" : "#333e46"
                    Image {
                        source: "./ico/menuBar/menu.scale-100.png"
                        scale: 0.8
                        x: (menuBar.minWidth - width)/2
                        y: (menuBar.minWidth - height)/2
                    }
                }
            }

            onClicked: menuBar.width = (menuBar.width == menuBar.minWidth ? menuBar.maxWidth : menuBar.minWidth)
        }

        Button{
            id: homeButton          //首页
            x: 0
            y: menuBar.minWidth
            width: menuBar.width
            height: menuBar.minWidth
            checkable: true
            checked: true
            exclusiveGroup: menuButtonGroup
            style: ButtonStyle{
                background: Rectangle{
                    color: control.checked ? "#1d8323" : "#333e46"
                    Image {
                        source: "./ico/menuBar/home.scale-100.png"
                        scale: 0.8
                        x: (menuBar.minWidth - width)/2
                        y: (menuBar.minWidth - height)/2
                    }
                    Text {
                        font.pointSize: 10
                        color: "white"
                        x: menuBar.minWidth+1
                        y: (menuBar.minWidth-height)/2
                        text: menuBar.width ==  menuBar.maxWidth ? qsTr("首页") : qsTr("")
                    }
                }
            }
            onClicked: {
                pageLoader.sourceComponent = Qt.createComponent("HomePage.qml")
            }
        }

        Button{
            id: channelButton       //频道
            x: 0
            y: menuBar.minWidth*2
            width: menuBar.width
            height: menuBar.minWidth
            checkable: true
            exclusiveGroup: menuButtonGroup
            style: ButtonStyle{
                background: Rectangle{
                    color: control.checked ? "#1d8323" : "#333e46"
                    Image {
                        source: "./ico/menuBar/channel.scale-100.png"
                        scale: 0.7
                        x: (menuBar.minWidth - width)/2
                        y: (menuBar.minWidth - height)/2
                    }
                    Text {
                        font.pointSize: 10
                        color: "white"
                        x: menuBar.minWidth+1
                        y: (menuBar.minWidth-height)/2
                        text: menuBar.width ==  menuBar.maxWidth ? qsTr("频道") : qsTr("")
                    }
                }
            }
        }

        Button{
            id: subscribeButton     //订阅
            x: 0
            y: menuBar.minWidth*3
            width: menuBar.width
            height: menuBar.minWidth
            checkable: true
            exclusiveGroup: menuButtonGroup
            style: ButtonStyle{
                background: Rectangle{
                    color: control.checked ? "#1d8323" : "#333e46"
                    Image {
                        source: "./ico/menuBar/subscribe.scale-100.png"
                        scale: 0.7
                        x: (menuBar.minWidth - width)/2
                        y: (menuBar.minWidth - height)/2
                    }
                    Text {
                        font.pointSize: 10
                        color: "white"
                        x: menuBar.minWidth+1
                        y: (menuBar.minWidth-height)/2
                        text: menuBar.width ==  menuBar.maxWidth ? qsTr("订阅") : qsTr("")
                    }
                }
            }
        }

        Button{
            id: recordButton        //播放记录
            x: 0
            y: menuBar.minWidth*4
            width: menuBar.width
            height: menuBar.minWidth
            checkable: true
            exclusiveGroup: menuButtonGroup
            style: ButtonStyle{
                background: Rectangle{
                    color: control.checked ? "#1d8323" : "#333e46"
                    Image {
                        source: "./ico/menuBar/record.scale-100.png"
                        scale: 0.7
                        x: (menuBar.minWidth - width)/2
                        y: (menuBar.minWidth - height)/2
                    }
                    Text {
                        font.pointSize: 10
                        color: "white"
                        x: menuBar.minWidth+1
                        y: (menuBar.minWidth-height)/2
                        text: menuBar.width ==  menuBar.maxWidth ? qsTr("播放记录") : qsTr("")
                    }
                }
            }
        }

        Button{
            id: favorButton        //我的收藏
            x: 0
            y: menuBar.minWidth*5
            width: menuBar.width
            height: menuBar.minWidth
            checkable: true
            exclusiveGroup: menuButtonGroup
            style: ButtonStyle{
                background: Rectangle{
                    color: control.checked ? "#1d8323" : "#333e46"
                    Image {
                        source: "./ico/menuBar/favor.scale-100.png"
                        scale: 0.7
                        x: (menuBar.minWidth - width)/2
                        y: (menuBar.minWidth - height)/2
                    }
                    Text {
                        font.pointSize: 10
                        color: "white"
                        x: menuBar.minWidth+1
                        y: (menuBar.minWidth-height)/2
                        text: menuBar.width ==  menuBar.maxWidth ? qsTr("我的收藏") : qsTr("")
                    }
                }
            }
        }

        Button{
            id: downloadButton        //离线缓存
            x: 0
            y: menuBar.minWidth*6
            width: menuBar.width
            height: menuBar.minWidth
            checkable: true
            exclusiveGroup: menuButtonGroup
            style: ButtonStyle{
                background: Rectangle{
                    color: control.checked ? "#1d8323" : "#333e46"
                    Image {
                        source: "./ico/menuBar/download.scale-100.png"
                        scale: 0.7
                        x: (menuBar.minWidth - width)/2
                        y: (menuBar.minWidth - height)/2
                    }
                    Text {
                        font.pointSize: 10
                        color: "white"
                        x: menuBar.minWidth+1
                        y: (menuBar.minWidth-height)/2
                        text: menuBar.width ==  menuBar.maxWidth ? qsTr("离线缓存") : qsTr("")
                    }
                }
            }
        }

        Button{
            id: settingsButton        //------------设置--------------
            x: 0
            y: menuBar.height - height
            width: menuBar.width
            height: menuBar.minWidth
            checkable: true
            exclusiveGroup: menuButtonGroup
            style: ButtonStyle{
                background: Rectangle{
                    color: control.checked ? "#1d8323" : "#333e46"
                    Image {
                        source: "./ico/menuBar/settings.scale-100.png"
                        scale: 0.7
                        x: (menuBar.minWidth - width)/2
                        y: (menuBar.minWidth - height)/2
                    }
                    Text {
                        font.pointSize: 10
                        color: "white"
                        x: menuBar.minWidth+1
                        y: (menuBar.minWidth-height)/2
                        text: menuBar.width ==  menuBar.maxWidth ? qsTr("设置") : qsTr("")
                    }
                }
            }
        }

        Button{
            id: feedbackButton        //帮助与反馈
            x: 0
            y: menuBar.height - height*2
            width: menuBar.width
            height: menuBar.minWidth
            checkable: true
            exclusiveGroup: menuButtonGroup
            style: ButtonStyle{
                background: Rectangle{
                    color: control.checked ? "#1d8323" : "#333e46"
                    Image {
                        source: "./ico/menuBar/feedback.scale-100.png"
                        scale: 0.7
                        x: (menuBar.minWidth - width)/2
                        y: (menuBar.minWidth - height)/2
                    }
                    Text {
                        font.pointSize: 10
                        color: "white"
                        x: menuBar.minWidth+1
                        y: (menuBar.minWidth-height)/2
                        text: menuBar.width ==  menuBar.maxWidth ? qsTr("帮助与反馈") : qsTr("")
                    }
                }
            }
        }

        Button{
            id: centerButton        //个人中心
            x: 0
            y: menuBar.height - height*3
            width: menuBar.width
            height: menuBar.minWidth
            checkable: true
            exclusiveGroup: menuButtonGroup
            style: ButtonStyle{
                background: Rectangle{
                    color: control.checked ? "#1d8323" : "#333e46"
                    Image {
                        source: "./ico/menuBar/center.scale-100.png"
                        scale: 0.7
                        x: (menuBar.minWidth - width)/2
                        y: (menuBar.minWidth - height)/2
                    }
                    Text {
                        font.pointSize: 10
                        color: "white"
                        x: menuBar.minWidth+1
                        y: (menuBar.minWidth-height)/2
                        text: menuBar.width ==  menuBar.maxWidth ? qsTr("个人中心") : qsTr("")
                    }
                }
            }
        }

        Button{
            id: vipButton        //VIP会员
            x: 0
            y: menuBar.height - height*4
            width: menuBar.width
            height: menuBar.minWidth
            checkable: true
            exclusiveGroup: menuButtonGroup
            style: ButtonStyle{
                background: Rectangle{
                    color: control.checked ? "#1d8323" : "#333e46"
                    Image {
                        source: "./ico/menuBar/vip.scale-100.png"
                        scale: 0.7
                        x: (menuBar.minWidth - width)/2
                        y: (menuBar.minWidth - height)/2
                    }
                    Text {
                        font.pointSize: 10
                        color: "white"
                        x: menuBar.minWidth+1
                        y: (menuBar.minWidth-height)/2
                        text: menuBar.width ==  menuBar.maxWidth ? qsTr("VIP会员") : qsTr("")
                    }
                }
            }
        }
    }
}

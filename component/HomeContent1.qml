import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2 as Controls2

Rectangle {
    id: homePage1
    color: "#1b2226"
    anchors.fill: parent

    Controls2.ScrollBar {
        id: vbar
        z: homePage1Content.z + 1
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        hoverEnabled: true
        active: hovered || pressed
        orientation: Qt.Vertical
        size: homePage1.height / homePage1Content.height
    }

    Item {
        id: homePage1Content
        y: - vbar.position*height
        width: parent.width
        height: viewPage.height + tvSerialPage.height + 53
        //--------------------------预览页---------------------------
        Rectangle {
            id: viewPage
            x: (parent.width - width)/2
            y: 18
            width: 686
            height: 320
            color: "#1b2226"

            Controls2.SwipeView {
                id: view

                currentIndex: indicator.currentIndex
                anchors.fill: parent

                Rectangle {
                    id: page0
                    color: "#1b2226"
                    Image {
                        source: "/ico/home/recommend/view1.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.scale = 0.95
                        onReleased: parent.scale = 1
                    }
                }

                Rectangle {
                    id: page1
                    color: "#1b2226"
                    Image {
                        source: "/ico/home/recommend/view2.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.scale = 0.95
                        onReleased: parent.scale = 1
                    }
                }
                Rectangle {
                    id: page2
                    color: "#1b2226"
                    Image {
                        source: "/ico/home/recommend/view3.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.scale = 0.95
                        onReleased: parent.scale = 1
                    }
                }
                Rectangle {
                    id: page3
                    color: "#1b2226"
                    Image {
                        source: "/ico/home/recommend/view4.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.scale = 0.95
                        onReleased: parent.scale = 1
                    }
                }
                Rectangle {
                    id: page4
                    color: "#1b2226"
                    Image {
                        source: "/ico/home/recommend/view1.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.scale = 0.95
                        onReleased: parent.scale = 1
                    }
                }
                Rectangle {
                    id: page5
                    color: "#1b2226"
                    Image {
                        source: "/ico/home/recommend/view2.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.scale = 0.95
                        onReleased: parent.scale = 1
                    }
                }
                Rectangle {
                    id: page6
                    color: "#1b2226"
                    Image {
                        source: "/ico/home/recommend/view3.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.scale = 0.95
                        onReleased: parent.scale = 1
                    }
                }
                Rectangle {
                    id: page7
                    color: "#1b2226"
                    Image {
                        source: "/ico/home/recommend/view4.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.scale = 0.95
                        onReleased: parent.scale = 1
                    }
                }
                Rectangle {
                    id: page8
                    color: "#1b2226"
                    Image {
                        source: "/ico/home/recommend/view1.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.scale = 0.95
                        onReleased: parent.scale = 1
                    }
                }
                Rectangle {
                    id: page9
                    color: "#1b2226"
                    Image {
                        source: "/ico/home/recommend/view2.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.scale = 0.95
                        onReleased: parent.scale = 1
                    }
                }
                Rectangle {
                    id: page10
                    color: "#1b2226"
                    Image {
                        source: "/ico/home/recommend/view3.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.scale = 0.95
                        onReleased: parent.scale = 1
                    }
                }
                Rectangle {
                    id: page11
                    color: "#1b2226"
                    Image {
                        source: "/ico/home/recommend/view4.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.scale = 0.95
                        onReleased: parent.scale = 1
                    }
                }
            }

            //自定义效果
            Controls2.PageIndicator {
                id: indicator
                interactive: true
                count: view.count
                currentIndex: 1
                anchors.bottom: view.bottom
                anchors.horizontalCenter: parent.horizontalCenter

                delegate: Rectangle {
                    implicitWidth: 9
                    implicitHeight: 9
                    radius: width / 2
                    color: index === indicator.currentIndex ? "#0bbe06" : "#333e46"
                }
            }


            Timer{
                interval: 3000;
                running: true;
                repeat: true
                onTriggered: {
                    if(indicator.currentIndex < indicator.count - 1)
                        indicator.currentIndex++;
                    else
                        indicator.currentIndex = 0;
                }
            }
        }

        //------------------------------电视剧-----------------------------------
        Rectangle {
            id: tvSerialPage
            x: parent.x
            y: viewPage.height + 35
            width: parent.width
            height: 530
            color: "#1b2226"

            Image {
                id: tvImage
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 8
                source: "/ico/home/recommend/tv-1.66.png"
            }

            Row {
                height: tvImage.height
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 54
                spacing: 8

                Text {
                    y: (tvImage.height - height)/2
                    text: qsTr("电视剧")
                    color: "#cccccc"
                    font.pixelSize: 22
                }

                Text {
                    y: (tvImage.height - height)/2
                    text: qsTr("神剧亮了/网络剧")
                    color: "#666666"
                    font.pixelSize: 16
                }

                Rectangle {
                    y: (tvImage.height - height)/2
                    width: moreTVText.x - x - 70
                    height: 0.1
                    color: "#272d31"
                }
            }

            Text {
                id: moreTVText
                y: (tvImage.height - height)/2
                anchors.right: moreTVImage.left
                text: qsTr("更多电视剧")
                color: "#666666"
                font.pixelSize: 16
            }

            Image {
                id: moreTVImage
                anchors.right: parent.right;
                anchors.rightMargin: 16;
                y: (tvImage.height - height)/2
                source: "/ico/home/recommend/more-0.85.png"
            }


            Image {
                id: mainTvSerial
                y: 66
                anchors.left: parent.left;
                anchors.leftMargin: 20;
                source: "/ico/home/recommend/TV_serial/TV_serial.png"
                Text {
                    anchors.top: parent.bottom
                    anchors.topMargin: 13
                    color: "#b9baba"
                    font.pointSize: 11
                    text: qsTr("亲爱的活祖宗")
                }
            }

            Grid {
                y: mainTvSerial.y
                anchors.left: mainTvSerial.right
                anchors.leftMargin: 20
                rows: 2
                columns: 8
                columnSpacing: 20
                rowSpacing: 57

                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_11.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("脱身")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_12.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("钟馗捉妖记")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_13.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("功夫之爱的快递")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_14.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("家有儿女初长成")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_15.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("蛮荒记")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_16.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("超级翁婿")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_17.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("太行赤子")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_18.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("玉魂")
                    }
                }

                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_21.png"
                    Text {
                        width: parent.width
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        wrapMode: Text.Wrap
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("为了你我愿意热爱整个世界")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_22.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("同学两亿岁")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_23.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("天涯女人心")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_24.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("如果，爱")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_25.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("走火")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_26.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("铁面御史")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_27.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("初婚")
                    }
                }
                Image {
                    source: "/ico/home/recommend/TV_serial/TV_serial_28.png"
                    Text {
                        anchors.top: parent.bottom
                        anchors.topMargin: 13
                        color: "#b9baba"
                        font.pointSize: 11
                        text: qsTr("归去来")
                    }
                }
            }
        }
    }

    Component.onCompleted: {
    }

}

// qt_quick_app.cpp — Qt6 Quick/QML GUI smoke test for Kan-Linux
// Build:  make build/qt_quick_app
// Run:    ./build/qt_quick_app [--seconds N]

#include <QGuiApplication>
#include <QQmlComponent>
#include <QQmlEngine>
#include <QQuickWindow>
#include <QTimer>
#include <QUrl>

#include <cstdio>
#include <cstring>

// Inline QML keeps the build free of moc/rcc/qrc steps.
static const char *kQml = R"QML(
import QtQuick

Window {
    id: root
    visible: true
    width: 480
    height: 360
    title: "Kan-Linux Qt Quick Test"
    color: "#12141c"

    property int clicks: 0

    Rectangle {
        id: ball
        width: 56; height: 56; radius: 28
        color: "#5aa2ff"
        x: parent.width / 2 - width / 2
        y: parent.height / 2 - height / 2

        SequentialAnimation on x {
            loops: Animation.Infinite
            NumberAnimation { to: root.width - ball.width; duration: 1600; easing.type: Easing.InOutQuad }
            NumberAnimation { to: 0; duration: 1600; easing.type: Easing.InOutQuad }
        }
        RotationAnimation on rotation {
            loops: Animation.Infinite
            from: 0; to: 360; duration: 3000
        }
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 16
        height: 120
        radius: 10
        color: "#1d2230"
        border.color: "#39415c"

        Text {
            id: label
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 14
            color: "#e6e9f2"
            font.pixelSize: 16
            text: "Qt Quick ready — QML animation and text rendering test"
        }

        Rectangle {
            id: hitButton
            width: 180; height: 42; radius: 8
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.margins: 14
            color: ma.pressed ? "#2f6bd8" : "#3c7ae8"

            Text {
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 15
                text: "Click me  (" + root.clicks + ")"
            }

            MouseArea {
                id: ma
                anchors.fill: parent
                onClicked: {
                    root.clicks += 1
                    label.text = "Button clicked " + root.clicks + " times | Qt Quick rendering OK"
                }
            }
        }
    }
}
)QML";

int main(int argc, char *argv[])
{
    int seconds = 0;
    for (int i = 1; i < argc; i++) {
        if (std::strcmp(argv[i], "--seconds") == 0 && i + 1 < argc)
            seconds = std::atoi(argv[++i]);
        else if (std::strcmp(argv[i], "--help") == 0) {
            std::printf("Usage: %s [--seconds N]\n", argv[0]);
            return 0;
        }
    }

    QGuiApplication app(argc, argv);

    std::printf("INFO: qt_quick_app starting (Qt %s, platform=%s)\n",
                qVersion(),
                qEnvironmentVariable("QT_QPA_PLATFORM", "auto").toUtf8().constData());

    QQmlEngine engine;
    QQmlComponent component(&engine);
    component.setData(kQml, QUrl(QStringLiteral("qrc:/kan_quick_demo.qml")));

    if (component.isError()) {
        const auto errors = component.errors();
        for (const QQmlError &e : errors)
            std::fprintf(stderr, "QML error: %s\n",
                         e.toString().toUtf8().constData());
        std::fprintf(stderr, "FAIL: qt_quick_app could not create QML scene\n");
        return 1;
    }

    QObject *obj = component.create();
    if (!obj) {
        const auto errors = component.errors();
        for (const QQmlError &e : errors)
            std::fprintf(stderr, "QML error: %s\n",
                         e.toString().toUtf8().constData());
        std::fprintf(stderr, "FAIL: qt_quick_app could not instantiate root object\n");
        return 1;
    }

    auto *window = qobject_cast<QQuickWindow *>(obj);
    if (!window) {
        std::fprintf(stderr, "FAIL: qt_quick_app root object is not a Window\n");
        delete obj;
        return 1;
    }
    window->show();

    if (seconds > 0) {
        QTimer::singleShot(seconds * 1000, &app, [&] {
            std::printf("OK: qt_quick_app auto-quit after timeout\n");
            app.quit();
        });
    }

    int rc = app.exec();
    if (rc == 0)
        std::printf("OK: qt_quick_app exited cleanly\n");
    return rc;
}

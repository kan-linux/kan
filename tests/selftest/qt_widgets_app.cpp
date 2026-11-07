// qt_widgets_app.cpp — Qt6 Widgets GUI smoke test for Kan-Linux
// Build:  make build/qt_widgets_app
// Run:    ./build/qt_widgets_app [--seconds N]

#include <QApplication>
#include <QFont>
#include <QHBoxLayout>
#include <QLabel>
#include <QMainWindow>
#include <QPainter>
#include <QPainterPath>
#include <QProgressBar>
#include <QPushButton>
#include <QSlider>
#include <QStatusBar>
#include <QTimer>
#include <QVBoxLayout>
#include <QWidget>

#include <cmath>
#include <cstdio>
#include <cstring>

class Canvas : public QWidget {
public:
    explicit Canvas(QWidget *parent = nullptr) : QWidget(parent) {}

    void setPhase(double phase)
    {
        m_phase = phase;
        update();
    }

protected:
    void paintEvent(QPaintEvent *) override
    {
        QPainter p(this);
        p.fillRect(rect(), QColor(18, 22, 34));

        p.setPen(QPen(QColor(80, 120, 220), 3));
        QPainterPath path;
        for (int x = 0; x <= width(); x += 3) {
            double y = height() / 2.0
                     + height() / 3.0 * std::sin(x / 22.0 + m_phase);
            if (x == 0)
                path.moveTo(x, y);
            else
                path.lineTo(x, y);
        }
        p.drawPath(path);

        double cx = width()  / 2.0 + width()  / 3.2 * std::sin(m_phase * 1.3);
        double cy = height() / 2.0 + height() / 3.2 * std::cos(m_phase * 0.9);
        double r  = std::min(width(), height()) / 9.0;
        p.setBrush(QColor(120, 200, 160));
        p.setPen(Qt::NoPen);
        p.drawEllipse(QPointF(cx, cy), r, r);

        p.setPen(QColor(200, 205, 215));
        p.drawRect(rect().adjusted(1, 1, -2, -2));
    }

private:
    double m_phase = 0.0;
};

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

    QApplication app(argc, argv);

    std::printf("INFO: qt_widgets_app starting (Qt %s, platform=%s)\n",
                qVersion(),
                qEnvironmentVariable("QT_QPA_PLATFORM", "auto").toUtf8().constData());

    QMainWindow window;
    window.setWindowTitle(QStringLiteral("Kan-Linux Qt Widgets Test"));
    window.resize(520, 420);

    auto *central = new QWidget(&window);
    auto *vbox    = new QVBoxLayout(central);
    vbox->setSpacing(10);

    auto *status = new QLabel(
        QStringLiteral("Qt Widgets ready — widget and custom-paint test"), central);
    status->setWordWrap(true);
    vbox->addWidget(status);

    auto *row = new QHBoxLayout;
    auto *button = new QPushButton(QStringLiteral("Click me"), central);
    auto *slider = new QSlider(Qt::Horizontal, central);
    slider->setRange(0, 100);
    slider->setValue(35);
    row->addWidget(button);
    row->addWidget(slider);
    vbox->addLayout(row);

    auto *bar = new QProgressBar(central);
    bar->setRange(0, 100);
    vbox->addWidget(bar);

    auto *canvas = new Canvas(central);
    canvas->setMinimumHeight(180);
    vbox->addWidget(canvas, 1);

    window.setCentralWidget(central);
    window.statusBar()->showMessage(QStringLiteral("Kan-Linux Qt6 running normally"));

    int clicks = 0;
    QObject::connect(button, &QPushButton::clicked, [&] {
        clicks++;
        status->setText(QStringLiteral("Button clicked %1 times | Qt %2 | slider value %3")
                            .arg(clicks)
                            .arg(QLatin1String(qVersion()))
                            .arg(slider->value()));
    });

    double phase = 0.0;
    auto *timer = new QTimer(&window);
    QObject::connect(timer, &QTimer::timeout, [&] {
        phase += 0.06;
        canvas->setPhase(phase);
        bar->setValue(int(50 + 50 * std::sin(phase)));
    });
    timer->start(16);

    if (seconds > 0) {
        QTimer::singleShot(seconds * 1000, &app, [&] {
            std::printf("OK: qt_widgets_app auto-quit after timeout\n");
            app.quit();
        });
    }

    window.show();
    int rc = app.exec();
    if (rc == 0)
        std::printf("OK: qt_widgets_app exited cleanly\n");
    return rc;
}

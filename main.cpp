#include <QGuiApplication>
#include <QQuickView>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine StackViewEngine;
    StackViewEngine.load(QUrl(QLatin1String("qrc:/StackViewExample.qml")));
    if (StackViewEngine.rootObjects().isEmpty())
        return -1;

    QQmlApplicationEngine StackLayoutEngine;
    StackLayoutEngine.load(QUrl(QLatin1String("qrc:/StackLayoutExample.qml")));
    if (StackLayoutEngine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

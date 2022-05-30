#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "addressbookviewmodel.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    AddressBookViewModel viewModel;
    engine.rootContext()->setContextProperty("viewModel", &viewModel);


    const QUrl url(u"qrc:/AddressBook/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

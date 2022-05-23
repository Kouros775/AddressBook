#ifndef ADDRESSBOOKVIEWMODEL_H
#define ADDRESSBOOKVIEWMODEL_H

#include <QObject>

class AddressBookViewModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString displayMsg
               READ getDisplayMsg
               NOTIFY displayMsgChanged)
public:
    explicit AddressBookViewModel(QObject *parent = nullptr);
    Q_INVOKABLE void selectRow(int iPos);

    QString getDisplayMsg();

signals:
    void displayMsgChanged();


protected:
    int m_selectedPos = -1;
};

#endif // ADDRESSBOOKVIEWMODEL_H

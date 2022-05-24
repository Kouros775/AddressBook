#ifndef ADDRESSBOOKLISTMODEL_H
#define ADDRESSBOOKLISTMODEL_H

#include <QAbstractListModel>


struct ADDRESS_BOOK_ITEM
{
    ADDRESS_BOOK_ITEM(const QString& name, const int& age, const QString& phone)
        : Name(name)
        , Age(age)
        , PhoneNumber(phone)
    {
    }

    QString Name;
    int Age;
    QString PhoneNumber;
};


class AddressBookListModel : public QAbstractListModel
{
    //enum ColumnNames
    //{
    //    name = Qt::UserRole,
    //    age,
    //    phoneNumber
    //};


    Q_OBJECT
public:
    explicit AddressBookListModel(QObject *parent = nullptr);

    //virtual int rowCount(const QModelIndex & = QModelIndex()) const override;
    //virtual QVariant data(const QModelIndex& index, int nRole) const override;

protected:
    //virtual QHash<int, QByteArray> roleNames() const override;
    //QHash<int, QByteArray> m_columnNames;

protected:
    QList<ADDRESS_BOOK_ITEM>* m_pAddressBookList;
};

#endif // ADDRESSBOOKLISTMODEL_H

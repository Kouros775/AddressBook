#ifndef ADDRESSBOOKLISTMODEL_H
#define ADDRESSBOOKLISTMODEL_H

#include <QAbstractListModel>


struct ADDRESS_BOOK_ITEM
{
    QString Name;
    int Age;
    QString Phone;
};


class AddressBookListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit AddressBookListModel(QAbstractListModel *parent = nullptr);
    virtual ~AddressBookListModel();

    enum class ColumnNames{
        NameRole = Qt::UserRole,
        AgeRole,
        PhoneRole
    };
    Q_ENUM(ColumnNames)

    virtual bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;
    virtual QVariant data(const QModelIndex& index, int nRole) const override;
    virtual int rowCount(const QModelIndex& parent = QModelIndex()) const override;

protected:
    virtual QHash<int, QByteArray> roleNames() const override;

private:
    QList<ADDRESS_BOOK_ITEM> m_pAddressBookList;
};

#endif // ADDRESSBOOKLISTMODEL_H

#include "addressbooklistmodel.h"
#include <QDebug>


AddressBookListModel::AddressBookListModel(QAbstractListModel *parent)
    : QAbstractListModel{parent}
{
}


AddressBookListModel::~AddressBookListModel()
{
}

bool AddressBookListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    bool result = false;

    if (!hasIndex(index.row(), index.column(), index.parent()) || !value.isValid())
    {
        result = false;
    }
    else
    {
        //ADDRESS_BOOK_ITEM &item = m_pAddressBookList[index.row()];
       ADDRESS_BOOK_ITEM item;

        if (role == (int)ColumnNames::NameRole)
        {
            item.Name = value.value<QString>();
        }
        else if((int)ColumnNames::AgeRole == role)
        {
            item.Age = value.value<int>();
        }
        else if((int)ColumnNames::PhoneRole == role)
        {
            item.Phone = value.value<QString>();
        }
        else
        {
            qDebug() << "setData parameter(role) is incorrect.";
            return false;
        }

        emit dataChanged(index, index, { role } );

        result = true;
    }


    return result;
}


int AddressBookListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);

    return m_pAddressBookList.size();
}

QVariant AddressBookListModel::data(const QModelIndex &index, int nRole) const
{
    int nRow = index.row();
    if(nRow < 0)
        return QVariant();

    ADDRESS_BOOK_ITEM item = m_pAddressBookList.at(index.row());

    switch((ColumnNames)nRole)
    {
    case ColumnNames::NameRole:
        return item.Name;
    case ColumnNames::AgeRole:
        return item.Age;
    case ColumnNames::PhoneRole:
        return item.Phone;
    default:
        return QVariant();
    }
}


QHash<int, QByteArray> AddressBookListModel::roleNames() const
{
    QHash<int, QByteArray> roleNames;

    roleNames[(int)ColumnNames::NameRole] = "Name";
    roleNames[(int)ColumnNames::AgeRole] = "Age";
    roleNames[(int)ColumnNames::PhoneRole] = "Phone";

    return roleNames;
}

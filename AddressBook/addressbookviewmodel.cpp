#include "addressbookviewmodel.h"
#include <QDebug>


AddressBookViewModel::AddressBookViewModel(QObject *parent)
    : QObject{parent}
    , selectedIndex{-1}
{
    addressBookListModel.addItem();
}

AddressBookViewModel::~AddressBookViewModel()
{
}

void AddressBookViewModel::setSelectedIndex(const int &param)
{
    selectedIndex = param;
    emit signalChangedSelectedIndex();
}


void AddressBookViewModel::addAddressBookItem()
{
    addressBookListModel.addItem();
}


void AddressBookViewModel::removeAddressBookItem(const int &paramIndex)
{
    addressBookListModel.deleteItem(paramIndex);
}


QVariantMap AddressBookViewModel::getAddressBookItem(const int &paramIndex) const
{
    return addressBookListModel.getItem(paramIndex);
}

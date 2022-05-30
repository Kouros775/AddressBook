#include "addressbookviewmodel.h"
#include <QDebug>


AddressBookViewModel::AddressBookViewModel(QObject *parent)
    : QObject{parent}
    , selectedIndex{-1}
{
    addressBookListModel.addData();
}

AddressBookViewModel::~AddressBookViewModel()
{
}

void AddressBookViewModel::setSelectedIndex(const int &param)
{
    selectedIndex = param;
    emit signalChangedSelectedIndex();
}

bool AddressBookViewModel::addAddressBookItem()
{
    addressBookListModel.addData();
}

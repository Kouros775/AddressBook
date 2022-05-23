#include "addressbookviewmodel.h"
#include <QDebug>


AddressBookViewModel::AddressBookViewModel(QObject *parent)
    : QObject{parent}
{

}

void AddressBookViewModel::selectRow(int iPos)
{
    m_selectedPos = iPos;
    emit displayMsgChanged();
}

QString AddressBookViewModel::getDisplayMsg()
{
    QString retStr = &"Selected Index : " [  m_selectedPos];
    qDebug() << m_selectedPos;
    return retStr;
}

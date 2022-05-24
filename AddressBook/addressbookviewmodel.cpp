#include "addressbookviewmodel.h"
#include <QDebug>


AddressBookViewModel::AddressBookViewModel(QObject *parent)
    : QObject{parent}
{

}

void AddressBookViewModel::selectRow(int iPos)
{
    qDebug() << __FUNCTION__;
    m_selectedPos = iPos;
    emit displayMsgChanged();
}

QString AddressBookViewModel::getDisplayMsg()
{
    qDebug() << __FUNCTION__ <<" : " << m_selectedPos;
    QString retStr = "Selected Index : " + QString::number(m_selectedPos);
    return retStr;
}

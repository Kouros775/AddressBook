#ifndef ADDRESSBOOKVIEWMODEL_H
#define ADDRESSBOOKVIEWMODEL_H

#include <QObject>
#include "addressbooklistmodel.h"


class AddressBookViewModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int SelectedIndex
               READ getSelectedIndex
               WRITE setSelectedIndex
               NOTIFY signalChangedSelectedIndex)
public:
    explicit AddressBookViewModel(QObject *parent = nullptr);
    virtual ~AddressBookViewModel();

    Q_INVOKABLE AddressBookListModel* getListModel() { return & addressBookListModel;}

    void setSelectedIndex(const int& param);
    int getSelectedIndex() const { return this->selectedIndex; }

    Q_INVOKABLE void addAddressBookItem();
    Q_INVOKABLE void removeAddressBookItem(const int& paramIndex);
    Q_INVOKABLE QVariantMap getAddressBookItem(const int& paramIndex) const;

signals:
    void signalChangedSelectedIndex();

private:
    int selectedIndex;
    AddressBookListModel addressBookListModel;
};

#endif // ADDRESSBOOKVIEWMODEL_H

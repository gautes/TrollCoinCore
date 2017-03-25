// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef TROLLCOIN_QT_TROLLCOINADDRESSVALIDATOR_H
#define TROLLCOIN_QT_TROLLCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class TrollcoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit TrollcoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Trollcoin address widget validator, checks for a valid trollcoin address.
 */
class TrollcoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit TrollcoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // TROLLCOIN_QT_TROLLCOINADDRESSVALIDATOR_H

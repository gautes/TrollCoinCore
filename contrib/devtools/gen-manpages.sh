#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

TROLLCOIND=${TROLLCOIND:-$SRCDIR/trollcoind}
TROLLCOINCLI=${TROLLCOINCLI:-$SRCDIR/trollcoin-cli}
TROLLCOINTX=${TROLLCOINTX:-$SRCDIR/trollcoin-tx}
TROLLCOINQT=${TROLLCOINQT:-$SRCDIR/qt/trollcoin-qt}

[ ! -x $TROLLCOIND ] && echo "$TROLLCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
TRCVER=($($TROLLCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for trollcoind if --version-string is not set,
# but has different outcomes for trollcoin-qt and trollcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$TROLLCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $TROLLCOIND $TROLLCOINCLI $TROLLCOINTX $TROLLCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${TRCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${TRCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m

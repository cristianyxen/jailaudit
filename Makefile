# New ports collection makefile for:   jailaudit
# Date created:        17 October 2005
# Whom:                cryx
#

PORTNAME=       jailaudit
PORTVERSION=    1.1
CATEGORIES=     security
MASTER_SITES=   http://outpost.h3q.com/software/jailaudit/

MAINTAINER=     cryx-ports@h3q.com
COMMENT=        Generate portaudit reports for jails from the hostsystem

USE_BZIP2=      yes

PERIODICDIR?=   ${PREFIX}/etc/periodic
REPORTDIR?=     ${PREFIX}/jailaudit/reports
TMPDIR?=        ${PREFIX}/jailaudit/tmp

PLIST_SUB+=     PERIODICDIR="${PERIODICDIR:S,^${PREFIX}/,,}" \
                REPORTDIR="${REPOTDIR}" \
                TMPDIR="${TMPDIR}"

.include <bsd.port.pre.mk>

.if ( ${OSVERSION} < 501000 )
IGNORE= The jls utility was added in FreeBSD 5.1.
.endif

RUN_DEPENDS=    ${LOCALBASE}/sbin/portaudit:${PORTSDIR}/security/portaudit

post-install:
        @if [ ! -f ${PREFIX}/etc/jailaudit.conf ]; then \
                ${CP} -p ${PREFIX}/etc/jailaudit.conf.sample ${PREFIX}/etc/jailaudit.conf ; \
        fi

.include <bsd.port.post.mk>


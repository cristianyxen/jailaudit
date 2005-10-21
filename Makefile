all:

install:
	mkdir -p ${PREFIX}/jailaudit/reports ${PREFIX}/jailaudit/tmp
	install -o root -g wheel -m 644 jailaudit.conf.sample ${PREFIX}/etc/
	install -o root -g wheel 410.jailaudit ${PREFIX}/etc/periodic/security/
	install -o root -g wheel jailaudit ${PREFIX}/bin/

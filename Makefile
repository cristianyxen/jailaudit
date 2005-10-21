all:

install:
	mkdir -p ${PREFIX}/jailaudit/reports ${PREFIX}/jailaudit/tmp
	cp -p jailaudit.conf.sample ${PREFIX}/etc
	cp -p 410.jailaudit ${PREFIX}/etc/periodic/security
	cp -p jailaudit ${PREFIX}/bin
	chmod +x ${PREFIX}/bin/jailaudit

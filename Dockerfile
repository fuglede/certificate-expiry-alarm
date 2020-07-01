FROM alpine
COPY . .
RUN apk --update add openssl gettext ssmtp
CMD envsubst < ssmtp.conf.tmpl > /etc/ssmtp/ssmtp.conf &&\
    envsubst < check.sh.tmpl | sed -e 's/§/$/g' > /etc/periodic/daily/check &&\
    chmod a+x /etc/periodic/daily/check &&\
    /usr/sbin/crond -f -l 8

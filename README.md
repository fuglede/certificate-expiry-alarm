# Certificate expiry alarms

This Docker image allows you to run checks on whether the SSL certificates provided by a given collection of hostnames are about to expire, and send alarms to a given email address.

It is intended for use in situations where Docker is available, but fine-grained control of the host system is not, where it is not possible to automate certificate renewal (a la Let's Encrypt), and where one has an authentication-free SMTP server available.


# Usage

For example, to check if the certificates hosted by `d1.example.com` and `d2.example.com` will expire within 60 days, you can do something like

```
docker run -e FROMEMAIL=admin@example.com -e SMTPHOSTNAME=mail.example.com -e HOSTNAMES=d1.example.com\ d2.example.com -e SECONDSTOEXPIRY=5184000 -e FROMNAME=Admin -e RECIPIENTS=user@exapmle.com -d fuglede/certificate-expiry-alarm
```

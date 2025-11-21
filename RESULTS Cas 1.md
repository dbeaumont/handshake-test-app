# Cas 1

## Configuration

script :
- generate-certs-cas1.sh

exécution :
- make certs
- make down rebuild up

system cacert : ajout de root-ca.crt
- Handshake Root CA

client-truststore :
- api-server-local
- handshake-interne
- handshake-root-ca

server keystore - chaine de certificats:
- Handshake Root CA
- Handshake Intermediate CA
- api-server

## Tests

Exécution depuis localhost
```bash
*[develop][~/Dev/handshake-test-app]$ curl http://localhost:8080/api/forward
hello world%
```

Exécution depuis le container api-client :
```bash
$ curl https://api-server:8443/api/hello
hello world# 
```

Exécution depuis le container api-client :
```bash
$ openssl s_client -connect "api-server:8443" -showcerts -servername "api-server"

CONNECTED(00000003)
depth=2 C = FR, O = Handshake, CN = Handshake Root CA
verify return:1
depth=1 C = FR, O = Handshake, CN = Handshake Intermediate CA
verify return:1
depth=0 C = FR, L = Paris, O = Handshake, OU = Dev, CN = api-server
verify return:1
---
Certificate chain
 0 s:C = FR, L = Paris, O = Handshake, OU = Dev, CN = api-server
   i:C = FR, O = Handshake, CN = Handshake Intermediate CA
   a:PKEY: rsaEncryption, 4096 (bit); sigalg: RSA-SHA384
   v:NotBefore: Nov 21 08:47:31 2025 GMT; NotAfter: Nov  9 08:47:31 2075 GMT
-----BEGIN CERTIFICATE-----
MIIFpjCCA46gAwIBAgIJAIZMLB4p8E66MA0GCSqGSIb3DQEBDAUAMEUxCzAJBgNV
BAYTAkZSMRIwEAYDVQQKEwlIYW5kc2hha2UxIjAgBgNVBAMTGUhhbmRzaGFrZSBJ
bnRlcm1lZGlhdGUgQ0EwIBcNMjUxMTIxMDg0NzMxWhgPMjA3NTExMDkwODQ3MzFa
MFQxCzAJBgNVBAYTAkZSMQ4wDAYDVQQHEwVQYXJpczESMBAGA1UEChMJSGFuZHNo
YWtlMQwwCgYDVQQLEwNEZXYxEzARBgNVBAMTCmFwaS1zZXJ2ZXIwggIiMA0GCSqG
SIb3DQEBAQUAA4ICDwAwggIKAoICAQC4N1xQKCxjbENmE8zSJQc2YJUFm6enCzTR
d1tWupi5WDCTfaZRCKk4Nxuu2FunXM1XKkinlNAQx4jOiKFUGc9As4WRJGFnVSR/
hM99iEAoqV3Cx4paqOOH/zEOk/eYp6RfikzALKuGc5qCbKRIFs3swUXsk6whyCPe
sls5YbYoM0BkIBADyVm6GrH15Wpc4NYmsztfCcsRW7oUIYCDquISwxZ0Xguwxqkm
iZ+srDgeMxpik5z7LJJY/Qk+WyVjWhInxFvnMhY02vpze9LgyqAIw5AwQ2fTHKEH
nSIqpYQVUCydCgpXpto3RwbbxOg7pC/dSc7O0zTBkD8CEdmX9H6E7EDZ9dnGX+P1
JrxcCMt9SbmhgTM8/pk+v4yHqmInJLFWttA8iuQ8YIeSCw+EqtokBgKRQQnDifu3
h45MP5t4/bCEoPGM0NyNs+1HHtIfoC4QbVz8bYOqVbUJdmSMmD0jlzFCQNUn2Ohy
C3YTRx8kNvXcaRh2TP6qgJOxFyB+jtIWipfJ/8OXA+UWrdYkunKsNQfBvQPWC06Y
HoW1tXXTMZxi/e0VLN5zh/6TH4EobL3bK/8AJ3gph/gssx9mYo5GbFd6e+TX2eig
xJr8TAHGTeWSC2LGByyayPKOLzzx3b2o/nKZlL7sBsM/sSi+nXMDuAPqs/MMES2q
vZSgkvD56QIDAQABo4GHMIGEMB0GA1UdDgQWBBR6h+9bfCBtHW0gVMdKP2PxDjdJ
4zALBgNVHQ8EBAMCBaAwIAYDVR0RBBkwF4IKYXBpLXNlcnZlcoIJbG9jYWxob3N0
MB8GA1UdIwQYMBaAFPnhEyJnwYZPWhDHVnACTLPfzc31MBMGA1UdJQQMMAoGCCsG
AQUFBwMBMA0GCSqGSIb3DQEBDAUAA4ICAQBg6fcIoZJRJzJiqJnMINak5eLgbSxm
SOCkEMSW0KiKGDusY6QPeFsjAfddo68qOwjPbpCvMgjx2XxQJyHDJ8eX6k/5MDBb
gszbxKnokn+sLkm8b5EqI5gcsz7TBiCG5ie73MXTxwQKBzQENrJMc4oV5WNZdkmH
5SyD1LqPtmAx6sijeebLxfpErqptwTtuQj67NJRXtMWpWmBa1NFDosH5Nna/qG5b
XrITwcuoQQiAclpnos1w+fHoVnKfIH5piRV4q7KBncmbSsrGaJDJd2kUZcbcsH1v
K13E7gqxX+3WbB7kD/VD+JBrf0qxiZwiBxxZhhfuKXgOikuGokxgj2rRWGnGmnBO
/KhsrRfS1qvnYYpyGcjojiUDUYeFHF9k5bFRon82i6haiXDVAsrudx6kEjxCppiK
BZQDIPJeCC7vuY5Qa/DTQ+bDWhqSAHie/b9Gh+K+7kaue3+Rnnej6L0Bzt1E19ue
q9kHlTzl3smx3HCbil8UDJiktbvpwPRwi+0MPqHGiAsEc8BA+xnRHe6Nj5oMMZHr
uM/ySGxaK+H2jeJo7Ry8XR4FYPvAAFqBGnT2BJtYfNNip1tGr0YqWh/sFD8VKhjE
DcmsomSnVtiEfdL7MX30bpE4najIncpwXVpaODajpsIu8OUFfdez4jYNoJxmoV0I
9CXI/zYDIDNdLQ==
-----END CERTIFICATE-----
 1 s:C = FR, O = Handshake, CN = Handshake Intermediate CA
   i:C = FR, O = Handshake, CN = Handshake Root CA
   a:PKEY: rsaEncryption, 4096 (bit); sigalg: RSA-SHA384
   v:NotBefore: Nov 21 08:47:29 2025 GMT; NotAfter: Nov  9 08:47:29 2075 GMT
-----BEGIN CERTIFICATE-----
MIIFbDCCA1SgAwIBAgIIXgdQb79YbEQwDQYJKoZIhvcNAQEMBQAwPTELMAkGA1UE
BhMCRlIxEjAQBgNVBAoTCUhhbmRzaGFrZTEaMBgGA1UEAxMRSGFuZHNoYWtlIFJv
b3QgQ0EwIBcNMjUxMTIxMDg0NzI5WhgPMjA3NTExMDkwODQ3MjlaMEUxCzAJBgNV
BAYTAkZSMRIwEAYDVQQKEwlIYW5kc2hha2UxIjAgBgNVBAMTGUhhbmRzaGFrZSBJ
bnRlcm1lZGlhdGUgQ0EwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCo
XM6pDlEr2nx5PPsvX9kGXb5nZO0SgMo2O6LdC3AEPtdi+Yfnc2EfAJ1R+omSZXGa
983IB15WmIvTsxjPAT6VaYwYIc/t5a+wBn+non+Hx0em2XO6t1Rbm0WALwxukINs
iNUksjfJc9ErAxoCVqdPvyRkbugOc6nGyDckPfDrmWLQ9s83TaeiweUYh9lSdN6e
pWjnt87q9UkqbakcxWyw1avyACCijEdp4Dc3VxavbVXS+p0Djkp15WAwQ1lVrGNa
esgPSXkNucr/rFMHMrcYrp15Y+ItsccLz/6iyMOkksCUkzs15jj7Uuqb35OkDJT1
msx6sDxqtnI+s3PU6wkSngLNgE7AnNj35SaWjVe+C4lnx5DnO8EAbItA2A0qDdyc
X6F+qdLCfWoF3MOJWHRKx6/XQpaSaM1sOFSa1SgnAmzY0TBPkpGjNTT+M0ekVVst
8yxvdnL7qN2go2iwDiwzc5aJfC6xvL06YPQmAtO0GJOyDv/p5qmBO6TfK/XZzGFp
FXMrGkMgVGITRFvo1yxeCmQCyywq1KkB42VcGATWhtclYk5mjmepPnYtIUQOsXJz
ou/1uyapektMAyHkeCIzijsbwi0nhmy8lLL0nMwXzlgk6J10RFlM0rPkoILR5wmz
8qIT2Ib6W9MAfSWzoyNdU/Q0liheXFu9pzK7jQMU1wIDAQABo2YwZDAdBgNVHQ4E
FgQU+eETImfBhk9aEMdWcAJMs9/NzfUwDgYDVR0PAQH/BAQDAgEGMBIGA1UdEwEB
/wQIMAYBAf8CAQAwHwYDVR0jBBgwFoAUnGZmE574rOljSzSTQUnV6C40P+MwDQYJ
KoZIhvcNAQEMBQADggIBABxIKbSk7oGWx11QDTMWl7EU+/YCAJ0Tc80lsB9kZnga
7N1TMq54eY8SwRI0zHLQtMS1u6SCiLFqFTeuxLO813yoSTgn6LaS207YyyE858LF
b1mHwoD8HD0E7QQPXrLgZ3/Jp2HMmFdk9J6e5nT7vYDfaKMgKBMjkoXMW2eFESHG
PMBt6v7TcZxgJePTwuQjGvZ/pMdmBLnHHuMrWJdY6sYXocyw/XLM7WtIdNuyE6cC
2tq0BEN04gE/a7ym7gd8y7r1q8lamAZ7X70EpkySIggTslRWh4XXyGSncRf/aEyY
RM5vvbxsK8NtWRS24C1hhAgWhUfwx2nShWyRcJ1YFlyHU6sD25yUxAGSynobyj3T
bLA1AHXfaIiTKN5PrkV7wTXOKbuplNN9l9YZpMvQtWeW0i5PPTvDAQS8Bkd5SFzk
nKAGSlZnDOj6aTmLHu5XgCpwDHk8HqVoUFOG3dcGpyjCgn7ir6bcpzca6jJ77jAs
rDFLcBISVjGbFVYkpl3lSYt2hDR3YSipW6/tZ31Ip34EIehmhhmNmu4QPq7/NJMq
R4VVxMopoHcORCX7XcNdcqbkjVO9evKM19W/sfkCGLILtd1Fjhtrundtu+EGB9lP
kYksF+pefnQ0JUFaYd3IXrkN9O9OY7RCXb4svNa/uoNWRKBFK595rz01aaO+ZP+2
-----END CERTIFICATE-----
 2 s:C = FR, O = Handshake, CN = Handshake Root CA
   i:C = FR, O = Handshake, CN = Handshake Root CA
   a:PKEY: rsaEncryption, 4096 (bit); sigalg: RSA-SHA384
   v:NotBefore: Nov 21 08:47:27 2025 GMT; NotAfter: Nov  9 08:47:27 2075 GMT
-----BEGIN CERTIFICATE-----
MIIFQDCCAyigAwIBAgIIW0JIE9tgoY0wDQYJKoZIhvcNAQEMBQAwPTELMAkGA1UE
BhMCRlIxEjAQBgNVBAoTCUhhbmRzaGFrZTEaMBgGA1UEAxMRSGFuZHNoYWtlIFJv
b3QgQ0EwIBcNMjUxMTIxMDg0NzI3WhgPMjA3NTExMDkwODQ3MjdaMD0xCzAJBgNV
BAYTAkZSMRIwEAYDVQQKEwlIYW5kc2hha2UxGjAYBgNVBAMTEUhhbmRzaGFrZSBS
b290IENBMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAtrg8q00gEpup
g8TjWK1zW7KgOGP7nj3BFWR1dnrmrmXL4UlVJhg+F2F5uUuCCIrqbCDFOUCK0SGX
cJ33YLG2qazhyHDPUGFvmWAUHz7pPCxlpkx8jW2Y534Rjuul0XIKgsvyV7tYbgwD
dUd7WZF6KWzgvG/WwrPFlXzFLvBmDc2VNjh42cl8ToFM01xEC8iwIxnHZSXrIkrf
P9upTOJfvujorjxzXbgGzNluD+Q6PrFng8c6J7Q9iCrtCSSL9UkloTdHMiCE7GmY
lwrtO3WF1z7PZGXabmqenaPUZzJNiUJCjEukrKpq1MkfxmLpofO5xwuwwTBwz3lh
XylvHhPMvn5xyp6BXmK3lvMyY5TaZw5q4u6l/c9vQLOlxKA5AbmP1UaIGhq7id6w
tcBfgLOZqLfrawWO5N0EoFHkNCyKJNYy/2WsU4GtlvDnP96HQGsW+fkRcigKADpN
D+EchZPkAqRjDANWdZu7dBT2YoORLoZdbewbO+BiJzqE4EWfClXtwf9uS3mRJbzb
jrjYiQpKgdYRhmLxRo3qxLgaD6/zJoonSnoG4tC5jXcF4vZ+fEKa5BmJv2qu7ZFN
CoFojM6MVGBQBxyW/XeO2aset+T5HHe1DTpHkmhMrJL7T6qb4CYnWd4yxuRJ/ts8
DjSy5HwIIcVfKQQr8/J7gPdkT7AdEhsCAwEAAaNCMEAwHQYDVR0OBBYEFJxmZhOe
+KzpY0s0k0FJ1eguND/jMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/
MA0GCSqGSIb3DQEBDAUAA4ICAQBm6d/iShqQ3UPgX/Uur58z/c6RUQmW3qznFMXF
Z0ZmfuW1DUp41bSKNLL964FWKsWs/w/W4NyhvL7z/KiAJN/jYCzGheJekWiBdTAF
21iCg0zCdqrp39iN4IFt2bsUkrAShFqZASm2UgiqD+6MTpBJLC6pXxy2xFPBqrUf
nA8ZVYswn3HSoWT5Z0iNFovClFLzb6xXNrbRE7wDTteOHv1LNnxeZ3DMKZ8viZ1i
e8PiO9IhUnqpco2fYIxVdUR55gabIU+7Bp3Sq+QBzEz240WbUZdRfLXwKq7Ie781
wPfUTmAHaezuMRDX+2ihHb+2VTXRq8b8R+HCox99iyw6PthDOYZhv+ubvXJh7LHg
PgNZJ9J9COP/wratC7xvSZGn1ovNJ9QvXaymCUAGrqcVrF/9vjzrKaWKota86Gjk
V1Mwm5RynO9IMaBpsKc0oLBRir2rQD95tieFiOP+OQPpJp0l7VG1sSEz4eZ77g8d
vF+0tLEiILg5ST4KcKOmvZDp72nSQGE/vObEK7qt73KnQRS+KtULlJ58u/LJJp9J
I7ILSRC/gOXtg6vZnvfyYc7ril9bzaoPD9bzfOox6ikP5tbHKY+ZSyK1OcW7o/9v
tHQpZBkIRZPQwhu8nu+mO+PQsZ8lnN0/xwbmnqUTQaqM8mTFnk11HXzf2Xav2vV7
k4xNiw==
-----END CERTIFICATE-----
---
Server certificate
subject=C = FR, L = Paris, O = Handshake, OU = Dev, CN = api-server
issuer=C = FR, O = Handshake, CN = Handshake Intermediate CA
---
No client certificate CA names sent
Peer signing digest: SHA256
Peer signature type: RSA-PSS
Server Temp Key: X25519, 253 bits
---
SSL handshake has read 4988 bytes and written 392 bytes
Verification: OK
---
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
Server public key is 4096 bit
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 0 (ok)
---
---
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_256_GCM_SHA384
    Session-ID: 453D60DA10728EA3932C2B27E2D45BB49B1B0249F3B1F93A7FED7D2392E280E4
    Session-ID-ctx: 
    Resumption PSK: 28479372660AA3E38B865B1E5C65ED8DCDCAC513050BFB3BEC1D009E174E68239603C5DCB3FCC4565DD04B7D9E286EB1
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 86400 (seconds)
    TLS session ticket:
    0000 - dc e5 5d 53 9a 88 20 d9-54 b5 c7 0b 9c 34 56 86   ..]S.. .T....4V.
    0010 - 1d 90 43 77 bc 53 29 30-12 e6 16 ff 04 ee 67 88   ..Cw.S)0......g.
    0020 - b3 5d cf cc 32 d4 60 21-14 26 01 dc da 52 17 0a   .]..2.`!.&...R..
    0030 - 0c 1c 2e cb 09 84 e8 ee-e7 ab 61 81 25 8b 68 ab   ..........a.%.h.
    0040 - f9 70 cc 1f a4 52 e5 9c-80 f3 a7 ce 8f ba 58 39   .p...R........X9
    0050 - 57 62 24 b0 74 02 59 18-8a 46 cc e5 44 d7 f0 63   Wb$.t.Y..F..D..c
    0060 - de 4b 80 95 ee 20 b2 ea-62 e3 4e 7c 82 9c 1a 52   .K... ..b.N|...R
    0070 - b6 e1 f6 ff 9e fb ff a6-6f 7c 22 4c b6 bc 9f e3   ........o|"L....
    0080 - 19 ba 03 09 ba bf 69 83-f5 71 af b2 bc 2d d7 73   ......i..q...-.s
    0090 - 66 be 20 2d cb 54 a6 2d-88 02 a6 83 c7 11 28 94   f. -.T.-......(.
    00a0 - 95 9a f1 bd 0c f7 73 b0-cd 3a 11 27 05 0e c2 a1   ......s..:.'....
    00b0 - 38 c9 ea a6 ba 1f c4 2d-f2 f8 cd c4 40 22 48 f0   8......-....@"H.
    00c0 - 38 13 65 4a f9 98 66 bb-8f f2 11 e5 54 37 ff 65   8.eJ..f.....T7.e
    00d0 - 07 b5 bc 85 d2 30 57 e9-ef 48 60 45 73 f3 1c 7f   .....0W..H`Es...
    00e0 - f1 cd 53 0b a1 05 11 95-1c b5 92 10 15 69 9b 57   ..S..........i.W
    00f0 - 9a 05 1c f1 33 c9 0c 0e-2e a7 55 77 5d e0 85 13   ....3.....Uw]...
    0100 - ef 97 05 77 84 3a cb 51-92 c1 a2 6f 7b ec 1f 64   ...w.:.Q...o{..d
    0110 - 87 c1 2f 70 ff 99 fb b8-bd a0 7a 5e 9a 46 62 92   ../p......z^.Fb.
    0120 - 42 54 5a 5b 1d 3a b4 72-96 52 5b 1b 5e 2a cf 2b   BTZ[.:.r.R[.^*.+
    0130 - 45 82 32 0e 86 de 33 41-40 d6 db d7 d6 95 cf 82   E.2...3A@.......
    0140 - 5a e2 b9 a6 d3 7e 0e be-fe 04 df 2f d6 1d 8a c6   Z....~...../....
    0150 - 67 aa d9 1c ca 21 ec 8d-56 e6 13 02 6e a1 09 1a   g....!..V...n...
    0160 - f1 7e 20 49 97 4c f2 bd-95 62 5a 14 fb 98 6a 1c   .~ I.L...bZ...j.
    0170 - 06 2d 58 0a c0 2a 80 47-54 0e e3 f4 2f 8f ac cc   .-X..*.GT.../...
    0180 - f7 96 ad 76 4e 0e 52 d8-c1 fc 65 dc c2 25 08 14   ...vN.R...e..%..
    0190 - df 3c 5c ee 8f 91 25 04-39 5a f4 f7 91 a6 3a 6c   .<\...%.9Z....:l
    01a0 - f9 b9 79 0d 4f 31 0d e1-8e 8d 53 63 c2 06 89 50   ..y.O1....Sc...P
    01b0 - d3 b0 fe 6a e6 6e c7 7d-39 30 47 39 a7 9a f2 c5   ...j.n.}90G9....
    01c0 - 71 3f 31 2b ad 3b 6f 43-b6 09 f7 cc 78 94 58 10   q?1+.;oC....x.X.
    01d0 - 38 78 d0 9b e0 64 5b 88-cc 94 9c 2b 8d 91 1f 67   8x...d[....+...g
    01e0 - 4b d2 54 cb 42 48 ff 77-8d a4 f4 c4 f3 b3 05 0e   K.T.BH.w........
    01f0 - a9 3b b0 a1 1b fe 68 f2-d2 8c b3 8c ab 1e d1 bc   .;....h.........
    0200 - 61 52 32 50 72 ae c9 8f-0e cd 24 44 a6 bc a8 e9   aR2Pr.....$D....
    0210 - 68 a3 01 1a d8 d1 38 7c-34 3a f0 1d 98 d5 bf c6   h.....8|4:......
    0220 - 03 74 d8 ee 5a 75 3f 38-60 47 cd c8 29 bf 58 1c   .t..Zu?8`G..).X.
    0230 - ba 23 64 e8 1b 54 21 5d-5e 47 4d b5 91 11 3e fb   .#d..T!]^GM...>.
    0240 - 93 56 36 de 41 9b e9 96-e7 5e c2 77 66 c8 1a eb   .V6.A....^.wf...
    0250 - 2d a0 e9 08 d0 2b 4f 02-a5 91 fe 61 ef 91 e9 9f   -....+O....a....
    0260 - 6f 5e a2 f9 d2 09 56 e5-25 84 35 8c 85 0f f6 8c   o^....V.%.5.....
    0270 - a1 59 d5 5b 63 49 ca 79-53 7e bb 51 68 15 d7 eb   .Y.[cI.yS~.Qh...
    0280 - 0e 41 36 49 82 3e 6b f7-75 e9 67 af 33 e7 94 93   .A6I.>k.u.g.3...
    0290 - 6b b9 93 00 00 7a 2b 16-ee 18 3c 34 da 6a 5a d2   k....z+...<4.jZ.
    02a0 - 69 84 69 ff 3b 88 d9 6f-0a 32 0e b3 ba 04 f0 30   i.i.;..o.2.....0
    02b0 - 57 00 70 d4 2b 21 94 ae-5e 71 04 6e dc ba ac 5b   W.p.+!..^q.n...[
    02c0 - b0 17 65 21 66 dd 58 f9-88 88 71 cc 09 a1 6f 69   ..e!f.X...q...oi
    02d0 - 8c 2c d4 fe e8 c2 75 60-93 8f dd 60 a2 44 97 d2   .,....u`...`.D..
    02e0 - 8f 40 47 0b 81 74 00 41-e6 aa 35 a4 4e 34 23 70   .@G..t.A..5.N4#p
    02f0 - f6 49 8a 98 75 e5 7a 61-a0 ff 2c 31 26 21 62 34   .I..u.za..,1&!b4
    0300 - 14 0d 55 bb e2 0c 0d 33-db b6 61 b0 a2 83 f5 e8   ..U....3..a.....
    0310 - ab 3d 38 65 f3 72 8a 46-56 a2 1e 21 42 09 57 fa   .=8e.r.FV..!B.W.
    0320 - 6e 85 5e 60 ea 45 13 f0-4f 93 fa 3b 0c 61 2d 95   n.^`.E..O..;.a-.
    0330 - 24 3e 2d de e7 61 1b 41-f6 ae 19 74 ee eb c5 47   $>-..a.A...t...G
    0340 - 99 28 ab 87 86 e2 49 9e-2f df 20 b9 27 e9 a2 3c   .(....I./. .'..<
    0350 - bd 85 94 c9 b4 8a b3 7f-9c c7 15 2a 19 b2 1e c3   ...........*....
    0360 - f3 28 1f 74 23 51 5c 42-7f eb bb f6 93 9b 81 38   .(.t#Q\B.......8
    0370 - b3 c0 75 94 85 61 50 8b-d3 f9 3f db 8b 27 db dc   ..u..aP...?..'..
    0380 - fb 1c d1 ff 82 12 ee 56-28 da e3 f6 2a 77 b1 f7   .......V(...*w..
    0390 - 15 2b cf 72 2c a0 26 e3-d2 02 bb 2f e4 9f c7 09   .+.r,.&..../....
    03a0 - b7 e6 14 96 a7 cf 92 23-cd 2a 98 17 52 53 84 ac   .......#.*..RS..
    03b0 - 58 38 51 3a 26 17 4a 7d-65 9e ee ac 2c d5 9d 4c   X8Q:&.J}e...,..L
    03c0 - e8 6e 01 f2 39 b6 71 9c-44 79 ec 01 73 ef ed cc   .n..9.q.Dy..s...
    03d0 - 90 eb 93 b0 ff a6 aa 7f-60 55 51 fd 4e 01 ed 8a   ........`UQ.N...
    03e0 - 1c 75 13 24 e9 ab da fc-9e 22 8e c6 07 97 03 68   .u.$.....".....h
    03f0 - 43 48 91 8a 64 15 20 b6-72 19 a5 df 83 dc ee df   CH..d. .r.......
    0400 - bc b0 a7 7e 0d e7 46 f8-f2 63 f3 be d0 7c 36 0f   ...~..F..c...|6.
    0410 - 69 b7 19 ea 72 2f 20 14-38 ba c5 66 89 a7 43 e0   i...r/ .8..f..C.
    0420 - 05 e1 0f 0f 67 e6 8f 7d-af 12 38 f6 91 16 4d 73   ....g..}..8...Ms
    0430 - ed 19 66 23 27 6b 1e 31-74 eb 6c 16 1d f3 31 14   ..f#'k.1t.l...1.
    0440 - 9c 82 60 0c 6c 1c 26 f1-af f4 fa 46 c8 7b 75 f0   ..`.l.&....F.{u.
    0450 - 8c 95 be b8 c5 b3 24 6c-9e 02 49 2b 07 d7 70 d8   ......$l..I+..p.
    0460 - 6e 6c 6b e7 8a 75 91 fe-f8 00 31 db 50 96 e6 3d   nlk..u....1.P..=
    0470 - 24 84 a6 b4 54 ea ce 48-98 9b 06 f9 04 a4 8f a2   $...T..H........
    0480 - 62 e8 a6 f6 cb fc 2f 19-80 28 96 fc 7a c0 0a 4a   b...../..(..z..J
    0490 - 61 03 92 90 64 67 14 a7-b5 1e 2d ac 2a 0b 9f ba   a...dg....-.*...
    04a0 - 7e 1b 0e 10 4a fa 61 f0-ea 7e 5d 98 78 a0 85 d2   ~...J.a..~].x...
    04b0 - 00 c9 9e 41 c2 23 20 4d-f2 31 c5 52 5b 28 d0 b6   ...A.# M.1.R[(..
    04c0 - 49 c4 83 a2 f9 65 05 38-9a 9b d3 ac 26 60 35 b4   I....e.8....&`5.
    04d0 - a3 76 1b f9 82 59 86 ab-dc 26 14 7e 92 a3 d7 de   .v...Y...&.~....
    04e0 - 57 96 eb d7 9b 79 01 f2-ce a1 63 13 b7 3a 98 f4   W....y....c..:..
    04f0 - 4d 6b ea 5a 07 4a 19 2f-4e 40 52 60 f6 0f 1d dd   Mk.Z.J./N@R`....
    0500 - 9f d6 c2 5b d9 73 3f bf-19 dd d9 67 20 8d e4 2c   ...[.s?....g ..,
    0510 - 7b fa fe 20 fa 1e a9 8b-d5 2e 54 92 42 d8 31 fd   {.. ......T.B.1.
    0520 - 68 df 30 82 64 0a f6 f3-c8 37 1b 68 89 fb 38 77   h.0.d....7.h..8w
    0530 - ef 71 f3 78 55 15 d5 62-62 ae 46 cd e5 c6 d2 c5   .q.xU..bb.F.....
    0540 - e1 17 6f e4 4a 8f d0 80-ac 9f ef 11 e5 7c b3 83   ..o.J........|..
    0550 - 00 94 cb 71 91 22 56 2f-6a 7f 9d 8c 54 28 03 54   ...q."V/j...T(.T
    0560 - f1 ba de 3e 97 46 90 11-73 ee e2 9e ce 0a 07 71   ...>.F..s......q
    0570 - b4 8f 49 cc a9 ee 11 fb-f7 65 24 1c 34 02 ba a4   ..I......e$.4...
    0580 - ef 05 71 8e d3 e2 7c f9-f9 b2 03 ad b7 0e 0b 00   ..q...|.........
    0590 - 61 8a 9b c2 cf 94 7d a2-cb d6 f4 54 e7 67 6a d3   a.....}....T.gj.
    05a0 - 8e 92 d6 53 fc ab b3 51-45 11 5a bd 9b 0c aa 18   ...S...QE.Z.....
    05b0 - c6 57 b7 bc 5a 9b 3c 31-8a 1f cf 97 a6 18 90 2c   .W..Z.<1.......,
    05c0 - d8 62 14 f8 a4 c8 25 1c-6c 77 a7 08 08 2f 7b 23   .b....%.lw.../{#
    05d0 - bf 14 41 f6 e6 c3 c4 aa-71 89 71 73 22 12 14 f1   ..A.....q.qs"...
    05e0 - 0a 1d 8f 89 78 59 e0 dc-71 91 64 89 47 c3 38 4c   ....xY..q.d.G.8L
    05f0 - a9 aa d3 2f f9 48 c0 65-cd dd c6 e1 d9 be ba ee   .../.H.e........
    0600 - 7c b9 02 26 c8 e6 b9 b5-59 69 83 c0 5f 0a b9 ec   |..&....Yi.._...
    0610 - dc e0 07 1a c1 0d e9 6d-e6 8b 96 fd d6 dd 1f 2a   .......m.......*
    0620 - 0c 24 11 65 9e 0f ea a7-76 4c 8d e6 9e 0b 2c e4   .$.e....vL....,.
    0630 - b9 e6 b4 23 e5 8e 8b e0-32 7e 23 16 1d d3 ca 3f   ...#....2~#....?
    0640 - 75 30 3f 13 2e 10 5b d4-7e ea 7c 77 63 2c 40 b1   u0?...[.~.|wc,@.
    0650 - 79 e6 16 bd 04 af 25 24-c8 59 53 e5 c0 43 6d ac   y.....%$.YS..Cm.
    0660 - be 31 aa 0b 36 47 2f bd-19 75 20 28 92 99 96 61   .1..6G/..u (...a
    0670 - 06 d0 fd f6 0b 05 d4 21-d1 af 6f 6e 8d c5 44 0f   .......!..on..D.
    0680 - 2c 80 bb 28 81 85 ab 9c-6a 6b 7f fc 1e e7 a6 da   ,..(....jk......
    0690 - c4 9c 52 0a 15 68 62 34-b7 82 af 66 be 94 41 00   ..R..hb4...f..A.
    06a0 - 50 d0 1b 06 4e cc 3f 8e-93 05 7d 88 44 47 78 d6   P...N.?...}.DGx.
    06b0 - bc ed b8 51 b7 dd 86 fb-eb 07 81 06 30 45 cf 03   ...Q........0E..
    06c0 - 36 3d 22 ac 57 fa 65 30-54 a7 32 25 63 8d 03 21   6=".W.e0T.2%c..!
    06d0 - fb 4f 29 bc de 24 25 7d-11 c6 b4 34 4a 59 d2 2c   .O)..$%}...4JY.,
    06e0 - 72 99 4b 4b d5 a2 81 7d-ba cc 06 a8 d9 09 b1 2e   r.KK...}........
    06f0 - a5 35 77 f9 e8 a4 61 ae-d3 34 b5 70 b8 b3 f5 1e   .5w...a..4.p....
    0700 - 89 8d 02 fb b6 85 10 57-b9 56 79 8d 28 81 dd 3f   .......W.Vy.(..?
    0710 - 00 6e fb 53 67 f5 b3 fa-75 4f 9f 6d a2 d0 5a 01   .n.Sg...uO.m..Z.
    0720 - 05 8b 14 4b 72 7b 85 54-49 92 da b4 f1 3f 71 a7   ...Kr{.TI....?q.
    0730 - 94 3b 1c 60 62 49 6b 21-80 0d 79 50 fe f6 96 75   .;.`bIk!..yP...u
    0740 - 29 87 87 7e 13 10 15 40-91 7e ba 98 8e fe bb d4   )..~...@.~......
    0750 - f0 d7 16 b6 5b bd 0e 62-a0 f5 5a b8 fc a4 4d a5   ....[..b..Z...M.
    0760 - 18 fc d7 b1 78 07 72 db-7f 3e 9d 36 56 d4 1d 57   ....x.r..>.6V..W
    0770 - 48 da 52 8b 5f 22 db ff-43 fd 82 ac 49 ac b4 d6   H.R._"..C...I...
    0780 - 47 38 9a 42 f4 2a c3 f5-12 05 87 91 ad 8b fa a8   G8.B.*..........
    0790 - e8 18 72 8e 92 f6 0a ca-38 3b 91 f6 15 96 68 b7   ..r.....8;....h.
    07a0 - e5 31 6e 04 87 44 6a 80-64 ce 6d ef e1 a4 3f 51   .1n..Dj.d.m...?Q
    07b0 - 48 16 b4 5e 42 75 67 05-76 67 e7 46 22 1b 8d 6d   H..^Bug.vg.F"..m
    07c0 - 9c 9e 5d cc a5 0a 34 2f-8a 3f 31 eb 14 ec f8 3f   ..]...4/.?1....?
    07d0 - 6d f5 0e f2 d1 c6 08 a4-f9 1f bd e8 2c 45 a2 2b   m...........,E.+
    07e0 - 5c 2b 0f c6 81 cc 81 b7-3e c6 18 8d 9a 9d b7 d4   \+......>.......
    07f0 - 60 dc 10 7f 10 23 b0 02-13 7f df f9 53 9e 1f 2e   `....#......S...
    0800 - 3e 23 51 73 aa d6 17 e9-af e1 57 06 c2 e7 8f 0f   >#Qs......W.....
    0810 - e5 7e eb 65 96 c7 17 a6-0b c2 e6 2f c8 ca d5 8c   .~.e......./....
    0820 - 13 a3 87 ce 06 75 3c 2d-ee e3 16 1a d5 64 57 5d   .....u<-.....dW]
    0830 - 39 11 66 62 58 c2 ec e2-63 6e 80 67 51 0b 5d 9e   9.fbX...cn.gQ.].
    0840 - 94 47 22 f4 f5 0e 82 6e-70 f8 f3 08 b9 ad f6 28   .G"....np......(
    0850 - af 96 b7 68 a3 76 4c cd-ba 67 15 a2 07 07 39 0b   ...h.vL..g....9.
    0860 - 87 c4 b1 e6 ff a1 d4 77-49 da a7 ab 0b 60 84 fc   .......wI....`..
    0870 - e7 70 87 a4 b9 ea 5a 56-b9 c0 4f 1d a8 b1 40 34   .p....ZV..O...@4
    0880 - 23 bd 57 eb 9a fb 15 87-f6 e0 e8 88 3a 51 f8 9e   #.W.........:Q..
    0890 - 72 d6 14 63 b6 33 27 04-6b 99 1f 31 bb 2d d0 6d   r..c.3'.k..1.-.m
    08a0 - d2 4d 8c 48 f4 1d 96 3d-da 72 a0 c4 95 66 fd 23   .M.H...=.r...f.#
    08b0 - 6f cc ac 71 83 99 d7 22-22 3c f8 eb 7e 33 b1 47   o..q...""<..~3.G
    08c0 - 68 2c 12 9c 82 7d dc fa-e7 25 7f 48 83 34 50 57   h,...}...%.H.4PW
    08d0 - fd 82 62 5a fa f2 52 1e-32 df b3 d4 67 ac 15 8e   ..bZ..R.2...g...
    08e0 - df 8b 4c 25 49 98 10 a2-55 87 da aa 0b cd 20 2d   ..L%I...U..... -
    08f0 - 4a 97 52 e6 93 1f 17 13-49 0e c6 3f b5 fc 18 08   J.R.....I..?....
    0900 - c2 37 3a 76 75 6b 3a b5-87 be cd b1 80 5a 6f b2   .7:vuk:......Zo.
    0910 - 93 d6 3d 0a 35 69 fc 3d-f9 aa 5a 20 4e 9f 95 70   ..=.5i.=..Z N..p
    0920 - dc a1 59 47 00 2d b6 cd-b4 c2 79 1f a5 0b 2d 1f   ..YG.-....y...-.
    0930 - 96 4b 86 fb d6 4a 83 02-bb 5a 10 63 13 3b 63 1f   .K...J...Z.c.;c.
    0940 - 58 6c a4 ef cf 89 f8 96-6d 08 1a e9 48 30 8e 6a   Xl......m...H0.j
    0950 - ac 47 6b 7d d5 f3 46 ea-b6 58 4e 15 b7 ac 6d 24   .Gk}..F..XN...m$
    0960 - 93 19 14 52 28 de 10 0d-86 33 e6 9d a1 e1 c9 eb   ...R(....3......
    0970 - 9d ee cc 08 da 67 5f 19-b3 e0 52 07 59 a1 99 66   .....g_...R.Y..f
    0980 - 0d e2 83 4a 02 4e da 6a-1a 97 ed c3 9b f2 ab 0f   ...J.N.j........
    0990 - 41 83 6a f4 5e 3b dd c2-bb 11 c5 0f fe 1e 10 46   A.j.^;.........F
    09a0 - 1b e5 db 18 14 76 be 82-64 66 7a 6c 7f 9a 9e c9   .....v..dfzl....
    09b0 - 46 cc 05 7c 5a b8 a1 2f-16 9d ae 48 9f 66 52 1a   F..|Z../...H.fR.
    09c0 - 0e cb c0 f1 32 a7 66 78-20 7c 96 af 1d 6a 08 ac   ....2.fx |...j..
    09d0 - 5e b5 20 92 12 b8 43 3c-b8 87 79 ef 64 83 4e 87   ^. ...C<..y.d.N.
    09e0 - 5a 44 d3 54 f3 1d ed a8-57 03 b1 18 4e 00 90 78   ZD.T....W...N..x
    09f0 - 1a 82 58 ec 57 c7 ad f9-17 5d 37 76 54 e7 6a 83   ..X.W....]7vT.j.
    0a00 - 72 60 d5 42 d1 91 69 c0-01 e0 9f 29 e1 c6 e3 93   r`.B..i....)....
    0a10 - 65 0f e4 99 a2 d8 e3 4a-63 4e f3 ad 92 00 c2 ec   e......JcN......
    0a20 - a0 ee 5b 1c 01 b9 0f 88-33 0d bf f5 ae 5d 2e 4d   ..[.....3....].M
    0a30 - c5 37 db 35 c6 fd 05 38-fa f9 55 33 a0 f2 72 b9   .7.5...8..U3..r.
    0a40 - 91 45 65 1d 3f 3f 00 29-fc 89 30 f2 9d 85 70 6a   .Ee.??.)..0...pj
    0a50 - 1f b6 47 23 21 33 ba c1-42 d7 0e ca 81 f0 1f 4a   ..G#!3..B......J
    0a60 - 10 ab db e5 ba 33 21 52-b4 e3 1b e1 19 d9 9f 06   .....3!R........
    0a70 - 97 e1 6b 92 9d 83 00 10-5f a8 4b 8b c7 c9 d7 37   ..k....._.K....7
    0a80 - 09 ba 76 30 61 d3 15 96-4a 6d 87 4a bb 5d 15 55   ..v0a...Jm.J.].U
    0a90 - 42 53 59 59 59 05 89 ec-de 53 d0 b1 85 af b8 c6   BSYYY....S......
    0aa0 - b9 cd ec 12 b7 9e d5 40-f6 77 82 64 f3 7d af fd   .......@.w.d.}..
    0ab0 - 10 51 fd 46 cc 56 61 79-12 f9 50 0e 92 ba ec 65   .Q.F.Vay..P....e
    0ac0 - de c8 28 58 41 93 ad 6f-ed 59 56 02 3b 8e 2f af   ..(XA..o.YV.;./.
    0ad0 - b3 76 ac 2f 5f b9 85 e3-59 7f 26 2d dc 3b 40 cf   .v./_...Y.&-.;@.
    0ae0 - c2 78 a4 05 9d 2f cd 53-03 e9 c6 b1 b9 56 ae 10   .x.../.S.....V..
    0af0 - 53 66 c9 2e 20 09 5e 13-12 04 25 aa 8d 3c f4 b6   Sf.. .^...%..<..
    0b00 - 02 59 c4 8d b1 a2 2b ee-ca 1c 99 40 fa 77 d1 4a   .Y....+....@.w.J
    0b10 - 15 ec 71 0c ca ee 37 65-0d 28 b0 cd a5 7a b4 a9   ..q...7e.(...z..
    0b20 - da b6 31 85 77 58 1a 69-fc cc ff 32 16 a6 f8 d7   ..1.wX.i...2....
    0b30 - 9f 7f 5b f2 28 90 1d c9-e9 81 46 c8 10 94 28 1a   ..[.(.....F...(.
    0b40 - aa 49 e2 88 8f 49 8f 31-23 ae 74 e8 d7 3d 35 24   .I...I.1#.t..=5$
    0b50 - 5e ba f8 29 c2 fd e2 11-7f ce 5b 1a a2 42 47 7a   ^..)......[..BGz
    0b60 - cd 6f af 52 8a 58 09 d7-11 ee 66 b8 bd d9 0f 7b   .o.R.X....f....{
    0b70 - 4c ee c4 92 a8 a9 94 93-1c 13 5f 08 1e 34 97 ae   L........._..4..
    0b80 - dd b3 78 6f fc 04 50 06-b4 f6 c9 ce 6b 2f e4 ee   ..xo..P.....k/..
    0b90 - 0c e0 1e bf cb 3d b2 07-d9 e7 fb 9d 25 f1 99 99   .....=......%...
    0ba0 - c8 ad f8 a3 a3 69 0d ec-e6 2d 00 00 a7 85 70 52   .....i...-....pR
    0bb0 - a2 5a 0f 7e 0d 82 b8 be-a3 41 79 64 b7 b5 87 2f   .Z.~.....Ayd.../
    0bc0 - c4 c6 0c ca e1 68 35 a9-60 b8 09 64 80 9e 93 f1   .....h5.`..d....
    0bd0 - 8f 6e c7 78 b8 a0 04 74-03 c9 86 e4 96 41 2d f0   .n.x...t.....A-.
    0be0 - f3 76 8e 62 b5 93 f5 aa-a2 bb 7d 96 60 91 83 18   .v.b......}.`...
    0bf0 - 8d 82 b1 dc ce 8b 1a 98-30 42 e3 2f 15 4c 11 be   ........0B./.L..
    0c00 - 94 31 a4 2f 29 d7 4c e8-34 a9 3e dc 26 17 19 c3   .1./).L.4.>.&...
    0c10 - c3 ca 73 b3 f2 ae 5b 8c-a8 e4 ac 2a bb 83 79 22   ..s...[....*..y"
    0c20 - 54 63 88 86 0f f8 08 bb-27 28 86 32 e5 d1 59 15   Tc......'(.2..Y.
    0c30 - d2 09 8e 88 ba b4 64 63-6d a1 f1 12 0a 01 3b 51   ......dcm.....;Q
    0c40 - 75 18 f3 29 79 ab 02 2d-5d dd 32 1b 42 7c 60 fc   u..)y..-].2.B|`.
    0c50 - e2 c5 1e 43 ad 86 63 43-7e 80 9d ff fb 3b 84 74   ...C..cC~....;.t
    0c60 - 9e 40 69 df b6 9e d1 a7-68 e4 97 14 56 59 be 2e   .@i.....h...VY..
    0c70 - 88 26 d2 12 19 ea a1 c6-16 33 e4 0e 08 ff f9 7d   .&.......3.....}
    0c80 - d2 b2 b9 b9 86 b3 81 65-d9 f9 01 39 5c a2 6a d4   .......e...9\.j.
    0c90 - 15 bc 22 29 71 37 c6 44-a1 6e 1f b2 98 f1 c1 96   ..")q7.D.n......
    0ca0 - cd 26 6b db 68 06 0d 4e-c6 d1 71 2c 22 54 25 de   .&k.h..N..q,"T%.
    0cb0 - 0f 11 44 9c 43 15 9d 0b-a9 b7 b2 16 69 3a 67 e5   ..D.C.......i:g.
    0cc0 - 00 87 48 11 dd 1a 33 fe-8b a2 ec 92 b2 8a 41 40   ..H...3.......A@
    0cd0 - 04 73 76 c7 4a e8 b6 2f-66 64 fa 2e 43 0f 38 90   .sv.J../fd..C.8.
    0ce0 - ac 81 a7 7b 82 4d 8f 1c-ba 5c 33 6e a7 47 ae 7c   ...{.M...\3n.G.|
    0cf0 - 34 6e f4 5e 16 47 02 44-48 1b 30 41 d8 db 4d 61   4n.^.G.DH.0A..Ma
    0d00 - 86 8d 80 a4 78 0b 0f e0-fa bf dc 44 90 58 df c2   ....x......D.X..
    0d10 - ac f7 e6 44 04 c3 f4 ff-9e 61 0e 1f 4e c4 16 df   ...D.....a..N...
    0d20 - 2b 36 70 51 8f 3d 2b b2-a5 0f 1e 1a f0 e0 a3 62   +6pQ.=+........b
    0d30 - 29 74 61 7a d6 64 1b fb-a9 86 d7 63 75 b8 4d a2   )taz.d.....cu.M.
    0d40 - bc da 19 c6 b0 7e 54 94-51 70 d7 c9 eb 8a ab ce   .....~T.Qp......
    0d50 - 61 fd d8 b1 e6 3a b9 95-74 96 7f 4b 22 0f 9f d3   a....:..t..K"...
    0d60 - 75 9b b8 b4 3e 3c 25 e1-12 7f e5 12 44 98 45 e9   u...><%.....D.E.
    0d70 - fe 05 4a 73 7b 27 49 8f-1b ba ed 66 13 6f 06 d3   ..Js{'I....f.o..
    0d80 - af 71 86 b3 ed 89 c9 01-e1 a8 49 9e c8 16 7c 4c   .q........I...|L
    0d90 - 1b e8 cc 93 b5 d6 21 3c-3e ab 06 20 95 5e d1 ae   ......!<>.. .^..
    0da0 - dd 95 de 5b 4d ad df aa-5c 17 cc 22 cb 36 95 b4   ...[M...\..".6..
    0db0 - 64 4e 92 5c f9 61 92 c0-3c aa 44 89 49 bf eb 81   dN.\.a..<.D.I...
    0dc0 - aa ed 60 f6 0e b5 7d f7-e4 4e 7f 60 4a 9c b8 a6   ..`...}..N.`J...
    0dd0 - b5 c3 0a 38 1e d6 ed 90-b0 a0 e8 6a da 2a 37 10   ...8.......j.*7.
    0de0 - 8f d7 61 ba ca 85 a7 43-c0 65 73 c3 94 5b 5a 50   ..a....C.es..[ZP
    0df0 - 59 2b 33 3e c6 b4 d7 bc-d3 e6 da f9 b2 91 5a 11   Y+3>..........Z.
    0e00 - 7f 33 76 0f a0 78 4a d4-92 4a db ca 4b 00 dd 76   .3v..xJ..J..K..v
    0e10 - 88 48 b7 ee de ac 4c 04-ca b9 8b 64 7e 46 0d 97   .H....L....d~F..
    0e20 - 07 8c 62 44 1b c6 de fd-22 41 ef 25 7c 2c 00 33   ..bD...."A.%|,.3
    0e30 - 91 23 cd c5 f6 4c 95 4a-4c d5 5b f5 85 da fd ed   .#...L.JL.[.....
    0e40 - bd d6 cd ec 08 a6 bb 9a-cc 95 f4 db d5 03 11 ec   ................
    0e50 - dc 92 a7 ca 5a 80 ef d8-97 c1 f7 53 d1 fc 4d fe   ....Z......S..M.
    0e60 - 29 c4 76 b4 83 69 ce 2d-2b ce 4c bc 7c 8d c4 c4   ).v..i.-+.L.|...
    0e70 - 63 0f 3c 87 aa ec b7 f8-0d 15 b3 55 8f 49 97 5a   c.<........U.I.Z
    0e80 - d9 1a 47 5e c8 c6 2c 1d-28 68 2b d2 88 11 52 01   ..G^..,.(h+...R.
    0e90 - ea 17 c6 ca 83 d4 1f 0c-05 ca 13 c8 fc 9c 1f b1   ................
    0ea0 - b7 c8 1b 9b d7 4d 31 46-d7 3c 55 ab f1 22 48 88   .....M1F.<U.."H.
    0eb0 - ca 75 a1 b8 8b 41 35 13-3b 57 10 c1 27 b3 a4 ec   .u...A5.;W..'...
    0ec0 - ac 54 1d d8 d4 54 e5 4f-32 67 f2 dd b3 c5 fd 76   .T...T.O2g.....v
    0ed0 - 99 dd b2 57 cc 09 d7 ac-df df b1 e7 14 d1 89 a0   ...W............
    0ee0 - 3b e6 0d b0 0c 90 35 2a-ae d0 0b 45 81 2a 4a b7   ;.....5*...E.*J.
    0ef0 - e0 de 4a fb 10 35 86 45-a9 4d 2e a5 fa 27 d8 41   ..J..5.E.M...'.A
    0f00 - a2 36 a1 c3 c4 c5 10 e4-b5 4c 9d 0f 7f ac 8a 58   .6.......L.....X
    0f10 - a7 4d df 73 a8 d4 e7 0f-5f f3 73 d5 74 7f 40 12   .M.s...._.s.t.@.
    0f20 - 8f 16 84 74 3e d7 5e 9d-50 9b 65 5e 26 e5 91 83   ...t>.^.P.e^&...
    0f30 - 50 56 b9 f7 57 c6 82 fc-a3 09 ef e6 84 b1 65 ea   PV..W.........e.
    0f40 - fd f1 0e 98 26 34 79 97-cc 31 d8 24 9e b4 17 22   ....&4y..1.$..."
    0f50 - 38 52 73 f0 9a c2 26 3e-bf f5 64 99 83 74 27 4f   8Rs...&>..d..t'O
    0f60 - ab 80 39 47 e8 b0 45 ab-54 30 43 5b 11 b8 07 9f   ..9G..E.T0C[....
    0f70 - 7a 0c 53 e9 bf 22 14 89-d3 73 8c 23 8a 8f 69 47   z.S.."...s.#..iG
    0f80 - fb ca 38 87 c6 69 72 88-e2 e8 22 71 32 1d 1f 1f   ..8..ir..."q2...
    0f90 - 74 67 e4 84 a9 1e 18 75-9c bc 54 9d 50 86 50 c2   tg.....u..T.P.P.
    0fa0 - 06 cd b8 17 c4 e1 b4 8b-94 17 3c a9 dc b4 7c e3   ..........<...|.
    0fb0 - 6f dc 96 60 d4 78 9c 66-83 96 15 e9 12 9e bd 62   o..`.x.f.......b
    0fc0 - 0e 16 e1 6c 4b f2 74 0a-b6 24 59 12 05 3a 69 95   ...lK.t..$Y..:i.
    0fd0 - ba 90 7a c7 59 1d d8 4b-f9 af 2a 46 06 71 28 de   ..z.Y..K..*F.q(.
    0fe0 - 9a 5e 13 26 cc 16 aa 6f-c9 be 76 df 9b 44 72 30   .^.&...o..v..Dr0
    0ff0 - 66 8e c7 81 b6 43 be 99-37 fa 1b 44 61 27 7e 13   f....C..7..Da'~.
    1000 - fd cb 8a d8 43 b1 16 a9-35 70 80 eb 37 e1 34 43   ....C...5p..7.4C
    1010 - e5 65 27 8c 43 86 35 43-12 ea 33 a9 80 25 43 ed   .e'.C.5C..3..%C.
    1020 - f8 e0 0b 90 45 14 45 d8-65 83 76 6f 91 41 be 2d   ....E.E.e.vo.A.-
    1030 - dc 39 8b 9c 88 d4 7c 71-dd 43 9d e8 36 99 f8 32   .9....|q.C..6..2
    1040 - 53 a1 ff 74 03 54 92 39-8d c0 57 0e 70 1f 75 b8   S..t.T.9..W.p.u.
    1050 - ea 76 10 c4 6e 7b 0f 37-39 77 4b e3 45 d7 06 35   .v..n{.79wK.E..5
    1060 - 01 28 fc ef 88 ea 9c e1-4a ab 51 98 7a 82 84 4f   .(......J.Q.z..O
    1070 - 5f b8 58 3e 31 14 4f fc-74 1e 50 2a 0e 2c d4 f8   _.X>1.O.t.P*.,..
    1080 - 3a 45 74 be 2b 7a 56 00-17 27 e6 29 e0 1a 96 ec   :Et.+zV..'.)....
    1090 - e7 13 b4 36 e3 76 af 66-44 7d 4c 51 5a 5f 5b d2   ...6.v.fD}LQZ_[.
    10a0 - 7c de 95 18 78 15 5e f1-e0 8e d3 9c 18 33 87 95   |...x.^......3..
    10b0 - 5d 91 e5 51 cf c4 5a 25-59 8e c1 76 af 13 30 80   ]..Q..Z%Y..v..0.
    10c0 - 3a 8f ad 19 41 01 a5 29-82 98 6c fa 03 5c 73 66   :...A..)..l..\sf
    10d0 - c5 71 23 fc 23 bc f5 91-94 1e 52 63 30 ab 46 d4   .q#.#.....Rc0.F.
    10e0 - c2 ef c0 65 4a 30 e5 21-b4 bc db 85 d9 ea 7c 84   ...eJ0.!......|.
    10f0 - 35 9e 2b 33 9f 90 9b 94-34 a2 fe 3f b9 93 15 fc   5.+3....4..?....
    1100 - b5 ca 2e 88 fc 01 6a e0-63 72 a1 73 e8 23 59 6a   ......j.cr.s.#Yj
    1110 - 0d 1f 77 9b d6 00 f3 ad-e4 a3 ae f2 43 21 96 47   ..w.........C!.G
    1120 - b9 9e 0c 28 d1 0e e6 ca-d8 d2 94 ab cc 3b 59 13   ...(.........;Y.
    1130 - a9 69 44 a3 4b 7f 1f 6e-e6 6a 0f 44 66 28 7b 14   .iD.K..n.j.Df({.
    1140 - 42 c5 9f fe 80 88 3a 59-67 b3 25 0f 69 64 2a f5   B.....:Yg.%.id*.
    1150 - 5e 89 8a 8c 43 53 2d d1-92 39 3f 8f 8e            ^...CS-..9?..

    Start Time: 1763717187
    Timeout   : 7200 (sec)
    Verify return code: 0 (ok)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
```







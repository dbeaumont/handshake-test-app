# Cas 3

## Configuration

script :
- generate-certs-cas3.sh

exécution :
- make certs
- make down rebuild up

system cacert : ajout de root-ca.crt
- Handshake Root CA

client-truststore :
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
   v:NotBefore: Nov 21 10:55:26 2025 GMT; NotAfter: Nov  9 10:55:26 2075 GMT
-----BEGIN CERTIFICATE-----
MIIFpjCCA46gAwIBAgIJAMRponMwVl/VMA0GCSqGSIb3DQEBDAUAMEUxCzAJBgNV
BAYTAkZSMRIwEAYDVQQKEwlIYW5kc2hha2UxIjAgBgNVBAMTGUhhbmRzaGFrZSBJ
bnRlcm1lZGlhdGUgQ0EwIBcNMjUxMTIxMTA1NTI2WhgPMjA3NTExMDkxMDU1MjZa
MFQxCzAJBgNVBAYTAkZSMQ4wDAYDVQQHEwVQYXJpczESMBAGA1UEChMJSGFuZHNo
YWtlMQwwCgYDVQQLEwNEZXYxEzARBgNVBAMTCmFwaS1zZXJ2ZXIwggIiMA0GCSqG
SIb3DQEBAQUAA4ICDwAwggIKAoICAQCd0FUqp++Y56/LpHaxLKMsHslbVM7WITPg
EJ5FxLW/mOP+Uv+Kj36qn5hpGKtPBFDDtMmlJSm/Z45iv5+IhRPvequzE+VijG6c
xK9f0+gj514NrsvvpR12vqLUUUS+xK2oq2HToog6XPOtQtXtf1qlwx6HckycFfGc
ZlByusoqJ7FQPOKiIONQpy7J3q8JkEneaWGWpfLh4Q/JV1uYcErYSJXsxJmsC9zg
kA7NrLnVPY1xgnwUNiMH1/AMc+Z/1q17+dVhxiiHmW4Bik5+K/KxVXHtIG0H1kj9
jJLQ47A3s/Ti8OJ3F09EHC6hbNcc2jN4RNn/CHUOGhNhPFVM9t9fr43J8+tBZVwX
+DnLmN79Rzuk1wDyAZBsdDBQYw289FBxbz53TtmYzfqXt17bospklpmDgC1Zk1rV
jxXbChWJJM50PfGKV4D4EoYPOqKM7ClNluZ3pOxfia8XSgh4q7maF/UweQVMyLEz
rx7Zb4S2mbQwERy9dWvQ/LSYTRYmVJ3hQQm1nmD2R0TvPhZWMSAzvcBlsQf7wtrN
vdtPqfErFMtcqQkT9jytO89MADqNkGqRqCL00YrWb8LC7QP9sarZDPdSX/7s3mqu
WNqZcMvabIGXtSfnSwlGTdPIEgwR/enq5CQXlAr7mqVRGsrX8I4b1oVNp+JZwPC7
9s92qDCniQIDAQABo4GHMIGEMB0GA1UdDgQWBBQDf9wEMokIMoNOs003ZF+rYn0S
uTALBgNVHQ8EBAMCBaAwIAYDVR0RBBkwF4IKYXBpLXNlcnZlcoIJbG9jYWxob3N0
MB8GA1UdIwQYMBaAFAJIy1NLCdD4FPjXQZfZl1A+T5ZTMBMGA1UdJQQMMAoGCCsG
AQUFBwMBMA0GCSqGSIb3DQEBDAUAA4ICAQCFJJ7ITNTviVrSGHHUp1S0m6o63jXR
xlQ0jPW/zjHvOz4Ynk483SSFt1gtZeTy9rSb6ucxB5pNV4PUAU/9T4VN393M2Q+Q
OPvoIoAPfRQBRYBRScVJjzsYjEaB035q9t6WoMNHt853EzYmFZRqHMl+UeEVjU9k
mb2RL8NOuItxQFGFb1znObmSP0iacovFAM6+kZrsBkz6xXI0QZTEhO5uy+6uSnkB
UK8FDDhYBqoFtwP4yg91MWH/cPw54gun21zd2IeGM9Eo+/PdlI1/x0HLIqO/Fqh5
GZ/KIuBgu6Lq7cYoAU8NVlNcJlcKc7DY9Kn1yDMiBqipdh16+afYubVLhpQJ9XXb
dguA5lpL0meNpukjBeCQ9ZK2BRp6IVRtPmI4ZLHSVgsXaFSu/xhculpUJJY1hxfD
vMwonu4TuQVTsJ2ohd4sCwEtvS7zyT1/O/UAcFhz5I0IAxD07NnV0EDP8pjPWoo6
9lVK8AeM00YYtCOQ728e2o+y2qAW0I+xqkWrVX2+pfhxfjfRpsiim0OK59DCqKwB
V2G64+I8akS1FzRWYtFxSz+vz57k5/LCPO02XsSCQR4GJRTJ9vPaS61DIY1IOAUJ
CdBM0LSL9hk2vJUjvLADAEpNLNE5067fEvg+N019hnMvwPG4N4Y8xEqqkW5c90gA
7FF3dkOXumtDfw==
-----END CERTIFICATE-----
 1 s:C = FR, O = Handshake, CN = Handshake Intermediate CA
   i:C = FR, O = Handshake, CN = Handshake Root CA
   a:PKEY: rsaEncryption, 4096 (bit); sigalg: RSA-SHA384
   v:NotBefore: Nov 21 10:55:24 2025 GMT; NotAfter: Nov  9 10:55:24 2075 GMT
-----BEGIN CERTIFICATE-----
MIIFbTCCA1WgAwIBAgIJALnLmPE4mOuSMA0GCSqGSIb3DQEBDAUAMD0xCzAJBgNV
BAYTAkZSMRIwEAYDVQQKEwlIYW5kc2hha2UxGjAYBgNVBAMTEUhhbmRzaGFrZSBS
b290IENBMCAXDTI1MTEyMTEwNTUyNFoYDzIwNzUxMTA5MTA1NTI0WjBFMQswCQYD
VQQGEwJGUjESMBAGA1UEChMJSGFuZHNoYWtlMSIwIAYDVQQDExlIYW5kc2hha2Ug
SW50ZXJtZWRpYXRlIENBMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA
q/k/9BLZemXa27nZpzWg35E4PP5nqZ4L+wZ+N2ewOk6Ll1Nn7j788wufao1A4A64
5xEsb7u9ygD9lWxlF/BBL8WJIA/by7vV6y1BVAJjIexxmuwFTs0GKiq69uYtKH+8
UCReKnIi3hR1zUwYwWq8bFv9+fOdpoaByteKewKRVVvE3oE5D3/ygggN90a1vyV5
wV5yeMbh5ZcKyX2JynUhNhGUQ1lZBsrqGkZbAxAvRNlRuKSYwi5Hi3El5aafJKKl
kU+aeSYiRPTKGktRpjAYICOhe1lV9GcD3oSFPcg7qqGa/IdWYa7tRYLXqSfhMJUP
zQWvqZlngwMkr6YRhKG14w2UkA+SIsKQzin1ZNuxjDNdd/iksZ5+7x08FsuCkxTT
La5c1xtBkUwye5s4ilYSn327g4wRt8wbbJJxlYY7f+J2CwXwTS+BzzVCREu7gUSk
uGhKaO/7aeV4AscKNZ5bL/BUHF3uA5VKC77IH3eGAT1sheJ/Gf2tuVxw7hLxzgCt
nSC1WdcU74Z/PW5HecfmNAkLLGbBHW0OJKReytra0U56a/t5VQ/gadoNj5IJmJHT
jNECYkM4Q1fiH1SERwfshXzcexFkHd41nm5oRwornxGQb1r+x/JLx0jpiq8HrswM
5IACW0U5FnKt0eKFkgjmtwHhK9QhYdDmWuysr1RsEacCAwEAAaNmMGQwHQYDVR0O
BBYEFAJIy1NLCdD4FPjXQZfZl1A+T5ZTMA4GA1UdDwEB/wQEAwIBBjASBgNVHRMB
Af8ECDAGAQH/AgEAMB8GA1UdIwQYMBaAFD3ieoV7mI+mmTU1U97z0F+W+PABMA0G
CSqGSIb3DQEBDAUAA4ICAQBMfTtPvKek4qI/W0D4WBIRY47CeWPo4Q6+boOCeegl
imDiIUBRyuYaTIxxkqvaDu0QmxLhbXOE5N0UF54KOf8z8NojUzJ8CxKxasrgGk6N
krqdVl1q14nCmhILb+qx8LMPVlPWun3eo6xfiUiHd6p7mP+zCR6x4XdfZztFayfX
gdL4MHle83b/WMrwvdZHhHTupf/yEncLS1wR30KPrNKfN6OL2iQFboKaZ0u8Th3D
LTYtYZEtEsOHt93fTPGRHhFgM3RnvrLHcxdJtLXgf0r+FqOfWAucBnkAMcn9C3eC
XAxTtW2g4SAaO7vImXBhluteJ+pw4tZJpAWPPhM2dbk3AI5inCTtR6YAac+TzXo1
qBK7TX64IA+HbkchPBenxlBnxItZOJEy1E1TgzdYIKwCFuuDBrEcOiVHP8KFY3qy
AoencbdQmAvpYvMgetzPbi0o6r1ZxfLsXVK04DiER/w7YCh97C4TKzLywFaM3LYa
IYkg/j8Pt06wvtL0yPfWu+YsqKQf6Q5buK2ZFUMmFNCVvRlW/8pVOHa8n7D3clPa
oAuajhv5uhj4pENXLvcZ6i2DYv5ughO5sUhqXZMQ6bQ67yhZ7zjODg0aKFX1HLwg
aENwLmfBg01EtYARDQF89Q9hb1EFqNO5WFOEEr80ACGM+IPCk+LnrBeBvkXuIAAQ
xw==
-----END CERTIFICATE-----
 2 s:C = FR, O = Handshake, CN = Handshake Root CA
   i:C = FR, O = Handshake, CN = Handshake Root CA
   a:PKEY: rsaEncryption, 4096 (bit); sigalg: RSA-SHA384
   v:NotBefore: Nov 21 10:55:22 2025 GMT; NotAfter: Nov  9 10:55:22 2075 GMT
-----BEGIN CERTIFICATE-----
MIIFQDCCAyigAwIBAgIIfV4mcnu4u80wDQYJKoZIhvcNAQEMBQAwPTELMAkGA1UE
BhMCRlIxEjAQBgNVBAoTCUhhbmRzaGFrZTEaMBgGA1UEAxMRSGFuZHNoYWtlIFJv
b3QgQ0EwIBcNMjUxMTIxMTA1NTIyWhgPMjA3NTExMDkxMDU1MjJaMD0xCzAJBgNV
BAYTAkZSMRIwEAYDVQQKEwlIYW5kc2hha2UxGjAYBgNVBAMTEUhhbmRzaGFrZSBS
b290IENBMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAo9bXX4NWF9hF
XVHB6361YrTHLUNoc1SSSWLpRsdr278q7iCc2I86AfN2oDjbNuqgf2P34UmuV3QU
ullxCJbUfuL9dJf95T6oIF6OFdAOSggNsoIoCwfYqB5Us7cx+AEtaLkDZxwrXsAn
oa0x+qhnQsr9ct2fVLHaE8laI6xUN6C3NNSmAWswi1LzN0Pt558WCyf5ugMqKZjK
4GoL9wZOSORhM1eyL7hdNQtVDgi7V2hYvOeynr/TIcUeKbEoSRVOtazZCOIEEReA
Bhfm78/DTNpvast+UqERFUZBlYuYXm7eZXurLZi2+bsfxFbL+AokJviZW0evXlsC
Kj49tO6sFtu1BXvxBA9SvDTWWOFjh+9IGAMIbs+DPl6l3IVgiAKBF7UVOuz4nXDS
20N/7BbNN/PybvsBF05ug46B7pLVTVhCeBlbicJch5qw9IrIL6j5g6wbk8zLDV83
ufbpqxFpyQxFr4/ps4OosJakMGCK4IQXHK54ptXTCqrKeQ+ATGD7KNNvEZpkCKA0
k2VzextP6QkL+yEI1BcvoXnHM++PIhfp4uSKhyqqQYKxk2BHcB5mzUP2VFD1zQwl
Kq2QU+o2K/3x2gJjnvg94vHyKh15CghAGmIrHP+zC+t/Xo/0F0cUmaeSnmLypsrT
IKWUkUSKeGp+XdeX5oDjP2ahQi1QgtUCAwEAAaNCMEAwHQYDVR0OBBYEFD3ieoV7
mI+mmTU1U97z0F+W+PABMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/
MA0GCSqGSIb3DQEBDAUAA4ICAQCcxWsJYpOu0ZxjHMVAZ8k1LoH1wzbwxNZbe6ON
PJ346zCRq3jTEqoUnDiGxJi8mU5nZnfKBmyrlsecpdR8FqtvzkRZ34MtuUfKOMt9
nMJWkQfG4qEPVBur7oShfG9kv7xfQP/0xbWfWWD5E9QWAxYxh4ShqywDql17rsGF
8l5KAyjDBiLMMv/L4j3F4sQS5N8fiyf1aJMLefRkQG+lXFEgQmkjUU9QulGoQpb1
Zwu2iJ11naerKtWZO40zXcCUDgHNAXOms0pxuV0Vxv//NP1yR3TNwihzCerdnHVz
Z/X2ZF1DWYTKA/+k6nnRZTdeZj+4UUkdq2nZmYvcArEjIzoBHXV1JBAabLxce6Do
waMPif/wHlN9eRiqxoIGawbRpdNu3Xkd9/hzjcAw4vXhtJiGm+Gk5wK61xsVg+Oh
8vU7yo90XadIco5cPRrKPU+HEWMhZXkd1AVHfc3u2M6jPYTEQpBO9JCyVACnqs/B
A363e557kMIwnwMRecvc958xSOEdu4tG9rbqcPTwGW4l7i2UWHkfYyjmKw9JqImb
vpS58apm5P+rKwJW0klO5D+e83QC8o810BBwotJPS5JoTzGPJsZ8WB2voGjF/dFq
ZYzHodK2EzsXY29dtkft2ua6C5kgfi3/zw9rXpOHtNMbJq7QboVjs0e48APzcS6k
LVQuaA==
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
SSL handshake has read 4989 bytes and written 392 bytes
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
    Session-ID: 7ADA308B8509E85A7F9007C9D5DEF85E12ED587E3639CE07F85FB114DB7336F9
    Session-ID-ctx: 
    Resumption PSK: 156682220950841EDFEB786197F8E1CB4864B68305BFFE9AA6638451169202C34E8263629F4E949748CD05182ADE54FE
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 86400 (seconds)
    TLS session ticket:
    0000 - 9c 9f 4a d1 a9 95 b3 ca-e2 46 eb f7 7d 0d 56 2c   ..J......F..}.V,
    0010 - 77 8a d9 45 ba 4d c9 77-bd ae 2a e0 d1 93 a0 b6   w..E.M.w..*.....
    0020 - e3 49 c6 b0 84 75 27 e7-a0 ee 86 75 5d bb 10 82   .I...u'....u]...
    0030 - 32 30 18 d4 fb 5c 75 33-4c 06 60 ad 8f 55 fc 5f   20...\u3L.`..U._
    0040 - a3 36 70 96 66 44 48 b1-d1 4a c4 d8 55 d1 aa 7b   .6p.fDH..J..U..{
    0050 - 97 72 03 e1 ac 5a cc ed-6b d9 fa 4a bf df a4 19   .r...Z..k..J....
    0060 - 3d 93 e4 a9 d3 d2 2d 58-b6 a6 20 9a e6 f0 6f 6a   =.....-X.. ...oj
    0070 - 88 93 50 58 c5 ac f6 17-7d d8 3c 3c f0 a9 9f a1   ..PX....}.<<....
    0080 - 54 f5 d2 88 fe 6c 15 e6-5e fd d3 94 37 0f db 32   T....l..^...7..2
    0090 - ce b2 83 f0 45 6c 94 38-e5 d8 8e 2b 1d 0d 32 33   ....El.8...+..23
    00a0 - 00 c1 c2 2e 57 88 33 37-df dc 0b 8d 14 08 76 30   ....W.37......v0
    00b0 - 3f 0c 68 0e 9f 8c a7 c6-da 2a 3f fc 3f 09 4f 4c   ?.h......*?.?.OL
    00c0 - 22 ab 1a 27 69 45 70 97-b6 7a de ae 80 59 ac 88   "..'iEp..z...Y..
    00d0 - 10 1f 4a 76 0b ed 02 5e-5f 2f 4e e3 12 54 98 22   ..Jv...^_/N..T."
    00e0 - 63 15 ca e5 f5 14 b7 f7-81 1d 3d bd d4 bb fa d6   c.........=.....
    00f0 - be a8 3c 31 d7 30 c9 29-7a ae 3b cf f9 58 e7 da   ..<1.0.)z.;..X..
    0100 - 6f 0c be a6 26 25 7b 55-80 d0 14 4e 5d 47 fc 87   o...&%{U...N]G..
    0110 - 0c cf ba 27 74 f8 a3 ef-86 86 31 00 e1 b4 79 9a   ...'t.....1...y.
    0120 - e0 db e4 c0 5f bc 8f e6-46 bf d5 83 5e 19 61 9e   ...._...F...^.a.
    0130 - 94 c7 8f 96 72 dc f0 46-48 88 31 6d b6 32 38 50   ....r..FH.1m.28P
    0140 - c6 5a 74 80 fb 9d 5e 25-7c 9e 77 0e 1e a5 fb bc   .Zt...^%|.w.....
    0150 - 43 70 23 4b 8a cc 1f 2e-45 bd d7 af 39 df 20 97   Cp#K....E...9. .
    0160 - e1 85 ea ca 25 b4 c7 5a-e1 0a 2b b0 34 92 e6 df   ....%..Z..+.4...
    0170 - 05 41 97 ee e6 8a fd ea-b3 9f 0d 7f d4 0a 4f b1   .A............O.
    0180 - 3f c9 19 ef e9 f5 a6 39-95 7c 6f 41 89 b0 3a 2b   ?......9.|oA..:+
    0190 - 85 db d6 79 16 80 d9 77-cf a2 b3 f2 c9 89 5f 1b   ...y...w......_.
    01a0 - b9 06 ac a5 9b b7 43 c4-65 84 f1 5d 20 b3 20 04   ......C.e..] . .
    01b0 - 3a 24 ab a7 4b e2 1a 77-cc 06 32 85 7c 1c f1 ea   :$..K..w..2.|...
    01c0 - b2 4c b6 fc 1d 42 8e e0-b8 6f e0 2e 1e 6d c2 b6   .L...B...o...m..
    01d0 - ba 50 4e 08 54 f9 37 36-43 0e cb 62 e9 80 44 2f   .PN.T.76C..b..D/
    01e0 - b0 34 c4 60 37 b7 e1 88-cf 55 f9 92 96 35 a6 0a   .4.`7....U...5..
    01f0 - 1f 96 91 ba 2a 74 8c 23-5d ce dd bb eb d7 eb 2e   ....*t.#].......
    0200 - 4d 9e 81 d8 f3 c9 25 59-84 cf e2 7f 85 fd 01 9d   M.....%Y........
    0210 - 0e da 1b 15 67 d2 2d cb-38 00 a0 e2 8b 3d 89 b0   ....g.-.8....=..
    0220 - 13 9c 4e 45 f5 b0 db 80-53 cc a7 51 8a ed 6d 38   ..NE....S..Q..m8
    0230 - 8a f0 56 34 39 d7 e3 e9-60 41 32 7e c9 df ba 81   ..V49...`A2~....
    0240 - d4 b7 e1 d8 e4 f2 28 e6-d2 b1 70 5c be 53 29 74   ......(...p\.S)t
    0250 - 1a c0 ec 6d 60 dd f2 fb-57 b3 5b 44 e8 99 95 72   ...m`...W.[D...r
    0260 - 99 71 47 3c 29 2e e1 8a-14 47 6c d9 49 38 92 93   .qG<)....Gl.I8..
    0270 - 16 62 17 67 1b e4 e5 97-21 a1 81 9f 46 7f 2a e6   .b.g....!...F.*.
    0280 - ae be 43 e4 18 32 c2 f6-80 0a bb f2 4e 39 b8 77   ..C..2......N9.w
    0290 - ce c1 5a 9b cf 2f ee 6c-81 04 61 59 35 5f 6a 73   ..Z../.l..aY5_js
    02a0 - ee c8 f0 b7 4d 83 78 a0-6c 2a 0b 47 85 b3 a6 78   ....M.x.l*.G...x
    02b0 - e8 7f 43 ac 7f 32 06 b6-e5 c2 59 d6 e1 00 fd f8   ..C..2....Y.....
    02c0 - 80 8c 61 6c 02 c1 02 e8-7f 9e c5 31 c6 85 45 c9   ..al.......1..E.
    02d0 - f3 6d 8b 1f 67 01 75 c9-d0 91 33 d7 a8 ad 3a 81   .m..g.u...3...:.
    02e0 - 4b 92 1d ea bb 39 eb 56-64 99 df 20 95 3f ab d7   K....9.Vd.. .?..
    02f0 - 3a 4e f6 91 5b fd a4 98-e4 85 37 ce c4 b1 87 b0   :N..[.....7.....
    0300 - fd a3 d3 9b d4 ba 8b 2f-c5 a9 d5 97 91 2d 2a 4b   ......./.....-*K
    0310 - 85 a7 66 d7 ba 6c e2 8e-bc 51 82 9c 03 2b e0 13   ..f..l...Q...+..
    0320 - 9e 25 89 bc 51 a4 28 f8-00 27 3d e3 54 a7 5e ee   .%..Q.(..'=.T.^.
    0330 - 3d dd 10 33 2f b2 e2 88-fe 2c 8c 93 88 0c 3c 4b   =..3/....,....<K
    0340 - b4 cf e3 4d 9e 7b 48 44-1b cd 11 9b 31 06 42 3a   ...M.{HD....1.B:
    0350 - c2 c7 6e 3a 57 1b 7c b5-19 dc 8f 61 ac de 69 78   ..n:W.|....a..ix
    0360 - fe 30 8a 0a 9f 46 87 67-11 fd 3d b5 25 b9 59 26   .0...F.g..=.%.Y&
    0370 - 3a 25 12 2c dc 6e 22 d5-83 cb 6e c0 37 30 e0 3e   :%.,.n"...n.70.>
    0380 - 07 31 36 8b 42 90 ac cc-52 b7 7f 84 3d 31 1b 6d   .16.B...R...=1.m
    0390 - 6d 38 3d e1 5f e0 21 78-98 be 59 e4 b3 cc 68 13   m8=._.!x..Y...h.
    03a0 - 65 23 9b e1 a3 50 f7 9f-37 db 8b e1 65 eb 05 da   e#...P..7...e...
    03b0 - 54 43 ec cc 32 47 a1 49-c6 79 cb ef 96 4b fa 2f   TC..2G.I.y...K./
    03c0 - 1a 63 17 02 55 f4 7d ea-c7 e4 07 8a 5b 59 4e 38   .c..U.}.....[YN8
    03d0 - 41 35 2b 72 b8 2d e9 ab-3b 5e ff 78 16 78 db 5b   A5+r.-..;^.x.x.[
    03e0 - 54 48 fe a9 3e 64 38 24-94 3e 86 e2 83 71 80 ef   TH..>d8$.>...q..
    03f0 - 43 02 4a a1 73 06 fd 26-72 58 a7 c2 2e 0e 41 d3   C.J.s..&rX....A.
    0400 - 8b 67 ca 75 21 e2 8b 73-6f 33 63 31 7c 71 2b 14   .g.u!..so3c1|q+.
    0410 - f0 c6 3a 67 13 c5 e0 fa-71 33 ce 6e db 6b 84 37   ..:g....q3.n.k.7
    0420 - 6f 10 8d 05 c3 25 b7 c5-7d f4 1c bc cc 7d 75 29   o....%..}....}u)
    0430 - 5d a7 b2 5d 78 f4 17 10-76 ea 35 d6 36 e9 b2 59   ]..]x...v.5.6..Y
    0440 - 61 d8 c3 9b 29 8b 35 ee-e3 f0 6b 52 66 e4 96 84   a...).5...kRf...
    0450 - b4 be 64 c2 8b 27 ee 72-52 57 88 99 a1 20 ff 2e   ..d..'.rRW... ..
    0460 - df 62 af 9f 78 4f 8c 7e-37 70 69 4b 6f 01 b4 17   .b..xO.~7piKo...
    0470 - 17 69 ae 0e 9b ca b6 a3-30 4c 2c b7 ad 05 be 18   .i......0L,.....
    0480 - 9d c2 72 ec 78 54 c7 7e-83 e1 c7 7b 77 a8 8e f9   ..r.xT.~...{w...
    0490 - c5 d3 99 e4 30 91 f8 e4-8c a2 bf d5 54 69 2b c2   ....0.......Ti+.
    04a0 - c5 77 ee 7b 0a 0a 41 71-49 4c 4d 46 73 9a fc 26   .w.{..AqILMFs..&
    04b0 - 98 9f 51 5e 66 f3 ba c4-7a 72 19 2e 87 7e 04 09   ..Q^f...zr...~..
    04c0 - 25 6d 57 0a d9 3a 79 31-0c 60 0a 3c a9 66 8e 0b   %mW..:y1.`.<.f..
    04d0 - 8a d3 63 52 7f da d2 8d-a5 f7 99 40 a8 01 b2 0b   ..cR.......@....
    04e0 - b1 ac 98 cc c2 3d f0 ce-a5 b2 61 f7 48 ad 9a d1   .....=....a.H...
    04f0 - 3f 50 bf 21 6b 06 0e 10-8d ce 14 da e0 72 a9 06   ?P.!k........r..
    0500 - 10 64 49 3f 29 b5 ca 81-f5 2e b5 8b 5b 6d 88 b8   .dI?).......[m..
    0510 - 8a c6 f8 30 22 cc 1b 31-74 a5 4b 3c d9 3d 4b 64   ...0"..1t.K<.=Kd
    0520 - 77 e5 0c 27 43 8d 0c f9-30 46 6c 7c 23 7a 41 9e   w..'C...0Fl|#zA.
    0530 - dc e9 de 97 ca f9 05 04-3f 2d 06 d7 3c 0f 16 95   ........?-..<...
    0540 - 2d 0a f7 6c cb 91 72 e2-1b a7 83 36 4b 95 e8 a4   -..l..r....6K...
    0550 - 96 f9 3b f4 54 05 51 b9-ee aa a5 65 76 d6 bb 8d   ..;.T.Q....ev...
    0560 - 03 50 57 7c 4d 77 07 ba-ff e6 87 3c b4 d7 d5 c1   .PW|Mw.....<....
    0570 - 19 d4 ed 61 78 f5 88 4a-f4 72 c1 42 21 49 92 da   ...ax..J.r.B!I..
    0580 - 65 4e 53 f0 5e ab 32 c8-59 ab 7b b0 16 2c e2 e7   eNS.^.2.Y.{..,..
    0590 - 93 55 de fd 95 80 82 a1-03 92 22 ff c3 66 cd fe   .U........"..f..
    05a0 - 13 12 16 90 73 18 7d a7-e8 5b 25 ff f9 86 48 33   ....s.}..[%...H3
    05b0 - d5 32 95 c7 0b 02 25 1d-ca c7 cd 87 1e c9 3c a5   .2....%.......<.
    05c0 - 55 4b 71 67 87 2e ed de-52 c3 68 9c 8f 7b 39 21   UKqg....R.h..{9!
    05d0 - f1 bd 97 5a 18 48 31 a3-dc e4 ae cd 64 29 7f f7   ...Z.H1.....d)..
    05e0 - f0 b7 ac 56 6b 8e 12 74-cd 28 84 93 03 15 2d ab   ...Vk..t.(....-.
    05f0 - 44 f2 2d 65 7f cf ec 40-54 42 87 9e 63 cf 38 6e   D.-e...@TB..c.8n
    0600 - 27 25 a7 5b c0 cd 24 8f-d0 1c d0 b3 51 33 5b b1   '%.[..$.....Q3[.
    0610 - 0e 93 1d 09 d2 7e 81 c5-99 7c c1 bb e5 e3 7c 74   .....~...|....|t
    0620 - 76 91 cc 2c 25 7c 5f 0b-b1 f3 dc 38 13 40 34 06   v..,%|_....8.@4.
    0630 - 4d af 36 78 90 fd af 9b-48 57 2a 01 22 c4 8e e4   M.6x....HW*."...
    0640 - d6 c4 94 6d bc 2d 62 8f-8c be df 06 6d 0f 6e dd   ...m.-b.....m.n.
    0650 - 0a 84 88 9f 36 f3 de 07-4e 64 c2 6e 23 5d 83 15   ....6...Nd.n#]..
    0660 - 4c ce 8f 9e 99 54 c2 b9-5f 83 92 0e 4d 3a 65 b2   L....T.._...M:e.
    0670 - 2c 0a 89 d3 47 0d 77 db-f7 ba 2e 41 06 31 8b 1c   ,...G.w....A.1..
    0680 - 52 09 1b 00 46 81 66 3b-41 77 c2 1e b2 9c 27 da   R...F.f;Aw....'.
    0690 - 9e 7d 22 c3 a4 a3 c9 53-a8 7b 95 8d c2 0d 43 d8   .}"....S.{....C.
    06a0 - b4 ff 14 29 6d e5 71 e1-91 f0 37 cb bd ba cb 95   ...)m.q...7.....
    06b0 - 2d 20 a1 43 88 0e 5d 13-3b 8b 8c 68 00 2e 49 0d   - .C..].;..h..I.
    06c0 - 42 a4 87 ff 02 d6 42 a0-0c 54 42 db a3 b9 e6 83   B.....B..TB.....
    06d0 - 23 5d 0d d8 61 37 e4 10-87 69 2c 58 ad 71 6e 41   #]..a7...i,X.qnA
    06e0 - 66 04 83 cc 94 7b 01 59-bd 4b cb 93 00 76 b9 db   f....{.Y.K...v..
    06f0 - 84 e1 2c d8 6f 69 2b c1-79 fa 90 23 a1 b8 bc 47   ..,.oi+.y..#...G
    0700 - ec a0 5c 1c b8 29 3e b9-5b 83 5f 0a e4 94 8d 85   ..\..)>.[._.....
    0710 - 2e d8 c1 4a ba ad b9 c9-6d e3 57 36 59 b4 48 5a   ...J....m.W6Y.HZ
    0720 - 85 e9 25 68 8d 85 6f ad-b8 f3 27 b4 66 9e 30 ba   ..%h..o...'.f.0.
    0730 - 9f 75 cb 9d 5a b5 9e fd-ce f5 0b 14 af c0 c3 56   .u..Z..........V
    0740 - 43 10 eb 43 47 9f eb 6f-53 ba d6 17 59 e2 56 9e   C..CG..oS...Y.V.
    0750 - 4b f1 a4 cd 4c 37 6a 84-c2 14 48 32 87 3b c2 2b   K...L7j...H2.;.+
    0760 - ae f7 54 0b 8b 19 ff f9-ad 73 9e 4f 50 00 0f 1a   ..T......s.OP...
    0770 - 49 32 49 be 3f 24 e0 bd-f9 4c d8 ad d3 fd f9 af   I2I.?$...L......
    0780 - c2 a2 1e dd 8c fb 74 26-76 b5 12 19 c0 61 27 72   ......t&v....a'r
    0790 - be f9 58 6a 85 c5 cd 40-43 8b 79 9f 0e 2f 64 a2   ..Xj...@C.y../d.
    07a0 - 7e 1c 14 d0 f1 84 11 54-b2 59 cc 97 25 6b 4b bd   ~......T.Y..%kK.
    07b0 - 89 a4 51 e7 0b 5d 9c d5-73 e6 42 0a 62 1e 9a 7f   ..Q..]..s.B.b...
    07c0 - a8 86 72 fe 08 5a 17 8c-dd 97 c5 e8 71 9a 28 aa   ..r..Z......q.(.
    07d0 - 94 7e e3 ad 04 d0 ce a5-37 cf 0f ba 0d e9 3f 8b   .~......7.....?.
    07e0 - 74 1a a3 25 32 92 89 29-45 5a 12 6a e9 44 92 be   t..%2..)EZ.j.D..
    07f0 - 46 aa 1c b3 b8 ee a1 9f-fd 66 47 a8 52 8e 24 0b   F........fG.R.$.
    0800 - 7f af 6a a7 e9 e7 85 a8-be 09 58 c9 4a 1d e1 3a   ..j.......X.J..:
    0810 - fe b9 4c b4 2b 3b 40 32-df 7a f4 63 20 4c ed 2c   ..L.+;@2.z.c L.,
    0820 - 40 31 86 92 d2 e5 6f 47-a1 46 4c 67 65 25 a4 a9   @1....oG.FLge%..
    0830 - 13 ab 32 d3 31 bd f7 7f-8b 4f 5c 34 1a 95 dc c8   ..2.1....O\4....
    0840 - 77 10 8e 16 54 8b af 72-f8 ba 72 d5 6f 68 12 55   w...T..r..r.oh.U
    0850 - e0 76 5f 93 79 02 56 f9-b3 f4 6c d9 bb 33 54 9e   .v_.y.V...l..3T.
    0860 - 51 d3 60 9a e8 fb 1d b4-14 50 bf 02 67 31 4a 19   Q.`......P..g1J.
    0870 - 25 c4 99 aa b7 65 0e 40-9f 3f 37 ee 31 74 51 f8   %....e.@.?7.1tQ.
    0880 - 9b 03 17 14 cf 56 e7 de-5f 3b 01 46 28 9d f8 7d   .....V.._;.F(..}
    0890 - 34 c0 ce 79 72 31 42 3e-72 fe 5f a7 63 45 23 42   4..yr1B>r._.cE#B
    08a0 - d2 1b 72 77 33 aa 3c c7-b2 8b 7e 85 32 f8 ec e8   ..rw3.<...~.2...
    08b0 - 1e 69 44 8a f4 11 2e ca-f2 b1 76 80 ff 08 a5 8d   .iD.......v.....
    08c0 - 45 c0 bc d5 42 2e 37 9f-0e 7a ea 29 86 fa cc be   E...B.7..z.)....
    08d0 - 17 4b 3f e0 eb b6 88 04-84 89 9a 7c 1d 77 f5 79   .K?........|.w.y
    08e0 - 8b 88 67 2a eb 85 5a 58-9a ab 9b 71 a0 eb 7f 57   ..g*..ZX...q...W
    08f0 - fe 5c dd 82 fb 43 c1 8d-19 d0 ef 7d 1b ef f4 65   .\...C.....}...e
    0900 - a2 f6 fe a0 22 a9 98 c9-d6 b0 f9 70 83 d3 33 11   ...."......p..3.
    0910 - 36 e4 fe 6e 96 55 d0 b3-46 d9 d6 0a df 71 3f f2   6..n.U..F....q?.
    0920 - aa 10 e8 12 98 56 57 4f-cc 04 1f 80 fd d2 c1 19   .....VWO........
    0930 - 7a d4 8a f7 dc 9d f9 fe-da a7 41 44 a7 fa d2 fa   z.........AD....
    0940 - 09 a6 4e 04 96 85 ee 82-2f f2 63 81 37 5e 20 9e   ..N...../.c.7^ .
    0950 - 0d 56 d8 e0 35 5c e1 bd-bc 2c b5 9b 23 a7 bc 97   .V..5\...,..#...
    0960 - 36 67 16 52 7e 49 04 d9-2a a5 5d 14 27 92 4c 65   6g.R~I..*.].'.Le
    0970 - 9a 36 77 da c7 e8 1c 1f-78 9d 37 6a ba 2d 71 66   .6w.....x.7j.-qf
    0980 - 50 18 e0 d1 34 3d 14 7e-dc ff 8b 0f 05 77 33 93   P...4=.~.....w3.
    0990 - d3 2d 98 6a 99 43 1a 28-7d d9 7b e2 99 0a ee ee   .-.j.C.(}.{.....
    09a0 - 5e 0f 44 0c 61 d1 32 0a-73 d0 99 6e 52 57 61 e9   ^.D.a.2.s..nRWa.
    09b0 - 94 f0 4b bf e3 0a c8 80-c5 86 d8 4c 9c e3 39 37   ..K........L..97
    09c0 - f1 1c c9 d9 13 9a 31 18-69 50 ee 89 99 45 70 70   ......1.iP...Epp
    09d0 - 2d 78 cf 9e 5b 09 21 01-d6 75 83 96 08 bb bc 6c   -x..[.!..u.....l
    09e0 - 22 9e a3 68 72 23 75 f2-50 7b e1 32 d7 03 07 39   "..hr#u.P{.2...9
    09f0 - f1 04 e1 78 13 ea 68 54-58 8c fc 93 e1 1c b3 95   ...x..hTX.......
    0a00 - ef 55 d6 10 f5 4d fc 68-02 70 95 49 1d fa 64 43   .U...M.h.p.I..dC
    0a10 - 56 bc 63 fe 1e 58 65 d5-b8 cb 42 11 01 8b 80 20   V.c..Xe...B.... 
    0a20 - ac a9 39 bd e6 66 7d ff-28 51 8d a1 9d a4 47 b1   ..9..f}.(Q....G.
    0a30 - 98 c4 7d 5f 5c 2e cd b4-10 fc 45 de 71 44 c9 c9   ..}_\.....E.qD..
    0a40 - 80 47 29 b7 e8 83 2e 43-a6 a2 e5 77 26 66 28 b3   .G)....C...w&f(.
    0a50 - 33 e8 95 6e 8c 87 67 08-a2 bd d8 b9 20 c3 a0 b4   3..n..g..... ...
    0a60 - e6 be d7 ea 1f 94 41 cf-26 ff 55 13 8b d6 49 3f   ......A.&.U...I?
    0a70 - d8 e4 5c 90 83 06 a0 44-6b 0c a0 32 54 f3 2c 55   ..\....Dk..2T.,U
    0a80 - 08 23 47 77 d7 6f 17 52-bc fc a8 bb 6d 3b c2 62   .#Gw.o.R....m;.b
    0a90 - a2 99 19 51 23 eb 70 0f-45 21 33 15 bd 2e 42 92   ...Q#.p.E!3...B.
    0aa0 - e5 e6 4c 6d 8e 20 85 52-c0 3b 83 7c 00 b4 1f 9f   ..Lm. .R.;.|....
    0ab0 - 83 07 75 de 51 78 8a 5e-4a 27 79 0c 45 85 9d b3   ..u.Qx.^J'y.E...
    0ac0 - 8c f5 a5 da 11 61 99 b7-3a a5 81 a7 91 1e 86 ae   .....a..:.......
    0ad0 - 21 56 47 50 34 04 f5 8c-4d 4d a3 97 1c 98 8f 4e   !VGP4...MM.....N
    0ae0 - d5 21 13 93 9f 2f 78 a8-86 b3 6e 39 62 cd b0 1e   .!.../x...n9b...
    0af0 - 89 94 96 24 08 1b 71 8b-f6 e2 0a 88 d7 40 e2 37   ...$..q......@.7
    0b00 - e0 dd c8 4b 6e 1e 12 0b-3c c6 18 dc bc 07 45 26   ...Kn...<.....E&
    0b10 - 4d da b0 6a 08 48 66 11-84 30 43 19 ea 17 cc ea   M..j.Hf..0C.....
    0b20 - 51 c7 b1 dd b8 1b 73 13-38 08 c0 38 27 f9 ed 79   Q.....s.8..8'..y
    0b30 - 6b 99 4d ed 5c db 0e 4f-78 cb e2 da 5d 95 ca 14   k.M.\..Ox...]...
    0b40 - a2 d6 0d 9e 5f c4 60 8a-e4 ee de 0c 33 01 f7 65   ...._.`.....3..e
    0b50 - c7 ae d6 c8 84 7c 43 f9-e2 92 79 88 dd 15 bb 5a   .....|C...y....Z
    0b60 - 55 71 5c 50 2b 52 8f dd-7f 85 27 c9 b8 ae bd e4   Uq\P+R....'.....
    0b70 - 22 09 de ac ac bf 5a 3d-8d 40 7b 8c ca a0 03 5f   ".....Z=.@{...._
    0b80 - fd 65 bc 80 c9 56 28 fa-e0 4d 74 d2 bf f6 78 b4   .e...V(..Mt...x.
    0b90 - 5b e3 6c 92 0a 08 0b a4-9e 51 e0 06 25 35 21 c7   [.l......Q..%5!.
    0ba0 - 04 ee 37 9d a7 cb 49 7c-66 58 05 6b 6d 50 dc da   ..7...I|fX.kmP..
    0bb0 - e9 99 41 c5 6a 4a b9 42-98 93 3b 23 62 8f b7 60   ..A.jJ.B..;#b..`
    0bc0 - f3 78 39 af 53 86 4b 6f-98 95 3e 4a 04 13 a4 d9   .x9.S.Ko..>J....
    0bd0 - e3 f2 44 de 03 ea 88 9b-fa 52 3a 27 6b f1 06 96   ..D......R:'k...
    0be0 - 49 76 87 99 57 61 58 ef-bb 0c 08 c1 07 48 26 92   Iv..WaX......H&.
    0bf0 - 7d 88 25 b4 64 39 cf 7a-44 95 b2 e8 58 74 06 7a   }.%.d9.zD...Xt.z
    0c00 - 65 ca fb 95 fd e8 fc 27-cd f3 09 99 bf fb fb d9   e......'........
    0c10 - 69 28 c1 10 65 6f 6a dd-14 96 f1 e3 6d 1c a3 20   i(..eoj.....m.. 
    0c20 - c4 20 91 9c ea 78 e1 ae-d0 0a 2b 0b 95 f5 db 6a   . ...x....+....j
    0c30 - 9c bd be 7c cb 42 b0 2c-e9 89 b8 9f be 6b a9 e6   ...|.B.,.....k..
    0c40 - a0 44 93 15 99 df 5a 1d-e3 b9 73 cd 95 d9 c3 c9   .D....Z...s.....
    0c50 - 75 8b 76 06 6f 81 01 b7-76 b6 82 ba e4 0a 74 02   u.v.o...v.....t.
    0c60 - 54 80 c4 58 54 cb 33 26-35 25 73 24 cb 77 12 49   T..XT.3&5%s$.w.I
    0c70 - 7b 55 af c7 d9 82 cc 5c-22 1f 0f 20 e2 28 dc 86   {U.....\".. .(..
    0c80 - 3c d3 15 75 db 90 b5 9b-e0 04 1b 63 ee df 26 60   <..u.......c..&`
    0c90 - b0 ea 49 cf 21 90 9b c7-1c 3d 61 f0 1e 86 45 dd   ..I.!....=a...E.
    0ca0 - 4a af 39 9b 24 c4 36 a9-99 78 63 9e 7f 52 62 b2   J.9.$.6..xc..Rb.
    0cb0 - ed ba 2f ee 17 83 82 fb-22 82 e0 84 02 25 a3 f1   ../....."....%..
    0cc0 - 6c 32 f9 66 60 47 25 ac-0f 46 ac 9e 85 8b df fc   l2.f`G%..F......
    0cd0 - 7c e5 38 00 63 06 67 51-c2 80 02 5a 66 a3 58 8d   |.8.c.gQ...Zf.X.
    0ce0 - 5a 44 1c a1 6c 32 a0 7f-ca 7c e4 ce fb de 41 87   ZD..l2...|....A.
    0cf0 - b3 48 c8 8a 21 ff b6 80-e9 c8 67 3f 5e 17 fe a4   .H..!.....g?^...
    0d00 - 47 3d ad 5d fe 22 9c 99-ef d0 b4 69 9d 53 9b bb   G=.].".....i.S..
    0d10 - 9d 8b 6e 1f 17 ce d7 35-d5 17 79 51 bb 01 c1 b3   ..n....5..yQ....
    0d20 - ee df 22 e3 b7 d1 d3 ad-41 39 e6 52 ea 74 69 10   ..".....A9.R.ti.
    0d30 - be ea 25 49 7e 97 a9 92-ed 4a ea 72 2c d8 2c 20   ..%I~....J.r,., 
    0d40 - c6 07 a5 4a e1 09 1d eb-eb 89 22 a1 c6 ca d9 d6   ...J......".....
    0d50 - 96 b6 c1 b6 26 3b 70 87-95 58 c9 b5 f4 cd 6a 59   ....&;p..X....jY
    0d60 - 46 d6 51 c4 3e b7 26 78-79 97 87 f5 95 ad 82 82   F.Q.>.&xy.......
    0d70 - b3 68 4f f8 71 8d 5b 04-57 a4 ff 13 41 97 44 c5   .hO.q.[.W...A.D.
    0d80 - 68 c3 7d 80 c4 bc 84 bc-58 7b 41 cd 45 98 18 11   h.}.....X{A.E...
    0d90 - c3 66 18 90 9d eb f6 ea-fc 6a a6 78 8c 83 c3 dc   .f.......j.x....
    0da0 - 0d c8 33 16 bf 6b 52 da-ad 26 87 2c 28 ad 52 b7   ..3..kR..&.,(.R.
    0db0 - 3b 6d 00 15 2d fb 90 f2-69 bc b7 76 7c 9d 58 a7   ;m..-...i..v|.X.
    0dc0 - 28 fa 2a 1c 45 fd 95 cd-96 65 76 33 3b c7 55 b1   (.*.E....ev3;.U.
    0dd0 - ec ce 30 72 a9 d7 a1 62-8e 7a f8 2d 12 a5 45 26   ..0r...b.z.-..E&
    0de0 - 09 07 10 9a 11 eb b5 38-50 c5 22 7a ae 82 42 2d   .......8P."z..B-
    0df0 - fe 54 a1 c6 73 e0 6c 0f-81 4c 3b 4e f5 72 86 92   .T..s.l..L;N.r..
    0e00 - 81 f5 a6 0a b0 59 44 3c-83 13 89 56 94 f1 39 68   .....YD<...V..9h
    0e10 - 6d 3a ac e0 01 f9 61 88-ff c8 a0 49 a4 85 4f 37   m:....a....I..O7
    0e20 - 55 04 7f b7 62 26 86 a4-c9 82 4f 33 e1 22 8c 62   U...b&....O3.".b
    0e30 - a1 be 32 29 48 cb 16 8c-5c 5c bb 95 05 f1 bc 24   ..2)H...\\.....$
    0e40 - 08 2e d3 b4 c6 84 8a 1c-7e 59 87 62 91 b4 45 ec   ........~Y.b..E.
    0e50 - ea 9b 83 d4 2e e6 af fc-2e 6e b5 f6 51 60 85 fc   .........n..Q`..
    0e60 - 66 4f 39 b3 ea 14 8d 30-af e9 ab cd 7d d0 68 39   fO9....0....}.h9
    0e70 - b9 53 0f ca 64 6c b0 0d-87 fa 29 f8 2f 3d 21 c1   .S..dl....)./=!.
    0e80 - fc 62 75 61 46 11 a5 b8-65 99 b5 23 47 92 61 0a   .buaF...e..#G.a.
    0e90 - d2 53 37 5f b8 09 26 62-4f d4 d4 69 5f 2b b9 a8   .S7_..&bO..i_+..
    0ea0 - 58 75 88 57 5a d1 f8 61-1b f8 90 58 68 0c 4c d9   Xu.WZ..a...Xh.L.
    0eb0 - 39 b7 6a c3 ca 91 9b 21-0d 70 b1 0e 20 f2 df b6   9.j....!.p.. ...
    0ec0 - 36 28 53 d3 c3 b7 4c 17-dc 00 ee b8 83 cc b1 f3   6(S...L.........
    0ed0 - 32 35 25 db a0 82 7a ae-09 9f 05 18 25 01 b3 90   25%...z.....%...
    0ee0 - af ac 42 2e a0 07 c9 20-c7 a7 b0 28 3b 0f e8 87   ..B.... ...(;...
    0ef0 - fb 77 ba b7 93 67 c7 96-66 c8 a5 58 6e 71 cd 41   .w...g..f..Xnq.A
    0f00 - 8f 90 33 d2 0f 93 b0 f9-07 b3 36 ab a3 98 e1 f4   ..3.......6.....
    0f10 - 1c eb 18 90 ff d8 a2 f4-2b 91 2d 35 c1 b4 cc 81   ........+.-5....
    0f20 - d8 35 7b 17 ad 3e ab 69-dd c8 fb 8f 10 09 a9 e5   .5{..>.i........
    0f30 - 1e c2 5a b8 c4 8b 9c 83-32 15 4a de 29 92 e0 dc   ..Z.....2.J.)...
    0f40 - e8 f4 d1 61 04 7a d0 ac-c5 b5 a2 a2 d8 55 a2 a1   ...a.z.......U..
    0f50 - c4 12 4f 0e fa 9f 1d 49-16 74 f9 dc 4d 99 08 12   ..O....I.t..M...
    0f60 - 6a ff 2d dd dc f4 23 b6-9f 06 b5 a0 05 0e 44 3c   j.-...#.......D<
    0f70 - be cd 95 47 dc ad c5 6f-e9 aa ec 16 f1 a9 6b 69   ...G...o......ki
    0f80 - 82 83 49 c6 66 c0 01 68-87 2d ec 94 8e d5 67 9d   ..I.f..h.-....g.
    0f90 - 4d 24 4d d8 88 40 4b 90-6f 55 a0 a5 6c 6b 89 ff   M$M..@K.oU..lk..
    0fa0 - f0 34 3b 35 c7 6b 8f f0-94 90 67 7d 97 6e a2 02   .4;5.k....g}.n..
    0fb0 - e6 e5 35 46 a4 10 2a e2-be d3 08 32 f4 ee f5 28   ..5F..*....2...(
    0fc0 - e2 c4 c6 70 a9 2e cf 6b-08 d2 48 d1 e0 ef da ab   ...p...k..H.....
    0fd0 - 2b 4e 5b 0e 95 34 a3 e1-25 47 4f 1e 9b dc e5 19   +N[..4..%GO.....
    0fe0 - a7 b1 93 d8 aa 59 71 4a-02 78 5e c3 ad d1 50 0c   .....YqJ.x^...P.
    0ff0 - b5 00 9b e2 98 b5 af db-73 15 5d d8 c4 b3 5f d0   ........s.]..._.
    1000 - 2b c1 d0 cb ff e8 9a e6-f4 b0 88 98 91 50 da 51   +............P.Q
    1010 - be f6 9c 50 47 fc da 47-05 23 ab ae e8 0b 26 a6   ...PG..G.#....&.
    1020 - a8 80 63 6b 68 15 78 dc-4e 2b 0b e4 c9 d0 a7 25   ..ckh.x.N+.....%
    1030 - 64 72 1e 61 8d 41 3b 10-ed cb ce 0b 5e df 23 c5   dr.a.A;.....^.#.
    1040 - 0a 52 25 45 13 4f 97 e2-a0 6c e5 be 53 02 8b 6f   .R%E.O...l..S..o
    1050 - 9e 1f 69 54 aa 8d bd 47-f1 40 1a e8 29 b9 03 d8   ..iT...G.@..)...
    1060 - 2f 88 6d 92 41 90 8e 4c-c7 a6 a7 45 80 3e 1f f5   /.m.A..L...E.>..
    1070 - e8 18 ef 96 9b 67 1f 74-2a 28 47 e7 70 5f d0 3f   .....g.t*(G.p_.?
    1080 - 0e 1d 05 ac 5f 76 0a 91-bd d6 d1 fc 8e 7d 84 cb   ...._v.......}..
    1090 - e0 ea ed ee da b5 72 4c-44 14 13 3c 7e 45 47 d0   ......rLD..<~EG.
    10a0 - 07 2e ae 58 b4 6b 02 15-7e 3e 21 f3 56 77 a8 0a   ...X.k..~>!.Vw..
    10b0 - 02 4c 73 33 be d8 0c e1-12 f9 93 7d 95 5c 74 7f   .Ls3.......}.\t.
    10c0 - 17 a6 0a 1a ca 9e 7b 1c-1c 0f 7e a1 1b 3b 9a a2   ......{...~..;..
    10d0 - 4e 46 92 6d 3e 1d d1 91-ae d0 90 34 76 48 e8 9f   NF.m>......4vH..
    10e0 - c6 21 1c c9 89 c9 f8 f4-99 fc be 9b f1 d0 04 c5   .!..............
    10f0 - 84 d8 57 38 4a aa 0b 2d-f8 86 94 48 90 fb ff e3   ..W8J..-...H....
    1100 - 29 47 90 11 45 98 fb 81-2b a5 70 58 74 dd 16 05   )G..E...+.pXt...
    1110 - be 1f 02 47 af dd e2 3f-15 c8 c7 12 e6 91 7f 85   ...G...?........
    1120 - 39 f9 80 69 91 b7 12 b4-74 78 3a 1c f5 cd 03 5f   9..i....tx:...._
    1130 - 60 9c f2 ea 2b dc 01 d3-18 a0 29 8d a8 c2 93 1f   `...+.....).....
    1140 - c4 f5 35 ab e4 5d 9d 1f-3a 4d da 2a 16 52 33 12   ..5..]..:M.*.R3.
    1150 - 70 d0 58 1f 91 a7 55 13-08 8c 64 ec 8f 11         p.X...U...d...

    Start Time: 1763722705
    Timeout   : 7200 (sec)
    Verify return code: 0 (ok)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
```







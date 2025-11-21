# Cas 2

## Configuration

script :
- generate-certs-cas2.sh

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
   v:NotBefore: Nov 21 09:54:59 2025 GMT; NotAfter: Nov  9 09:54:59 2075 GMT
-----BEGIN CERTIFICATE-----
MIIFpTCCA42gAwIBAgIIEOAzmv3+3SUwDQYJKoZIhvcNAQEMBQAwRTELMAkGA1UE
BhMCRlIxEjAQBgNVBAoTCUhhbmRzaGFrZTEiMCAGA1UEAxMZSGFuZHNoYWtlIElu
dGVybWVkaWF0ZSBDQTAgFw0yNTExMjEwOTU0NTlaGA8yMDc1MTEwOTA5NTQ1OVow
VDELMAkGA1UEBhMCRlIxDjAMBgNVBAcTBVBhcmlzMRIwEAYDVQQKEwlIYW5kc2hh
a2UxDDAKBgNVBAsTA0RldjETMBEGA1UEAxMKYXBpLXNlcnZlcjCCAiIwDQYJKoZI
hvcNAQEBBQADggIPADCCAgoCggIBAJ6lorNcFJMNtdFVmobXNoJYjAiwfS54DIfI
E+MrFZs94ZITuFksT7k0xcE7gOevBR3OxrPcTq7OKAv4elC4dTMf/uAjShIw4xzN
pQE7fKvhVrB+hHIwlD9LB+kD9FnOfB1bFBHRHjPGNUA0f23boMR2Y3NX6RvZq4EQ
OkwxeFyMhGkEjaR7ZlxCvAIPezHzc4hXJUCW/8TE7ME0+u43CtJZ8ILyhQochI5U
/xKLrnNCBrNBOevGLD2GAwBuR/EYSeQywGGcpU3+gFxS1/ssirLZxObwXWu8wh3d
YQXL8VOKlT7FJvvVqxrV5MANAI15tbprC6msxK4uASu7iGmlUD8SUE36haK5dRl1
fBCFcT3+s891rYPLhZoOCIbue4ksNWy2HH/XkGSWLU3bvpbJyvUEnxonBcQvrvwV
ziFmhArR8AJQ9Ug+oZ+2oOqYlBcyZzDGY4EBK0ARfIBWYfEkDC4JLcU6zbDTDhg1
eJhrb/ledfDCHvtZQ1msvSPZAsnrkpuoN8lWTMtKxMGA1PkE0ZFf1oW8jz4oIBP3
fGA+4DlFhBbaBC3NAfVGsq4iWkqTdAsKtjBSoIdWld4S9g2aIYX2DhkUIM/UD7VJ
yAkdX2LkU/lgjSwkw7sbKQ80d7TyK/gmaFK/NzKAR7j1BYeIEamImhfwRA3SI2FI
8iQxUvexAgMBAAGjgYcwgYQwHQYDVR0OBBYEFHQ4AIpuuKG/LKyAK98qx5bFiQi3
MAsGA1UdDwQEAwIFoDAgBgNVHREEGTAXggphcGktc2VydmVygglsb2NhbGhvc3Qw
HwYDVR0jBBgwFoAUXc8cEEAXKDA3KgcHFa9q3l+5m7MwEwYDVR0lBAwwCgYIKwYB
BQUHAwEwDQYJKoZIhvcNAQEMBQADggIBAIkC94S9OUj5ETzb96EmrYYTNePIrZKt
rFNkT19GKOE/5ypYCxQKCAsREdAW1RR8MceJO4DfjNbW5og66VmbtTUlfdYIooZV
54MUOhJWqIWHhhOcEOU0sYwWK6aHPyyFoexN24wbP3R85JlFNOj5Qy+9DhUNt/fW
olIlmua95zbNQySlmZp7+O8iRlcDZdzadSxkdZe2npKX6EzCD3APBEmj0m/fht/L
SK7wmjUxJ8rrwfHo4vmVth29oAK6BhZyWG/I1nJMXN0wfBxlGOSBmrfe/mPKwmjW
BKrNOe8p3g2Ohw6alAPYPXulVT0JCPPzbeIPSuLrgaeakoan/K4D7SrSVblgvxnK
juwb/TSSQwGV0RvAoFPHVVTzLXHQydVPE9Zzmq1D0Tf560WtecFLm2OR2bYKMKBT
gSOQ+vzsPN1dtAdwcUxa8L0rxjGMtggvHwqusoJmesEGAUcLO1c+y5xFD5I7JPp4
jsrW/no6rGpnKpSKX9GjlspCGTcfLmQKSS1gsyDjVe7jx7exfvMi7sh0fb+jibwO
ULNFXVv+S6owY6R8zDwq7Iwz/WY93UbF0cDu4dTtAsGA0S9Dtz1Va6/pFgk61w/h
iAdgHnnE/9OcZ57bI7l5/I+i5VsS+weNE0OkoQ/sdkrtLQw/r/lWJrxvsIMY7kDB
EAMsKxjw3Wz9
-----END CERTIFICATE-----
 1 s:C = FR, O = Handshake, CN = Handshake Intermediate CA
   i:C = FR, O = Handshake, CN = Handshake Root CA
   a:PKEY: rsaEncryption, 4096 (bit); sigalg: RSA-SHA384
   v:NotBefore: Nov 21 09:54:57 2025 GMT; NotAfter: Nov  9 09:54:57 2075 GMT
-----BEGIN CERTIFICATE-----
MIIFbTCCA1WgAwIBAgIJAP8RRiGp2ONRMA0GCSqGSIb3DQEBDAUAMD0xCzAJBgNV
BAYTAkZSMRIwEAYDVQQKEwlIYW5kc2hha2UxGjAYBgNVBAMTEUhhbmRzaGFrZSBS
b290IENBMCAXDTI1MTEyMTA5NTQ1N1oYDzIwNzUxMTA5MDk1NDU3WjBFMQswCQYD
VQQGEwJGUjESMBAGA1UEChMJSGFuZHNoYWtlMSIwIAYDVQQDExlIYW5kc2hha2Ug
SW50ZXJtZWRpYXRlIENBMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA
kVXw42/0sCdslV8dcWhuEWLKZNzerVgPGW30O/9UWB5H0P84v3jWFSjvV6kfTLfc
U8pRJ1b2LCk7DzRNSr3MJKdEZvBSXJ9a5pWMEGfNJrl5NSRAG6Fbr6Bgc1w1c1JF
JrOP6kF65AWYBMH/Cnqk2sIWb/NVc5zJiFr23XRRacLIKuqoedszvJl8VTkC7+Ej
rgJdWPxGrlM/Dkd9zxL5d9o2hGNnJz5GTE2WqH+YcGwi3dw1dpfnPMbHBCLSEsvT
rFPDzI3vmW97rd14zrTtxWJWsbRMCUB9gOyw9ADzkFLGMShUKend7bDju+YEBW3V
+RGXVhpWh5tX2eX/LHDJHIrqmpUmh/BzQAlgwLv51Uo7zRhA4FYLRRHRF/r1pnML
wCQ2ibDNaNtYZAm3+WCWOSFid+tPWNSdU8eVxmrC4LPuTUhbMlRqtxXndEHBM/Wl
5EX46ww6QbUExjPXebo4JfkHiL6veAeMYPVkfpOJrEVHSLFjjywohS6xQQr1AhNI
NlIxrvaidZrIRmClcT/eQTEJV9fm08aT+h9vqUrWZGN/GT9v7jHjXmOOE7Eur7h6
fdVc7/fDOTsnfYSXaGqWX27uoQAElVN/njnYREX+RgHsCLITXOJkOS3Xv2STQ0yl
cdu5+clalZvigRI1uCe7tTXvhQEVL5HQDixE/0PgUNECAwEAAaNmMGQwHQYDVR0O
BBYEFF3PHBBAFygwNyoHBxWvat5fuZuzMA4GA1UdDwEB/wQEAwIBBjASBgNVHRMB
Af8ECDAGAQH/AgEAMB8GA1UdIwQYMBaAFMVc/WP/ivIhUp9ENyDB8ima3bm/MA0G
CSqGSIb3DQEBDAUAA4ICAQAv7H4k2DgD/8gMVBuyqyFJeBJXwvrNFLE9hpfQlSIJ
ergpYlgwW6kwu01fiI07Al0TXOtknj5oPt1EppiENf0aigcNcwKXTxvCjjk0YrA8
knAQr9zgidTiGiuHJlvRXo33SFQW4UXSfLgxTzABl76Zfl/mOsAkdFyHQDe5GTEs
ZbR5UWDg2vf//drmjxqewpn4WzoO2dZjxgPZLqRHW2LKInvt5+dQrzS6wKxcRKnl
DizECaAfWQ01+H8aDm67fNMMO2ubJPAOvcjLuJzamXovioxU2BRmfyu4YyhBPd4i
L3FN8P2NtzLAf0iIdi6yH22X5B2sGYFSq+RzzOSTH+585sCQCMZCXwRBx1WUtilA
mO6QjrNI1hxtR0MvyU2g1vBRl+1apbC1/VFe1TiyKaEqhM3sfd0OxSvz61Xb4ME1
BB4tRorrOBqz+iPAFJWBSle0HPMqtxy0g0tSrOcHhB/TvjQCrNegZObEbghAA6Oh
mviIcyOzU2oH4OJnpgrvMiflFCRkQ/gPVV/6WtlY54N48qlujVjHATZyfCkabAVR
I4rdkEsW3YRhgC80T9B4nW4cFjCCBr3rYpgoZcl3bErBMNeQB0GYNGpbDKUQcONR
meZ59seyCmK6eqiY4WuwFkzx6Ccdr/jcMmDjgPANgycLvGKD4Omg2T17MqbsEKU0
cw==
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
SSL handshake has read 3635 bytes and written 392 bytes
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
    Session-ID: F4C48D97EBCD2E318FBCA3F3A3C5A01521531BAD43C0B28778CBB11471ADCEA8
    Session-ID-ctx: 
    Resumption PSK: BD89F476AE1D9E04AE1A0872E31189778C05C8731DF1A0B35C0C9D5F1241CF596EA151CEF088ADB58CAFADCBB79910DF
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 86400 (seconds)
    TLS session ticket:
    0000 - 13 f2 b8 47 2c e9 98 5a-01 46 18 97 c1 79 21 32   ...G,..Z.F...y!2
    0010 - dc 5d 0f 7e df e5 86 85-b1 12 b8 bc 8a f8 5f ea   .].~.........._.
    0020 - be 60 97 4e 06 ca 5f 4b-0d 56 e0 9d 3e 14 43 99   .`.N.._K.V..>.C.
    0030 - c7 91 67 eb 80 a7 47 04-a8 22 86 1e 8c 7c 42 3f   ..g...G.."...|B?
    0040 - 21 24 9b 10 23 dc 71 ef-ac cf 7b 56 6b 26 32 93   !$..#.q...{Vk&2.
    0050 - b9 4e a9 4c bc a6 6e 06-9c cc b7 c8 c6 e7 54 89   .N.L..n.......T.
    0060 - 2a ae 71 f4 b6 61 71 80-ba 36 f9 af d5 62 a2 e5   *.q..aq..6...b..
    0070 - 3c 00 c2 50 14 34 49 68-e0 92 ff 30 e1 35 3a 30   <..P.4Ih...0.5:0
    0080 - bc a8 56 0c 48 66 25 c5-66 a6 47 0b b1 95 89 c6   ..V.Hf%.f.G.....
    0090 - e5 7f e5 bd 82 6b d7 d7-4a ae 00 8e 31 89 b6 fd   .....k..J...1...
    00a0 - 96 36 f9 ea 17 3a 0e 54-8c 0f ca 3b fe 18 5c 98   .6...:.T...;..\.
    00b0 - 6c f9 12 96 43 ff ff cc-6d b3 23 eb 27 db ff b1   l...C...m.#.'...
    00c0 - 36 ff 2a a6 01 5f e7 e4-56 b4 49 f0 76 70 f1 2f   6.*.._..V.I.vp./
    00d0 - 5f 3a 9b 1a d6 23 2f 86-ce a9 c3 c3 db 03 b0 0c   _:...#/.........
    00e0 - da a9 36 66 97 0b c9 1b-38 84 2e 1f 81 ed d4 19   ..6f....8.......
    00f0 - 68 4e 7d 3f 7a 08 76 48-15 4b bc c8 25 6e 42 7f   hN}?z.vH.K..%nB.
    0100 - 16 d5 7b 4d 30 a2 e7 7d-b5 68 30 28 a5 20 e9 a9   ..{M0..}.h0(. ..
    0110 - 69 da 4b 7a ab d0 88 2c-00 e4 52 f6 72 b1 57 54   i.Kz...,..R.r.WT
    0120 - 55 79 b3 8c 98 24 db e9-0e 70 96 b9 ce 92 4d dd   Uy...$...p....M.
    0130 - 75 ce e6 40 62 9c 01 eb-a1 03 2c bb 40 ba b3 97   u..@b.....,.@...
    0140 - e1 1e 1d 17 85 2c 19 40-79 45 d3 f1 5e 15 96 98   .....,.@yE..^...
    0150 - 6e d8 ef d2 2f 83 6c 59-00 04 aa f5 2a 4b 6b 06   n.../.lY....*Kk.
    0160 - 92 c4 a9 1f e0 9f 11 f0-39 f2 3e cd 73 de d7 76   ........9.>.s..v
    0170 - 91 fe 10 74 62 69 2a 58-0b ba 94 0a 89 71 f4 af   ...tbi*X.....q..
    0180 - 9e 99 98 c9 ac c1 e1 5c-01 45 68 9e d2 f3 1c a6   .......\.Eh.....
    0190 - 54 23 10 a7 27 92 e0 7d-c2 c0 4f f4 9f 4f b7 b8   T#..'..}..O..O..
    01a0 - 98 eb 35 6a 31 b8 bd a5-06 91 3d 84 bf b5 12 d1   ..5j1.....=.....
    01b0 - 30 32 f5 fe 34 e1 5e 78-2d 51 a0 fc a2 5e 61 7b   02..4.^x-Q...^a{
    01c0 - 33 af ce 96 bf b7 ce 44-77 78 58 84 1a f1 6d 17   3......DwxX...m.
    01d0 - 81 bc a1 1f c5 dd 4d 5e-56 6a e2 10 6d ab 32 e2   ......M^Vj..m.2.
    01e0 - 9f 3f 39 39 e8 94 6d 3f-9d a8 52 8e 5d dd 4b 29   .?99..m?..R.].K)
    01f0 - c2 24 67 4f a2 ab 77 e6-a5 26 21 ae d6 c1 9e ed   .$gO..w..&!.....
    0200 - be c7 2d be fc ef 2a ca-9d f9 1f 35 92 59 1b 3c   ..-...*....5.Y.<
    0210 - 50 62 af d1 60 6f 75 fa-8d 69 35 44 27 d7 19 4d   Pb..`ou..i5D'..M
    0220 - ad 1d dc 08 82 8c 6c fa-ef 27 10 d6 2d 85 82 87   ......l..'..-...
    0230 - ca cd 47 90 74 90 4d 1c-99 15 05 e5 4d 01 84 b4   ..G.t.M.....M...
    0240 - d2 99 f6 04 1d e5 06 e7-88 73 fa 70 b2 a6 e8 17   .........s.p....
    0250 - ad 3b 8a 1f ab 50 fc b7-9a 7a 7b c6 af 7f 4f b6   .;...P...z{...O.
    0260 - b5 90 9a ec 41 22 96 1a-13 1c 4a 54 bb df 4a 3e   ....A"....JT..J>
    0270 - 99 04 aa 57 93 8f ac 6d-35 18 df 44 8e 72 43 b5   ...W...m5..D.rC.
    0280 - 9d 60 49 f3 21 ec 67 c9-a6 2c 50 83 9f 37 11 a0   .`I.!.g..,P..7..
    0290 - f3 75 b4 69 2c e2 5f 24-5e 8e 9a 51 39 ad c1 62   .u.i,._$^..Q9..b
    02a0 - 05 c2 18 35 79 35 1b 02-f3 67 f8 17 8f 30 4b 20   ...5y5...g...0K 
    02b0 - 21 83 6e c7 e4 59 f6 3a-2d 8b 94 24 fb 4a 8e 6e   !.n..Y.:-..$.J.n
    02c0 - 98 9f a8 8e 19 f8 e0 37-bb d8 c1 e3 5b 67 d1 43   .......7....[g.C
    02d0 - 11 bd 27 4d 15 20 d0 f3-9e ee ff 3d b7 99 c8 3e   ..'M. .....=...>
    02e0 - d1 ff ac 4b e1 ba a6 60-3b d9 e7 02 e5 26 95 33   ...K...`;....&.3
    02f0 - 50 7a c7 22 e3 cb 1c aa-39 3b 14 72 24 0e a3 b9   Pz."....9;.r$...
    0300 - 68 65 80 b5 f9 13 75 6d-94 dc ce ea 03 8f 60 2b   he....um......`+
    0310 - 1e 19 35 35 f7 69 0d a6-c2 61 5d ad ba f5 88 0f   ..55.i...a].....
    0320 - 40 10 4b 46 0d 4c 2c 40-be 3f 7f 00 ca ce 4a 42   @.KF.L,@.?....JB
    0330 - 72 58 27 7c bd c9 f3 a1-75 7c dd 0e be 5b 86 19   rX'|....u|...[..
    0340 - 8f 4a 23 92 bc b4 ea 34-9a ac b2 2b da 91 64 30   .J#....4...+..d0
    0350 - 65 40 77 29 f3 d2 08 51-01 e2 ac 75 84 62 2d b1   e@w)...Q...u.b-.
    0360 - e0 11 6b ed 81 96 04 37-57 11 ed e2 77 02 73 62   ..k....7W...w.sb
    0370 - f7 d4 22 fb 82 02 10 23-d1 be e9 a5 45 af 1f bd   .."....#....E...
    0380 - 3d 6a e5 8b 42 53 4f 66-38 ef 3c 5f 41 11 1a d1   =j..BSOf8.<_A...
    0390 - 35 6a 30 b6 a7 35 ff 03-03 00 52 a5 13 b9 ea 55   5j0..5....R....U
    03a0 - c6 2e f6 66 dd 08 f6 99-12 88 bf a4 b1 ff e8 ab   ...f............
    03b0 - 3c 9d b7 34 64 46 c9 6d-47 82 8f 43 db 28 af 06   <..4dF.mG..C.(..
    03c0 - 16 3d 25 af c0 d6 aa d9-61 ea 96 08 24 73 57 3b   .=%.....a...$sW;
    03d0 - 2a d6 92 4b 07 68 55 48-cf 0a 32 12 e5 54 9b 49   *..K.hUH..2..T.I
    03e0 - 8f 5a cb 66 91 d9 24 88-cc 60 c2 cf a8 1e fe f7   .Z.f..$..`......
    03f0 - 25 7c f4 b5 5a 7e 4a c3-0c 95 fc f1 49 14 a8 8a   %|..Z~J.....I...
    0400 - c7 7a 25 bd ca b8 a4 56-6d 79 63 59 e2 98 ef 7d   .z%....VmycY...}
    0410 - c4 c9 b4 64 97 a5 08 c8-08 59 f5 7d 9c fe 65 70   ...d.....Y.}..ep
    0420 - f9 fe 82 b6 82 02 4f 50-44 76 da 34 e2 06 4a f8   ......OPDv.4..J.
    0430 - 2a 23 6c a0 56 40 b4 f5-17 7d 04 d4 da a4 e5 57   *#l.V@...}.....W
    0440 - 6c 5f 0d 9c 30 e0 41 bc-fd d1 d6 1e d5 22 3d 5d   l_..0.A......"=]
    0450 - e2 cc a3 b9 02 26 f0 05-5a 40 1c e5 7d 6d 45 94   .....&..Z@..}mE.
    0460 - 4b cf 43 05 8b 66 87 f8-38 f1 21 dd f6 dc 76 31   K.C..f..8.!...v1
    0470 - a5 b6 c6 e6 71 5d 07 c3-ab b6 47 a0 90 f9 1f 99   ....q]....G.....
    0480 - a1 77 c4 90 c3 14 3c 51-dc 77 60 98 3f 2a d7 b9   .w....<Q.w`.?*..
    0490 - 6c 3b 27 38 4f 78 a6 2b-1e 88 eb 90 24 94 33 62   l;'8Ox.+....$.3b
    04a0 - 16 e0 55 42 24 25 f2 00-5a 04 89 30 da 33 2a 6d   ..UB$%..Z..0.3*m
    04b0 - 8d 59 87 62 b4 0e 63 b1-70 b4 75 1c 73 3a 11 62   .Y.b..c.p.u.s:.b
    04c0 - 51 77 dd d3 d1 5c 8e 7c-3a 4d 96 91 79 c5 1b 84   Qw...\.|:M..y...
    04d0 - fc d3 b9 d8 f4 fd 47 5d-0a 53 77 1a 62 3e 83 42   ......G].Sw.b>.B
    04e0 - a7 f3 0b 77 ec 05 43 9a-17 d3 00 54 7f 21 aa b9   ...w..C....T.!..
    04f0 - 10 d4 af 5c 19 d5 79 44-a2 ce 71 90 8b ec 83 1b   ...\..yD..q.....
    0500 - ea 00 17 b4 13 ed 06 be-40 3e 9c c8 b7 96 d7 f5   ........@>......
    0510 - 09 4f a2 1b 60 3e b9 d9-6e f2 b6 94 8e 98 7d dc   .O..`>..n.....}.
    0520 - b7 59 94 11 9a d3 38 6b-8a 92 66 80 25 f7 83 74   .Y....8k..f.%..t
    0530 - 1f 1d 5a fb 94 8b 05 00-55 0a ba ab 9f 66 32 9b   ..Z.....U....f2.
    0540 - 08 b9 89 1b 9a 50 b2 4c-a8 c7 d3 1b 4e 28 d0 dc   .....P.L....N(..
    0550 - 68 31 0e e1 c8 7d 18 13-fb 1d 75 fd f0 88 81 50   h1...}....u....P
    0560 - ba 01 69 d7 db f6 c9 f1-71 50 fd 39 55 89 66 3f   ..i.....qP.9U.f?
    0570 - cc 9e a9 40 af a9 86 76-df 19 60 e0 a9 54 ac 9d   ...@...v..`..T..
    0580 - 9b 03 ad 83 e0 28 0a 0e-b4 ee 05 08 77 2d cd 3a   .....(......w-.:
    0590 - d5 6d d0 e3 f6 6d fb 9b-4a 97 0b b8 0c c8 34 01   .m...m..J.....4.
    05a0 - 7f 71 49 34 7e 4c f7 cb-ff 53 6a c0 2f 1c 16 70   .qI4~L...Sj./..p
    05b0 - a1 e6 e7 1a ec 87 14 aa-4a 1d e6 42 96 6d 90 fe   ........J..B.m..
    05c0 - 58 07 7f 1f f8 1b db 66-ba 4b a0 ea 2a 22 af 31   X......f.K..*".1
    05d0 - 68 54 e5 ce 34 1f 42 f9-db cf 33 f8 78 de 60 9e   hT..4.B...3.x.`.
    05e0 - 8d 32 3f 2d 97 40 cf 9e-78 0e 4a 94 d9 b2 fd 71   .2?-.@..x.J....q
    05f0 - 74 33 b9 fa 83 9d 0e 48-02 72 44 63 ef 84 26 4e   t3.....H.rDc..&N
    0600 - 4c e0 0f 9a e3 a2 6b 5c-d0 b4 ea b6 bb 08 a6 b6   L.....k\........
    0610 - c5 cc 27 b4 0d ad 32 6b-62 fb 92 b8 29 59 2d 62   ..'...2kb...)Y-b
    0620 - 76 a2 af 4e f6 89 15 f5-c3 cd 6d a0 85 73 3e 8f   v..N......m..s>.
    0630 - 9b 1d d8 ed 85 8e f8 90-d9 cc 4d 3b f4 ea 3d cb   ..........M;..=.
    0640 - cd aa 7d f7 49 6b c0 f7-2f d5 92 f7 a6 6d 02 5c   ..}.Ik../....m.\
    0650 - ac f5 32 c7 e5 9f 88 3a-34 2a c8 db 64 3f 10 21   ..2....:4*..d?.!
    0660 - 75 f7 1c 72 0c 15 65 01-e6 c6 0b c3 2e e2 aa d0   u..r..e.........
    0670 - 0b a9 94 06 e4 ed 06 27-bd cc a5 5a c8 95 8e d1   .......'...Z....
    0680 - b9 da 15 db 67 c6 3a e6-8d c5 d0 41 8b 34 b4 14   ....g.:....A.4..
    0690 - db 4f a2 f6 7b 2a 00 c0-45 79 99 d0 59 46 cb da   .O..{*..Ey..YF..
    06a0 - 9f 4f e6 17 08 9b e5 12-3c 59 c2 5a 52 2f 22 d9   .O......<Y.ZR/".
    06b0 - 6c 9d 8d 96 47 4b 81 ba-5a 9d 0b 9d 72 76 af 22   l...GK..Z...rv."
    06c0 - 97 d3 25 9e e8 47 c4 4b-f9 e3 8a a7 78 1f 43 ed   ..%..G.K....x.C.
    06d0 - a1 87 81 39 8e 84 7d d5-bf dc 91 bb ac 48 54 bd   ...9..}......HT.
    06e0 - 16 f5 bf 98 64 07 08 ef-ba e9 a5 17 49 f7 8d 04   ....d.......I...
    06f0 - 6c 57 0d ab 5c 24 2e 7c-98 fc 36 74 a6 f2 5e 89   lW..\$.|..6t..^.
    0700 - 25 5b a1 c2 33 55 2d 2d-4b 53 e7 f9 03 f9 7a 62   %[..3U--KS....zb
    0710 - 8e 5f 01 28 98 5b 1c 14-35 c6 eb f1 a0 9b 94 7d   ._.(.[..5......}
    0720 - 9d 79 6f 42 30 14 08 a2-27 f2 29 2a 72 98 98 1e   .yoB0...'.)*r...
    0730 - b0 54 da 15 3f 38 8c 4a-b6 b4 81 6f cd bd 26 a3   .T..?8.J...o..&.
    0740 - c0 0e 12 df 24 c6 3f 9e-ae 35 bf 2e 0c d0 e2 97   ....$.?..5......
    0750 - 65 71 94 64 e6 db 3d 23-44 a5 bf f7 1f 53 00 bf   eq.d..=#D....S..
    0760 - a4 9d 7c 90 f4 e8 8b 93-02 b5 2a 45 af 15 b7 02   ..|.......*E....
    0770 - 3f a7 98 12 a4 52 92 c6-78 b6 f2 c3 ac 62 55 f0   ?....R..x....bU.
    0780 - 43 cf 20 c2 a2 ac 3a 4a-7e e5 16 01 00 f4 68 d8   C. ...:J~.....h.
    0790 - 35 36 f1 13 5a d2 d7 32-8d 08 2f 02 47 c2 5e 16   56..Z..2../.G.^.
    07a0 - b8 20 80 5e f5 0d 3c 52-d4 a3 05 ae 60 24 f9 e3   . .^..<R....`$..
    07b0 - df 7b 64 33 62 07 a4 77-f0 78 9d 65 60 f7 40 8b   .{d3b..w.x.e`.@.
    07c0 - c3 23 cb 7f ce dc a8 6e-6b 77 7f ec d2 f3 7e 45   .#.....nkw....~E
    07d0 - 88 03 a2 f1 c0 d2 da 63-74 09 69 32 3e 83 e9 ac   .......ct.i2>...
    07e0 - 0c f5 bf 3c 72 92 46 7e-7f f3 26 f6 1b 12 db 2a   ...<r.F~..&....*
    07f0 - 39 d4 71 4d 51 7b 8d 43-6f fe c5 d4 5b 55 46 1e   9.qMQ{.Co...[UF.
    0800 - 83 00 c3 85 37 14 da a9-9c 52 0a b7 cd fd e8 a0   ....7....R......
    0810 - 7c 21 1e 70 ef da 33 2f-c9 3b cf a4 6f df b2 dc   |!.p..3/.;..o...
    0820 - b0 07 59 8e ed 79 22 5f-a6 d3 c9 14 d8 87 6f ad   ..Y..y"_......o.
    0830 - 20 91 35 9b 4d 35 f1 a0-23 90 f7 81 e2 bd da d3    .5.M5..#.......
    0840 - a9 37 77 8a b6 23 49 25-9a cf 98 96 81 52 67 59   .7w..#I%.....RgY
    0850 - 52 28 e8 9b 07 32 a1 8a-45 bf 46 b5 04 67 b9 20   R(...2..E.F..g. 
    0860 - cd aa 47 e4 88 15 e7 7b-b3 8b 13 1c c1 f0 ed 59   ..G....{.......Y
    0870 - 03 98 a3 c9 6f 58 ba 19-fd 24 15 a4 e6 51 ce f9   ....oX...$...Q..
    0880 - 7e 1d 93 88 5f b0 14 4b-9e 38 a4 8a 01 94 40 55   ~..._..K.8....@U
    0890 - 79 80 65 c3 5f 69 de e5-a7 8e 50 74 c5 7b 5b 17   y.e._i....Pt.{[.
    08a0 - 20 91 1f 92 64 af 30 bc-cc 0f 81 90 b1 9e 96 50    ...d.0........P
    08b0 - 4e f6 4f 31 7a a4 0f 81-b4 19 60 61 d6 ab 93 f5   N.O1z.....`a....
    08c0 - a2 ce 5d ca a7 4c cd 2a-98 ac 96 31 f2 74 f9 40   ..]..L.*...1.t.@
    08d0 - e9 64 36 c0 f4 6e f5 54-ab d3 bd 35 b5 17 ae 0f   .d6..n.T...5....
    08e0 - 03 de b9 0a 38 e5 18 1e-8a 26 e1 9d 4a ad a5 0b   ....8....&..J...
    08f0 - 8c 32 dc bf 15 3f 82 ce-7a 0a 4b af 98 9f 29 bc   .2...?..z.K...).
    0900 - 7a cb f6 12 9a 77 2d 0f-0c 3c 72 f4 24 63 52 9d   z....w-..<r.$cR.
    0910 - ac 1f 3d c9 79 48 29 33-cf 9c 0b 25 c5 57 db a8   ..=.yH)3...%.W..
    0920 - e6 ed 31 98 24 fc e4 ad-e4 49 55 19 50 7f 4e 19   ..1.$....IU.P.N.
    0930 - 6b 80 79 78 67 38 41 9a-b6 a3 29 3b 9e 7b 71 1d   k.yxg8A...);.{q.
    0940 - fd 74 d3 52 c5 79 3e f8-c3 a2 a1 d2 bc a1 96 aa   .t.R.y>.........
    0950 - fb 27 1b e4 7a f8 a6 ef-b0 3a 24 28 1e 4b 9a 73   .'..z....:$(.K.s
    0960 - b8 79 31 11 98 ee 3a 0b-f9 8e ac bf dd 31 e8 09   .y1...:......1..
    0970 - c8 ec 37 c3 c1 ad bb 9c-c3 7f 1d 37 c4 d1 98 86   ..7........7....
    0980 - 2c d3 63 be a7 70 a1 c6-3a 74 c5 73 07 c8 8a 60   ,.c..p..:t.s...`
    0990 - e7 f5 da a7 d3 2d a0 81-3f 27 8b 8a a2 82 df 1f   .....-..?'......
    09a0 - 2e f1 3d a7 ff e4 f0 c6-37 18 16 47 98 23 d9 5c   ..=.....7..G.#.\
    09b0 - b1 e5 72 0d 09 55 d3 0b-9e 32 97 86 4f 00 39 4a   ..r..U...2..O.9J
    09c0 - f1 3a 41 8e db 2a 39 5c-41 19 37 d0 47 ea 81 a0   .:A..*9\A.7.G...
    09d0 - 0f 7e f5 2e 28 4d f5 88-bf 52 77 f3 a3 e5 f7 59   .~..(M...Rw....Y
    09e0 - 60 55 92 3a a0 e8 5a 3d-96 2a e0 98 0d 56 9a 55   `U.:..Z=.*...V.U
    09f0 - 82 2e ab 46 b1 ab 59 62-2d a8 9d 64 ca cc 7d 3d   ...F..Yb-..d..}=
    0a00 - e6 32 95 13 e0 5a 19 47-f5 5b df 5f 41 de 5e 6c   .2...Z.G.[._A.^l
    0a10 - 4f 5a 0c 7a 90 6d 0a 6d-55 d4 83 f5 1c 63 50 f4   OZ.z.m.mU....cP.
    0a20 - 1f bf 7c 43 65 a2 66 32-32 f6 87 0e fb 0f e7 36   ..|Ce.f22......6
    0a30 - 34 af 3a b8 12 bc a0 69-47 6f 3e 7d 50 d1 04 b3   4.:....iGo>}P...
    0a40 - d0 d2 99 53 e2 c4 c4 ff-75 e1 07 ca e1 12 af 4e   ...S....u......N
    0a50 - f8 e2 b4 a7 c1 3c df 3a-66 f8 f9 c5 13 51 27 1b   .....<.:f....Q'.
    0a60 - 05 11 70 0e 86 46 6c f6-8f 3a a9 60 8e a2 b4 a8   ..p..Fl..:.`....
    0a70 - 86 52 27 a8 4b 26 e8 86-d0 88 e3 5f 40 88 51 65   .R'.K&....._@.Qe
    0a80 - 42 20 ea ec 4f 02 be 31-d5 c2 99 90 8c a7 ec af   B ..O..1........
    0a90 - 0d be 97 3a 99 cb 8c be-1b 5f 30 ab b1 f1 14 2c   ...:....._0....,
    0aa0 - 7f f1 92 e6 92 ba 22 bf-8e 49 4b a8 39 19 72 de   ......"..IK.9.r.
    0ab0 - d5 2f bf dd 0f 06 cd f8-f0 10 a8 e0 58 04 26 12   ./..........X.&.
    0ac0 - 4e 24 df f2 b8 6d b8 f4-a4 fc 9f b9 b6 57 36 62   N$...m.......W6b
    0ad0 - a3 26 bc 84 05 16 97 c3-8c 32 eb 38 6f 4b 26 ac   .&.......2.8oK&.
    0ae0 - b8 94 4d c2 5f de 8a 8e-ee ed c3 ad 1d d7 d4 d5   ..M._...........
    0af0 - 52 87 92 3d 39 d8 7b 75-15 34 24 2f 41 85 c8 9e   R..=9.{u.4$/A...
    0b00 - 5c b3 26 2f bc 9e f4 a5-31 bd 23 ac d0 12 6a 1c   \.&/....1.#...j.
    0b10 - 76 bb 5e d2 23 e4 96 8e-25 92 76 e0 56 68 da bb   v.^.#...%.v.Vh..
    0b20 - 62 2a 10 7d f0 29 d2 21-81 1e 25 40 70 f9 17 55   b*.}.).!..%@p..U
    0b30 - 73 8c b3 57 10 fc 9e 0e-45 c0 04 56 2b 92 bf cb   s..W....E..V+...
    0b40 - 37 4c c5 e9 85 a6 72 c1-49 ff 2c db 39 af ae a4   7L....r.I.,.9...
    0b50 - 95 0f ee c4 a1 d3 bc 80-a2 3a 5b ae a1 20 30 2b   .........:[.. 0+
    0b60 - 74 98 b4 06 54 5c 39 bd-cc 39 dc d8 e2 a3 11 94   t...T\9..9......
    0b70 - 2a 20 7e d2 c6 08 4e ed-86 79 47 79 dc ca ad 80   * ~...N..yGy....
    0b80 - 32 56 dd 97 bc ad 67 2b-1a fe 12 de 15 37 10 f1   2V....g+.....7..
    0b90 - 2a 7e 8b c7 36 b4 66 0e-90 45 fa 1e c9 81 f1 32   *~..6.f..E.....2
    0ba0 - fe 02 ae 27 42 47 9a 1d-bb 8a fb 00 83 b5 60 09   ...'BG........`.
    0bb0 - b1 f1 67 86 fc ed 8b a1-de 1b 80 33 b9 c1 bc 8c   ..g........3....
    0bc0 - 1d 5d 99 bc bd 17 13 8e-54 ad f9 c0 ac b1 db a5   .]......T.......
    0bd0 - 3b 4c 32 6d 0a 65 45 cc-99 60 e2 f8 c5 df ad a0   ;L2m.eE..`......
    0be0 - c5 c0 31 18 21 c9 6f 57-68 6f f8 00 f4 80 44 38   ..1.!.oWho....D8
    0bf0 - fb 21 03 b8 ec 1c a6 d9-9e 03 43 12 56 85 24 89   .!........C.V.$.
    0c00 - a2 7f 66 30 f5 eb f1 89-25 f6 86 cf d7 d8 bd a0   ..f0....%.......
    0c10 - af 6b 9a 89 5e                                    .k..^

    Start Time: 1763719275
    Timeout   : 7200 (sec)
    Verify return code: 0 (ok)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
```







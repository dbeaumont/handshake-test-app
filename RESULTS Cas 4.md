# Cas 3

## Configuration

script :
- generate-certs-cas4.sh

exécution :
- make certs
- make down rebuild up

system cacert : ajout de root-ca.crt
- Handshake Root CA

client-truststore :
- handshake-interne
- handshake-root-ca

server keystore - chaine de certificats:
- api-server

## Tests

Exécution depuis localhost
```bash
*[develop][~/Dev/handshake-test-app]$ curl http://localhost:8080/api/forward
{"timestamp":"2025-11-21T14:50:04.038+00:00","status":500,"error":"Internal Server Error","path":"/api/forward"}%
```

Exécution depuis le container api-client :
```bash
$ curl https://api-server:8443/api/hello
curl: (60) SSL certificate problem: self-signed certificate
More details here: https://curl.se/docs/sslcerts.html

curl failed to verify the legitimacy of the server and therefore could not
establish a secure connection to it. To learn more about this situation and
how to fix it, please visit the web page mentioned above.
```

Exécution depuis le container api-client :
```bash
$ openssl s_client -connect "api-server:8443" -showcerts -servername "api-server"

CONNECTED(00000003)
depth=0 C = FR, L = Paris, O = Handshake, OU = Dev, CN = api-server
verify error:num=18:self-signed certificate
verify return:1
depth=0 C = FR, L = Paris, O = Handshake, OU = Dev, CN = api-server
verify return:1
---
Certificate chain
 0 s:C = FR, L = Paris, O = Handshake, OU = Dev, CN = api-server
   i:C = FR, L = Paris, O = Handshake, OU = Dev, CN = api-server
   a:PKEY: rsaEncryption, 4096 (bit); sigalg: RSA-SHA384
   v:NotBefore: Nov 21 14:25:47 2025 GMT; NotAfter: Nov  9 14:25:47 2075 GMT
-----BEGIN CERTIFICATE-----
MIIFfTCCA2WgAwIBAgIJAJZ8A41WDx9DMA0GCSqGSIb3DQEBDAUAMFQxCzAJBgNV
BAYTAkZSMQ4wDAYDVQQHEwVQYXJpczESMBAGA1UEChMJSGFuZHNoYWtlMQwwCgYD
VQQLEwNEZXYxEzARBgNVBAMTCmFwaS1zZXJ2ZXIwIBcNMjUxMTIxMTQyNTQ3WhgP
MjA3NTExMDkxNDI1NDdaMFQxCzAJBgNVBAYTAkZSMQ4wDAYDVQQHEwVQYXJpczES
MBAGA1UEChMJSGFuZHNoYWtlMQwwCgYDVQQLEwNEZXYxEzARBgNVBAMTCmFwaS1z
ZXJ2ZXIwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDE8KvePtdHWTyF
EPQpy2RvroiJd6BWSZEQiwo4evktUBkrRC5CBzloJ6Bh4AGpk85qgo5cNOdvJ9Qt
B6JV+0GsObTHWmBf6VLX3rekJ96bInKNXRdYCAE/uoAUVwHs0utv3RU/2VWvU0T7
4LYuxvuYc8tKmRcNEuAYk8NLAZm+MSpArX87wnrvNDyZAaHs8jMxvoS7Gm3o2umU
OXeRUsKsb+7q2fXynehhwnMG2Xvco+tc7Z5q+aOu/l1oH36Ctq5pRApFpwJeM34e
69bvBaq7lJDLhe3p6HV+tGtCFh5vEmA22UgC9cNY/1b0R+7VoN3uI94jnJ6ramSz
l52NYMF8SFVXAKeJjp+Y3Cw0QwxAy4Urvb+k+DChnGQ+BwYleTEXvGtb80zIic/g
qWN5yFhxQ7Hcbb+mCFXm4j4mbDzDvQv4KEvagXjSSIMjGYPsDxF1hx8NKZzkqmuT
oq/BR7e8NBM5n/0oixRe/R0NRHxgUd3gPq1gxM1RwFQQEdTDUeNfSHqxuYNBIZO7
Bow3jMtYFCGA8cL30h2jbbg0IVGsMnMnnF1rdfy7Qr8ytGo6HEWLt6GhUJ27pA8L
xYELUH5htlJwKXvtNXQmvshfeg6jzecsrBAhS+ld7CE6C7T+5eCyE30QQMzh161N
EsOJ7N2TOj25uMPlRY1gsC6qfCak+wIDAQABo1AwTjAdBgNVHQ4EFgQU0lFUlCl3
MEJuq+ihB7sQZ0kBQyUwCwYDVR0PBAQDAgWgMCAGA1UdEQQZMBeCCmFwaS1zZXJ2
ZXKCCWxvY2FsaG9zdDANBgkqhkiG9w0BAQwFAAOCAgEAp3FPkwCWIWLQcnUP9Lwr
c8YiIleMOL+Rr2iCixdZLoX5gfx1jC8c1hbLofEOzwyybOnSEbh12vycXAR9WSpf
iFWGi+aLkULUo3s4OHFoeiXYRx49hcshFJAilGIpoOIZtsyG5S3BADNb7N8UV53n
LjeL5Pc0QGu2xDz6nIHPQq2Dk9O7sHAyuujzec5BOW+EpF8nHdkuyD5vatzyM8uk
WB1J7+ucUQh3X+Cy/4+XUIXW2eKaz4ijmdGvPuceljgj8Ghuogj3X4R2hXVC3wp8
bfGkPSfAK/p/Xy1i9DX2EANwoFyF3a++hjEyhKMpZPPAWy1OZF/8hpoZlRXbRlSm
UGv8sTsLC8A/0dBgn0wV3Fv5hzc1gR5f2Yg7DAu+vDDXmXPXjWAcdCDvg38t3cWF
wGY0APDrNPXGknyNi7bcHa/y6TRA9Udj/WXPb4cGdJv/qkrwnQPzGcO4+gK5L79M
zIXNKtSXWV4Bxj97nGyQex9prA5A63iXFWB42dwJctEbui/x+lv39oFawW9QK6DA
piQ8YmBm0ZbG9lSyUQK1ucwnm22WlX21IeaTn3/5lZNqeNBIrnJRrhBZHWlLUPJW
ESx2btRs51izKMretRbP746jaWrZwiAaQNWVuG052fjF8ugYntKe4ubZJJZclzjY
IlF5cntuJCCFSopGU9njZLY=
-----END CERTIFICATE-----
---
Server certificate
subject=C = FR, L = Paris, O = Handshake, OU = Dev, CN = api-server
issuer=C = FR, L = Paris, O = Handshake, OU = Dev, CN = api-server
---
No client certificate CA names sent
Peer signing digest: SHA256
Peer signature type: RSA-PSS
Server Temp Key: X25519, 253 bits
---
SSL handshake has read 2197 bytes and written 392 bytes
Verification error: self-signed certificate
---
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
Server public key is 4096 bit
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 18 (self-signed certificate)
---
---
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_256_GCM_SHA384
    Session-ID: 078747D0768E853C0B055ACB8F7C5AD210BFDF2BA40B2060E73B0A6BA962115F
    Session-ID-ctx: 
    Resumption PSK: EB0D1025C2AEEA21361B2287EE0CA284FC69584D7041D88966D8075197B6B29D7E396378D126282505401505BC3F8657
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 86400 (seconds)
    TLS session ticket:
    0000 - 39 71 88 e8 d9 dc 33 48-1f f3 67 65 f2 b7 b4 9c   9q....3H..ge....
    0010 - 75 a5 8c 00 5f 89 ad 63-fa bc 08 2a 88 b5 18 66   u..._..c...*...f
    0020 - 98 0e 64 56 13 e6 92 ef-cd 32 d7 54 9e b4 07 4e   ..dV.....2.T...N
    0030 - cc b3 8d ee 75 3d 42 93-db 6c 82 1f 9d 65 8b a4   ....u=B..l...e..
    0040 - fb 57 93 00 8c c8 a9 f9-56 20 eb 21 70 48 85 b2   .W......V .!pH..
    0050 - 45 06 f5 26 65 28 90 4e-99 22 23 7e dc 4a 26 99   E..&e(.N."#~.J&.
    0060 - 3d 87 22 08 3e e8 cf 34-8c 6d 2f 88 f7 2d da 3f   =.".>..4.m/..-.?
    0070 - 9e 00 62 8a 10 c2 4d d9-da a1 0a f9 31 6b 67 3a   ..b...M.....1kg:
    0080 - 30 16 9f a7 1f 81 45 e0-5d 9d 7d d5 eb 09 4a a3   0.....E.].}...J.
    0090 - a1 be ec f6 36 5a 26 44-09 5f b2 cf ab 28 86 6e   ....6Z&D._...(.n
    00a0 - 22 cf aa cd 26 4b 33 e9-ef 9f c9 ae 78 c0 ae 2b   "...&K3.....x..+
    00b0 - 84 c5 8e 6e c2 98 87 0c-17 41 24 12 13 4a fb 5c   ...n.....A$..J.\
    00c0 - 09 53 b7 34 80 42 2e f2-d4 ac 25 37 99 93 98 d6   .S.4.B....%7....
    00d0 - 65 56 dc 33 1e 68 96 a5-78 1a 6a 67 4c 4e a0 b3   eV.3.h..x.jgLN..
    00e0 - 3d bf 98 9e 68 f4 45 20-f6 d1 e9 c3 70 de bc c5   =...h.E ....p...
    00f0 - 40 70 8c 4e 3b ad d6 ef-d6 07 e6 93 e6 21 c9 47   @p.N;........!.G
    0100 - 78 f5 55 74 fb d4 07 1d-ee 2b f3 1b 92 c9 ed 78   x.Ut.....+.....x
    0110 - e5 18 6c bd c3 ac 4f 06-13 06 06 72 eb f6 17 55   ..l...O....r...U
    0120 - a3 02 9a 10 33 6f 4f e6-1c 59 fa ac bc 1d 9e 7b   ....3oO..Y.....{
    0130 - 86 bb 24 1e 98 4a c2 34-1b 3f ab 69 3f 48 d2 33   ..$..J.4.?.i?H.3
    0140 - ea 6b aa 4d 09 0e 8f 71-5e 2b 0d db d2 2d 95 16   .k.M...q^+...-..
    0150 - 6d 4a 3a 96 4e 90 17 b5-a3 e1 c1 bc 00 a0 00 e3   mJ:.N...........
    0160 - 00 f6 1a ee b9 91 96 6e-e9 ec b4 43 17 28 27 97   .......n...C.('.
    0170 - 9c f9 a1 98 57 47 28 e6-46 55 d8 4c 67 6b 0c 65   ....WG(.FU.Lgk.e
    0180 - 13 c7 30 3e f7 ee b7 41-4e 70 f9 77 b4 c9 bb d2   ..0>...ANp.w....
    0190 - 97 87 e9 50 ff 58 6c 1e-75 2a 2c e8 ca 30 80 f5   ...P.Xl.u*,..0..
    01a0 - fe a7 23 54 f8 b6 78 1c-eb 88 60 27 11 bd 5c 09   ..#T..x...`'..\.
    01b0 - 2a 89 44 c4 58 b0 45 b5-68 ff 96 13 f5 3a 2e 80   *.D.X.E.h....:..
    01c0 - 19 b5 5b 9f 75 d5 96 1a-a3 aa b1 a8 0b e7 3a ec   ..[.u.........:.
    01d0 - 6a 8e 9a 08 ee 58 d4 b3-9d 89 ee 35 b5 02 41 f3   j....X.....5..A.
    01e0 - 64 fc 5d 20 2c 11 14 99-cb e8 e6 fe 0c 1f e0 0f   d.] ,...........
    01f0 - cf 1f bf da 2d ba 70 2f-5f db ac a8 aa c3 e1 58   ....-.p/_......X
    0200 - 8f 8b 04 aa 2a da 6c aa-e5 9a 8e 30 d2 04 c5 81   ....*.l....0....
    0210 - db da 83 4f 65 0d d0 78-43 0a c5 c7 ca 00 91 11   ...Oe..xC.......
    0220 - c3 62 49 b7 35 e0 9f 2c-bb 0d bb fe 94 3e 7a ce   .bI.5..,.....>z.
    0230 - b6 f0 cb b6 7c e9 7c 59-9d de 26 03 3f d1 3e 92   ....|.|Y..&.?.>.
    0240 - 08 cd 4b e7 9c 74 41 3f-7c be fa b4 24 c4 b7 e2   ..K..tA?|...$...
    0250 - 72 cd 60 61 d5 20 da de-d0 a7 7c 26 0b be 26 60   r.`a. ....|&..&`
    0260 - 0c a3 bf dc a1 26 17 01-72 c7 7d 8d b4 db bc 11   .....&..r.}.....
    0270 - 52 9e 30 8d 58 a9 61 1b-27 3e 81 94 0f 4e da 03   R.0.X.a.'>...N..
    0280 - f4 53 21 4e 60 aa 87 41-34 a3 e4 61 e4 28 72 b0   .S!N`..A4..a.(r.
    0290 - 7e 20 14 8b e8 38 3f 1c-21 da ef c8 10 a5 3c db   ~ ...8?.!.....<.
    02a0 - 23 a2 8d d8 e2 6d e3 5f-1b ee 47 21 6d 22 a0 44   #....m._..G!m".D
    02b0 - 80 c8 4b cd d4 58 04 1e-c1 04 69 c9 b0 7c 3a 98   ..K..X....i..|:.
    02c0 - 3a 42 83 16 b6 4d 55 86-e6 58 51 92 3d 53 e6 99   :B...MU..XQ.=S..
    02d0 - fd 4c da 66 4c 10 c6 af-8e 2b 26 4b 73 aa ea 39   .L.fL....+&Ks..9
    02e0 - 7d c0 b0 88 97 e1 ca 1d-f5 f5 39 9a 84 da a6 0c   }.........9.....
    02f0 - ec e0 a9 5c fe 99 64 b0-3c 58 43 cb 5b 46 df e3   ...\..d.<XC.[F..
    0300 - b3 b1 13 8d ca 12 a0 ca-d9 17 d6 4b 96 0a 0a db   ...........K....
    0310 - a8 34 1a 10 bc 5c 77 ef-db c7 62 c0 6d 10 c2 ed   .4...\w...b.m...
    0320 - 88 99 8c 2c 16 a1 25 9a-20 17 60 5c 40 be 02 0d   ...,..%. .`\@...
    0330 - 27 f1 01 aa 88 ea 2a 80-cf 22 cb d4 aa cf 27 d7   '.....*.."....'.
    0340 - ff 0f d7 ed 76 b4 67 54-cc 68 5b d5 5a 9d de a9   ....v.gT.h[.Z...
    0350 - db ac 9f b6 02 99 e6 5a-80 cc de a1 3c f1 39 cc   .......Z....<.9.
    0360 - 31 d3 08 21 7d d2 91 b2-7e e2 29 c9 f9 5d ca 5b   1..!}...~.)..].[
    0370 - 90 31 82 f0 dd c6 f3 71-59 0c dc e0 52 3d a0 77   .1.....qY...R=.w
    0380 - 28 d7 9e e2 56 a6 80 c5-63 e2 d8 52 98 6c 17 7e   (...V...c..R.l.~
    0390 - ea f0 70 75 cb 0b e3 dd-59 45 08 b0 6e df 53 5d   ..pu....YE..n.S]
    03a0 - 3c e5 78 8f 2b aa 59 61-b3 74 5d 9f 71 e6 f2 80   <.x.+.Ya.t].q...
    03b0 - f6 b7 c3 3c 02 0c d2 ff-20 0d 6f ea f3 60 f5 9e   ...<.... .o..`..
    03c0 - 79 63 e4 fe ac e2 11 dd-13 07 a5 bb 13 28 b5 30   yc...........(.0
    03d0 - 9a 8b 29 ad 1e 8e 94 bd-d6 41 54 d9 a3 c5 42 fe   ..)......AT...B.
    03e0 - 6f c2 fa 99 e0 ab 41 d9-05 db 51 dc 7a 0e 31 84   o.....A...Q.z.1.
    03f0 - c5 a6 c7 aa 42 f1 b2 d5-19 44 4b 0d 85 56 0e fa   ....B....DK..V..
    0400 - ce d2 ce e7 c2 a5 d0 e4-98 38 b8 44 81 6a fb d3   .........8.D.j..
    0410 - f9 5a 9b 25 8a ba e5 9a-9e f8 ee 80 d2 8a 8a d0   .Z.%............
    0420 - 7d 40 7a d0 cc 89 f5 38-31 72 a0 78 7b 1e 93 9d   }@z....81r.x{...
    0430 - 5b df 03 ac ee 93 45 49-02 2c b4 4c 23 b2 7a 29   [.....EI.,.L#.z)
    0440 - 6e e5 4b 03 07 6f 2b 86-06 b2 d9 97 83 22 3b 88   n.K..o+......";.
    0450 - 8e 1e fd 4f bd b1 b0 18-fc 16 18 d9 16 b1 21 79   ...O..........!y
    0460 - b1 01 f5 e3 62 94 b2 6f-fa 1f 2c 2b e4 8c 44 f1   ....b..o..,+..D.
    0470 - 27 d1 76 37 ea 41 61 5d-82 e5 91 8d 2a 12 ba 91   '.v7.Aa]....*...
    0480 - a1 a3 53 c6 e9 7d f6 00-13 6d 2d 16 a6 85 cd fc   ..S..}...m-.....
    0490 - 3d f0 56 5b 2f f2 8f df-ee 1b 38 33 81 02 07 a9   =.V[/.....83....
    04a0 - ff eb 0a 34 a7 1d 0c 04-42 cd 18 2d 00 ff a8 82   ...4....B..-....
    04b0 - 8a 18 11 58 03 9a 2e cb-53 cb 01 28 88 f0 90 00   ...X....S..(....
    04c0 - 51 e4 d1 67 d2 e2 8d d2-74 eb 53 6f 09 89 85 0d   Q..g....t.So....
    04d0 - 85 4a 10 09 f6 09 bb 66-4c eb 50 bf ff 01 47 41   .J.....fL.P...GA
    04e0 - 96 e3 34 27 1c ca 9b 61-e0 bc 3e 0a aa f1 d2 d7   ..4'...a..>.....
    04f0 - b5 ca 49 77 7c f5 bb 18-bb 81 d0 cb 80 54 28 d5   ..Iw|........T(.
    0500 - 1a 96 c8 f4 39 60 67 bc-d5 04 a0 37 77 04 ea 43   ....9`g....7w..C
    0510 - e7 fb 84 49 5b 22 c6 cd-63 d3 63 98 53 1f 59 02   ...I["..c.c.S.Y.
    0520 - a1 b8 1b 40 dc 63 b4 70-d6 73 be 0a 7a 1a fe be   ...@.c.p.s..z...
    0530 - a1 49 df 07 58 d9 05 01-7f 2c 64 ee 2f aa ad f8   .I..X....,d./...
    0540 - 6c e8 b3 8c b8 cd f2 98-47 21 79 91 b7 16 09 11   l.......G!y.....
    0550 - 5d d9 de 4d 49 60 e7 60-ba c1 46 33 dc 01 fd a3   ]..MI`.`..F3....
    0560 - 78 d5 7f 6b f6 fc c2 48-64 90 15 95 0f 7c ba 69   x..k...Hd....|.i
    0570 - 6f 54 ef 20 82 ea 00 f0-68 d5 bc 6a 3a a7 7c 06   oT. ....h..j:.|.
    0580 - 89 bc 3c e7 aa 1d 7b 5a-4f 55 eb 8b a6 84 09 9d   ..<...{ZOU......
    0590 - 40 27 fb 34 43 8f ef f5-5e 1b 67 ae c2 5f eb 6d   @'.4C...^.g.._.m
    05a0 - 50 c2 92 47 0b 35 ef e3-99 80 9e cf 2e 4a a4 1b   P..G.5.......J..
    05b0 - 66 87 03 f5 47 cb cc db-7d c3 e3 77 cd 37 38 fc   f...G...}..w.78.
    05c0 - 29 40 26 49 b2 5f 37 be-0c f8 47 e9 ac d8 42 5c   )@&I._7...G...B\
    05d0 - 9c 23 36 7e 0c 83 d9 b9-0c d1 73 71 d0 64 a5 66   .#6~......sq.d.f
    05e0 - 28 62 8a dc 34 b8 96 a8-0c 91 13 45 da c2 44 c6   (b..4......E..D.
    05f0 - 18 46 6f 52 18 80 3a fb-43 26 f9 46 14 1a de 88   .FoR..:.C&.F....
    0600 - 47 2f e4 5c 99 c8 61 5f-e5 54 e2 2c 89 cd d7 bb   G/.\..a_.T.,....
    0610 - 42 10 7b 8f 53 3a 7a 7b-e0 c5 91 13 7e 34 62 80   B.{.S:z{....~4b.
    0620 - ed fc 20 f6 b8 4e d6 53-e6 85 c9 a4 a1 22 db 32   .. ..N.S.....".2
    0630 - 33 00 a0 53 cf 05 1e 53-a0 c9 68 3d f7 f6 c8 9a   3..S...S..h=....
    0640 - f2 f2 f3 50 5f 3e 63 29-bf 8c ab a2 f0 72 10 f5   ...P_>c).....r..
    0650 - 13 6f f2 b2 6f 5c cf a1-cf dc d2 61 6d bf df 51   .o..o\.....am..Q
    0660 - 17 d8 99 1c fa 80 d8 15-77 13 95 f2 76 96 5d 19   ........w...v.].
    0670 - a1 43 23 6c d7 28 69 f4-                          .C#l.(i.

    Start Time: 1763736667
    Timeout   : 7200 (sec)
    Verify return code: 18 (self-signed certificate)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
```

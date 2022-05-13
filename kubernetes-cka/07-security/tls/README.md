# Generate Certificates

## Command Line

### Private Key

```bash
openssl genrsa -out test.key 1024
```

### Public Key

```bash
openssl rsa -in test.key -pubout > test.pem
```

### Decode Cert

```bash
openssl x509 -in *.crt -text -noout
```

## CA

### Generate Keys

```shell
openssl genrsa -out ca.key 2048
```

### Certificate Signing Request

```shell
openssl req -new -key ca.key -subj "/CN=KUBERNETES-CA" -out ca.csr
```

### Sign Certificates

```shell
openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt
```

### Create Unique SerialNumber

```shell
echo 01 > ca.srl
```

## Admin User

### Generate Keys

```shell
openssl genrsa -out admin.key 2048
```

### Certificate Signing Request

```shell
openssl req -new -key admin.key -subj "/CN=kube-admin/O=system:masters" -out admin.csr
```

### Sign Certificates

```shell
openssl x509 -req -in admin.csr -CA ca.crt -CAkey ca.key -out admin.crt
```

## kube-apiserver

### Generate Key

```shell
openssl genrsa -out apiserver.key 2048
```

### Certificate Signing Request

```shell
openssl req -new -key apiserver.key -subj "/CN=kube-apiserver" -out apiserver.csr -config openssl.cnf
```

### Sign Certificate

```shell
openssl x509 -req -in apiserver.csr -CA ca.crt -CAkey ca.key -out apiserver.crt
```

### Decode Certificate

```shell
openssl x509 -in apiserver.crt -text -noout
```

## Ref

- [Cluster TLS using OpenSSL](https://github.com/coreos/coreos-kubernetes/blob/master/Documentation/openssl.md)
- [OpenSSL Self-signed Ceritifcated 만들기](https://bitgadak.tistory.com/5)
- [OpenSSL Configuration File](https://www.microfocus.com/documentation/visual-cobol/VC23/EclWin/HROSSROPEN02.html)
- [What is a Distinguished Name (DN)?](https://knowledge.digicert.com/generalinformation/INFO1745.html)

[![Build Status](https://dev.azure.com/bahrinipun/demo-fullstack/_apis/build/status/cd-springboot-backend?branchName=master)](https://dev.azure.com/bahrinipun/demo-fullstack/_build/latest?definitionId=80&branchName=master)

# Application Setup
- KickOff: Spring Initializer project with initial dependecies- Spring web, Devtools, JPA
- Flow: SpringbootApplication -> Controller -> Service -> Repository -JPA-> Database(Azure SQL)

# Features
- Azure SQL UMI Connectivity: prerequisites:- UMI with Virtual Machine Contributor role, AzureIdentity & AzureIdentityBinding AKS resources, pod label,       Azure SQL pom dependency,data source endpoint
- Client-side Validation
- Logger
- Exception Handling
- Junit5 testcases with Mockito framework (for service/repository/controller layers)
- Lombok
- Actuator
- Swagger API Docuementation
- Internalization

# Upcoming Features
- Jackson API
- Caching
  
## SSL
In cryptography, X.509 is a standard defining the format of public key certificates.

**Certificate filename extensions**
There are several commonly used filename extensions for X.509 certificates. Unfortunately, some of these extensions are also used for other data such as private keys.
- .pem – (Privacy-enhanced Electronic Mail) Base64 encoded DER certificate, enclosed between "-----BEGIN CERTIFICATE-----" and "-----END CERTIFICATE-----"
- .cer, .crt, .der – usually in binary DER form, but Base64-encoded certificates are common too (see .pem above)
- .p7b, .p7c – PKCS#7 SignedData structure without data, just certificate(s) or CRL(s)
- .p12 – PKCS#12, may contain certificate(s) (public) and private keys (password protected)
- .pfx – PFX, predecessor of PKCS#12 (usually contains data in PKCS#12 format, e.g., with PFX files generated in IIS)
- PKCS#7 is a standard for signing or encrypting (officially called "enveloping") data. Since the certificate is needed to verify signed data, it is possible to      include them in the SignedData structure. A .P7C file is a degenerated SignedData structure, without any data to sign.[citation needed]
- PKCS#12 evolved from the personal information exchange (PFX) standard and is used to exchange public and private objects in a single file.[citation needed]

# Payment Gateway Exercise - Documentation

This repository holds all documentation related to the Payment Gateway exercise.

- [Design document](SYSTEM_DESIGN.md)
- [Setup guide](SETUP_GUIDE.md)
- [How to call the APIs](USAGE.md)

---

# API Specifications

The documentation of the APIs was created using OpenAPI (fka Swagger).

The specs are stored inside the `openapi` folder.

To view the specs, either use [Swagger Editor](https://editor.swagger.io/) and import the yaml files (one at a time), or just click the links below, which will redirect you directly to Swagger UI:

- [Merchant API Spec](https://petstore.swagger.io/?url=https://raw.githubusercontent.com/gustavooferreira/pgw-docs/master/openapi/merchant_api_spec.yaml)
- [Management API Spec](https://petstore.swagger.io/?url=https://raw.githubusercontent.com/gustavooferreira/pgw-docs/master/openapi/mgmt_api_spec.yaml)

---

# Links to other repositories

This application was split into several repositories, below are the links to each one of them.

Repositories:

- [This repo](https://github.com/gustavooferreira/pgw-docs)
- [Authentication Service](https://github.com/gustavooferreira/pgw-auth-service)
- [Payment Processor Service](https://github.com/gustavooferreira/pgw-payment-processor-service)
- [Payment Gateway Service](https://github.com/gustavooferreira/pgw-payment-gateway-service)

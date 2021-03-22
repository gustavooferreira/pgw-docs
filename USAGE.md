# Usage

This document provides a few examples of possible requests to the APIs.

## Health checks

To check the health status of the service:

```bash
curl -s http://localhost:9001/api/v1/healthcheck | jq .
```

The response should look like this:

```json
{
  "status": "OK"
}
```

---

## Merchant API requests

To request an authorisation of a payment:

```bash
curl -X POST -s http://localhost:9000/api/v1/authorise -d '{"":""}' | jq .
```

---

## Management API requests

To get a list of all authorisations:

```bash
curl -s http://localhost:9001/api/v1/authorisations | jq .
```

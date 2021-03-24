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

Note that the credit card number supplied will failed as per the edge case requirements in the exercise.

```bash
curl -i -X POST -u bill:pass1 http://localhost:9000/api/v1/authorise -d '{"credit_card": {"name":"customer1", "number": 4000000000000119, "expiry_month":10, "expiry_year":2030, "cvv":123}, "currency": "EUR", "amount": 10.50}'
```

---

## Management API requests

To get a list of all authorisations:

```bash
curl -s http://localhost:9001/api/v1/authorisations | jq .
```

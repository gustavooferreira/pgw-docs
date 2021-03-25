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

Note that the credit card number provided will failed as per the edge case requirements in the exercise.

```bash
curl -i -X POST -u bill:pass1 http://localhost:9000/api/v1/authorise -d '{"credit_card": {"name":"customer1", "number": 4000000000000119, "expiry_month":10, "expiry_year":2030, "cvv":123}, "currency": "EUR", "amount": 10.50}'
```

To capture after an authorised payment:

```bash
curl -i -X POST -u bill:pass1 http://localhost:9000/api/v1/capture -d '{"authorisation_id": "ce24c61a-f3e9-4df1-9110-06e4e38e977d", "amount": 2}'
```

To refund:

```bash
curl -i -X POST -u bill:pass1 http://localhost:9000/api/v1/refund -d '{"authorisation_id": "ce24c61a-f3e9-4df1-9110-06e4e38e977d", "amount": 5}'
```

To void and authorised payment:

```bash
curl -i -X POST -u bill:pass1 http://localhost:9000/api/v1/void -d '{"authorisation_id": "ce24c61a-f3e9-4df1-9110-06e4e38e977d"}'
```

---

## Management API requests

To get a list of all authorisations: (please note this is not paginated)

```bash
curl -s http://localhost:9001/api/v1/authorisations | jq .
```

To get a detailed view of an authorisations:

```bash
curl -s http://localhost:9001/api/v1/authorisations/f7daac34-3376-45d2-b379-3e97149be3bd | jq .
```

Example response:

```json
{
  "id": "ce24c61a-f3e9-4df1-9110-06e4e38e977d",
  "state": "Refunded",
  "currency": "EUR",
  "amount": 10.5,
  "merchant_name": "bill",
  "credit_card": {
    "number": 4539860535346133,
    "name": "customer1",
    "expiry_month": 10,
    "expiry_year": 2030,
    "cvv": 123
  },
  "transactions": [
    {
      "type": "Capture",
      "amount": 2
    },
    {
      "type": "Capture",
      "amount": 2
    },
    {
      "type": "Capture",
      "amount": 2
    },
    {
      "type": "Capture",
      "amount": 2
    },
    {
      "type": "Capture",
      "amount": 2
    },
    {
      "type": "Refund",
      "amount": 5
    },
    {
      "type": "Refund",
      "amount": 5
    }
  ]
}
```

# Bierzee server

All endpoints accept both `application/json` and `application/protobuf` in the `Content-Type` header. The response will be in the format specified in the `Accept ` header, this can be either `application/json` or `application/protobuf`. If the `Accept` header is not set, the value of the `Content-Type` header will be used. If neither are set, `application/json` will be used.

The protobuf `.proto` file can be found [here](./proto/src/items.proto)

All endpoints except `/api/v1/login` require the `Authorization` header to be set to the `session_id` provided by the `/api/v1/login` endpoint

## Endpoints
### Beers
`POST /api/v1/beers/drink`:  
Request:
```json
{
    "beers_drunk": 1
}
```
---
`GET /api/v1/beers/drunk`:  
Response:
```json
{
    "beers": [
        {
            "drunk_at": 0 // Unix epoch timestamp
        }
    ]
}
```
---
`GET /api/v1/beers/price`:  
Response:
```json
{
    "last_updated": 0, // Unix epoch timestamp
    "price": 0.0
}
```
---
### Payment

`GET /api/v1/payment/balance`:  
Response:
```json
{
    "amount_paid": 0.0,
    "beers_drunk": 0,
    "balance": 0.0,
    "beers_left": 0
}
```
---
`GET /api/v1/payment/broke`:  
Response:
```json
{
    "payments": [
        {
            "paid_at": 0, // Unix epoch timestamp,
            "amount_paid": 0.0
        }
    ]
}
```
---
`/api/v1/payment/pay`:  
Request:
```json
{
    "amount": 0.0
}
```
---
### System
All endpoints in the system group require the authorized user to be an administrator.

`GET /api/v1/system/owes`:  
Response:
```json
{
    "owning_users": [
        {
            "employee_id": "",
            "name": "",
            "amount_owed": 0.0
        }
    ]
}
```
---
`POST /api/v1/system/set-admin`:  
Request:
```json
{
    "employee_id": "",
    "admin": true
}
```
---
`POST /api/v1/system/beer-price`:  
Request:
```json
{
    "price": 0.0
}
```
---
### Login
`POST /api/v1/login`:  
Request:
```json
{
    "employee_id": "",
    "name": ""
}
```
Response:
```json
{
    "session_id": ""
}
```

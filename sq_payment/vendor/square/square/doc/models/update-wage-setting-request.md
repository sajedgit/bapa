## Update Wage Setting Request

Represents an update request for the `WageSetting` object describing a `TeamMember`.

### Structure

`UpdateWageSettingRequest`

### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `wageSetting` | [`WageSetting`](/doc/models/wage-setting.md) | An object representing a team member's wage information. |

### Example (as JSON)

```json
{
  "wage_setting": {
    "is_overtime_exempt": true,
    "job_assignments": [
      {
        "job_title": "Manager",
        "pay_type": "SALARY",
        "annual_rate": {
          "amount": 3000000,
          "currency": "USD"
        },
        "weekly_hours": 40
      },
      {
        "job_title": "Cashier",
        "pay_type": "HOURLY",
        "hourly_rate": {
          "amount": 1200,
          "currency": "USD"
        }
      }
    ]
  }
}
```


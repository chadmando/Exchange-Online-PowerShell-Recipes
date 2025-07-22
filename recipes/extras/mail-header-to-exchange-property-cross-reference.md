# eMail Header to Exchange Message Property Cross Reference

| Header Property | Exchange Property | Notes |
| --- | --- | --- |
| Message-ID | MessageId | Include the brackets _<>_; this is sometimes called the _Client ID_ |
| X-MS-Exchange-Organization-Network-Message-Id | MessageTraceId | Should be a GUID |
| From | SenderAddress | In the Header's From property, the address inside the brackets _<>_ |
| To | RecipientAddress | In the Header's To property, the address inside the brackets _<>_ |
| x-ms-exchange-crosstenant-originalarrivaltime | Received | This time is parsed in Exchange so there will be some difference in appearance |
| Subject | Subject |  |

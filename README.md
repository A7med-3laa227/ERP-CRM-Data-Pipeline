# ERP-CRM-Data-Pipeline
The ERP CRM Pipeline is a modern data warehouse pipeline that focuses on the ingestion, transformation, and consumption of structured data. The architecture is designed to enable efficient reporting, analytics, and machine learning use cases using a standardized data processing framework.

<img width="901" height="691" alt="Data Architecture" src="https://github.com/user-attachments/assets/84cf43f9-74e9-4ec4-a87c-a537cb1af5fe" />

---

## Data Warehouse Layers
| Layer  | Description                     | Object Type | Load              | Transformations                 | Data Model         |
| ------ | ------------------------------- | ----------- | ----------------- | ------------------------------- | ------------------ |
| Bronze | Raw, untransformed data         | Table       | Batch & Full Load | None                            | None (as-is)       |
| Silver | Cleaned & standardized data     | Table       | Batch & Full Load | Cleansing, Standardization,     | None (as-is)       |
|        |                                 |             |                   | Normalization, Derived Columns, |                    |
|        |                                 |             |                   | Enrichment                      |                    |
| Gold   | Business-ready, integrated data | Table       | No Load           | Integrations, Aggregations,     | Star Schema, Flat, |
|        |                                 |             |                   | Business Logic                  | Aggregated Table   |

---

## Layers Summary
### 1. Bronze Layer – Raw Ingestion
Source: External CSV files
Landing Zone: SQL Server Database
Goal: Store raw, unprocessed data

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
- Source: External CSV files
- Landing Zone: SQL Server Database
- Goal: Store raw, unprocessed data

<img width="821" height="541" alt="Data Flow Architcture" src="https://github.com/user-attachments/assets/40be832d-181d-42d5-8f87-92fcc19357b8" />

### 2. Silver Layer – Cleaned and Validated Data
- Processes: Null handling, deduplication, schema enforcement
- Goal: Queryable and validated intermediate data

### 3. Gold Layer – Analytics Ready
- Structure: Star schema (Fact + Dimension tables)
- Query Engine:  SQL Server engine
- Goal: Business intelligence and advanced analytics

<img width="871" height="483" alt="Data model of star schema" src="https://github.com/user-attachments/assets/c5210e3d-0829-4b29-a72e-84368079ab51" />

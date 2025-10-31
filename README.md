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

---

## Folder Structure
`/
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── data_architecture.drawio        # Draw.io file showing project architecture
│   ├── data_flow.drawio                # Draw.io file for data flow diagram
│   ├── data_model.drawio               # Draw.io file for data model (star schema)
│   ├── data_catalog.md                 # Catalog of datasets, field descriptions, and metadata
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Extracting and loading raw data
│   ├── silver/                         # Cleaning and transforming data
│   ├── gold/                           # Creating analytical models
│
├── tests/                              # Test scripts and quality checks
│
├── README.md                           # Project overview and instructions`


---

## Future Enhancements
- Integrate Apache Airflow for automated workflow orchestration and scheduling of ETL jobs
- Implement dbt for modular, version-controlled, and testable SQL transformations in Silver & Gold layers
- Add data quality checks and tests using dbt to ensure trusted analytics and reporting
- Document business and technical logic using dbt docs for easier onboarding and auditing

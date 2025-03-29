# Azure-data-engineering-project
## **Azure Data Pipeline - Medallion Architecture (Bronze, Silver, Gold)**

## **Project Overview**
This project implements an **end-to-end data pipeline** using **Azure services** while following the **Medallion Architecture** (Bronze, Silver, Gold). The data is sourced from **GitHub API (HTTP Source)**, ingested and transformed using **Azure Data Factory, Azure Databricks, and Azure Synapse Analytics**, and finally visualized using **Power BI**.

<img width="855" alt="projectFlowArchitecture" src="https://github.com/user-attachments/assets/8c73cfd1-ccf3-43d7-886c-e7644e36bf1c" />


## **Technologies Used**
- **Azure Data Factory (ADF)** → Data Ingestion  
- **Azure Data Lake Storage Gen2 (ADLS G2)** → Data Storage  
- **Azure Databricks** → Data Transformation  
- **Microsoft Entra ID** → Secure Access  
- **Azure Synapse Analytics** → Data Serving  
- **Power BI** → Data Visualization

## **Architecture Overview**
The project follows the **Medallion Architecture**, which consists of three layers:

1. **Bronze Layer (Raw Data Storage)**  
   - **Ingestion:** Data is pulled from the GitHub API using **Azure Data Factory (ADF)**.  
   - **Storage:** Raw data is stored in **Azure Data Lake Storage Gen2 (ADLS G2)**.  
   - **Format:** The ingested data is stored as CSV files.  

2. **Silver Layer (Transformed Data Storage)**  
   - **Transformation:** Azure Databricks processes the raw data by cleaning and applying minor transformations.  
   - **Authentication:** Microsoft Entra ID is used for secure access to ADLS G2.  
   - **Storage:** Transformed data is stored in **Azure Data Lake Storage Gen2 (Silver Layer)**.  

3. **Gold Layer (Optimized Data for Analysis)**  
   - **Serving:** Azure Synapse Analytics processes the transformed data.  
   - **Schema Creation:** Managed Identity is used to access ADLS G2 and define schemas.  
   - **Views & External Tables:** Views are created for each table, and **CETAS (Create External Table As Select)** is used to push the final data into the **Gold Layer**.  
   - **Storage:** The final cleaned and structured data is stored in **Azure Data Lake Storage Gen2 (Gold Layer)**.  

4. **Visualization with Power BI**  
   - Power BI is connected to **Azure Synapse SQL Endpoint** for data visualization.  
   - Reports are generated using transformed and aggregated data from the Gold Layer.  

---

## **Project Flow**
The data ingestion process begins with **Azure Data Factory**, which dynamically extracts data from the **GitHub API**. The pipeline is parameterized using JSON configurations, allowing for seamless ingestion of multiple tables through the **ForEach** activity. The extracted raw data is stored in **Azure Data Lake Storage Gen2 (Bronze Layer)** in CSV format, maintaining its original structure.  

Once ingested, the data moves to the **transformation phase** within **Azure Databricks**. By leveraging **Microsoft Entra ID**, secure access is granted to the **Bronze Layer**, enabling transformation operations such as cleaning, filtering, and minor restructuring. The transformed data is then stored in **Azure Data Lake Storage Gen2 (Silver Layer)**, ensuring a more refined dataset for downstream consumption.  

For optimized querying and reporting, the transformed data is loaded into **Azure Synapse Analytics**. Through **Managed Identity authentication**, Synapse accesses the **Silver Layer** and applies schema definitions. **Views** are created to organize the data efficiently, and **CETAS (Create External Table As Select)** is used to materialize the final structured dataset into **Azure Data Lake Storage Gen2 (Gold Layer)**. This step ensures that the data is well-organized and ready for analytics.  

Finally, **Power BI** is integrated with **Azure Synapse SQL Endpoint** to enable business intelligence and reporting. By connecting directly to the **Gold Layer**, Power BI generates dashboards and visualizations, providing insights derived from the transformed and aggregated data. This end-to-end pipeline ensures efficient data processing, transformation, and visualization within the **Azure ecosystem**.


  

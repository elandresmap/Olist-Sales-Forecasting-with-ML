# OLIST E-commerce Data Analysis & Sales Forecasting

## 📋 Project Overview

This project provides a comprehensive analysis of OLIST, Brazil's largest department store marketplace, using a dataset containing approximately 100,000 orders from October 2016 to October 2018. The analysis includes exploratory data analysis, database construction, and advanced sales forecasting using machine learning techniques.

## 🎯 Objectives

- **Database Construction**: Build a robust PostgreSQL database from raw data
- **Exploratory Analysis**: Extract business insights through SQL queries
- **Predictive Modeling**: Implement time series forecasting for sales prediction
- **Business Intelligence**: Create interactive dashboards for strategic decision-making

## 📊 Dataset Information

- **Source**: Kaggle - Brazilian E-Commerce Public Dataset by Olist
- **Scope**: ~100,000 orders (October 2016 - October 2018)
- **Coverage**: Customers, sellers, orders, products, payment methods, and geolocation data
- **Business Context**: OLIST connects small businesses across Brazil through a unified marketplace

## 🗂️ Project Structure

```
OLIST2/
├── README.md                           # Project documentation
├── Analisis Olist                  # → Analisis Olist.ipynb (Exploratory Analysis)
├── Prediccion ventas Olist        # → Prediccion_Ventas_Olist.ipynb (ML Forecasting)
├── script olist                   # → script_olist.sql (SQL Analysis Queries)
├── create_table.sql                    # Database schema creation
└── import_data.sql                     # Data ingestion scripts
```

## 🚀 Getting Started

### Prerequisites

- **Database**: PostgreSQL with pgAdmin4
- **Python**: 3.8+ with Jupyter Notebook
- **BI Tool**: Power BI Desktop
- **Dataset**: OLIST dataset from Kaggle

### Required Python Libraries

```bash
pip install pandas numpy matplotlib seaborn
pip install scikit-learn statsmodels xgboost
pip install psycopg2-binary sqlalchemy
pip install plotly jupyter
```

### Database Setup

1. **Create PostgreSQL Database**
   ```sql
   -- Run in pgAdmin4 or PostgreSQL command line
   CREATE DATABASE olist_db;
   ```

2. **Execute Schema Creation**
   ```bash
   psql -d olist_db -f create_table.sql
   ```

3. **Import Data**
   ```bash
   psql -d olist_db -f import_data.sql
   ```

## 📈 Project Workflow

### Phase 1: Database Construction
- **Objective**: Build normalized database structure
- **Tools**: PostgreSQL, pgAdmin4
- **Files**: `create_table.sql`, `import_data.sql`
- **Output**: Fully structured relational database

### Phase 2: Exploratory Data Analysis
- **File**: `Analisis_Olist.ipynb` (currently `Analisis Olist.txt`)
- **Methodology**: SQL-based analysis with Python visualization
- **Key Insights**:
  - Order volume trends and seasonality patterns
  - Delivery performance metrics
  - Customer segmentation analysis
  - Top-performing sellers by revenue
  - Geographic distribution of sales

### Phase 3: Predictive Modeling
- **File**: `Prediccion_Ventas_Olist.ipynb` (currently `Prediccion ventas Olist.txt`)
- **Models Implemented**:
  - **SARIMAX**: Seasonal AutoRegressive Integrated Moving Average with eXogenous variables
  - **XGBoost**: Gradient boosting for time series forecasting
- **Features**:
  - Calendar features (day, month, year, weekday)
  - Seasonal decomposition
  - Lag features and rolling statistics
- **Validation**: RMSE comparison across models
- **Output**: 7-day sales forecast with confidence intervals

### Phase 4: Business Intelligence Dashboard
- **Tool**: Power BI
- **Components**:
  - Revenue trends and KPI monitoring
  - Regional sales distribution
  - Customer behavior analysis
  - Forecast vs. actual performance tracking
  - Interactive filters for deep-dive analysis

## 🔍 Key Findings & Insights

### Business Metrics
- **Peak Sales Periods**: Identified seasonal trends and high-demand periods
- **Delivery Performance**: Average delivery times and regional variations
- **Customer Segments**: High-value customer identification and behavior patterns
- **Product Categories**: Top-performing categories and revenue drivers

### Forecasting Results
- **Model Performance**: RMSE comparison between SARIMAX and XGBoost
- **Accuracy**: 7-day forecast reliability metrics
- **Business Impact**: Inventory planning and demand forecasting capabilities

## 📊 Usage Instructions

### Running the Analysis

1. **Database Setup**:
   - Execute `create_table.sql` to create schema
   - Run `import_data.sql` to load data
   - Verify data integrity with sample queries

3. **Exploratory Analysis**:
   ```bash
   jupyter notebook "Analisis_Olist.ipynb"
   ```

3. **Forecasting Model**:
   ```bash
   jupyter notebook "Prediccion_Ventas_Olist.ipynb"
   ```

### Database Connection

```python
import psycopg2
from sqlalchemy import create_engine

# Database connection parameters
conn_params = {
    'host': 'localhost',
    'database': 'olist_db',
    'user': 'your_username',
    'password': 'your_password'
}

engine = create_engine(f"postgresql://{conn_params['user']}:{conn_params['password']}@{conn_params['host']}/{conn_params['database']}")
```

## 🛠️ Technical Architecture

### Data Pipeline
1. **Raw Data** → **PostgreSQL Database**
2. **SQL Analysis** → **Business Insights**
3. **Feature Engineering** → **ML Models**
4. **Predictions** → **Power BI Dashboard**

### Model Architecture
- **Data Preprocessing**: Handling missing values, outliers, and feature scaling
- **Feature Engineering**: Time-based features, seasonal components
- **Model Training**: Cross-validation and hyperparameter tuning
- **Evaluation**: RMSE, MAE, and business-relevant metrics

## 📋 Future Enhancements

- [ ] Real-time data pipeline integration
- [ ] Advanced deep learning models (LSTM, Prophet)
- [ ] Customer lifetime value prediction
- [ ] Recommendation system implementation
- [ ] Automated model retraining pipeline

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/enhancement`)
3. Commit changes (`git commit -am 'Add new feature'`)
4. Push to branch (`git push origin feature/enhancement`)
5. Create Pull Request


## 📞 Contact

For questions or collaboration opportunities, please reach out through the project repository.

---

**Built with** ❤️ **for data-driven business intelligence and predictive analytics**

# Alt Mobility-Data-Analytics-Assignment 🚀

This repository contains the SQL-based data analysis and visualizations for Alt Mobility's Data Analyst Intern assessment. The analysis is based on two datasets: `customer_orders.csv` and `payments.csv`.

---

## 📁 Dataset Overview

- `customer_orders.csv` – contains customer order history including order amount and order status.
- `payments.csv` – contains payment transaction details for each order.

---

## 📌 Task Breakdown & Approach

### 1. Order and Sales Analysis 📦

**Goal:** Analyze order status, revenue trends, and fulfillment performance over time.

🔍 Key Metrics:
- Total orders: 15,000
- Average Revenue per Month: ~₹59,000
- Average Orders per Month: ~235 orders
- Average Fulfillment Rate: Around 33%–36%, indicating that only ~1/3 of all orders are successfully delivered.

🔍 Insight: Out of 15,000 total orders 33.8% (5,069) are in pending status, 33.7% (5,057) have been delivered, and 32.5% (4,874) have been shipped. This reflects a balanced distribution across the fulfillment stages, with a slight backlog in pending orders. 
The near-equal split indicates active logistics operations but suggests potential areas for optimization in order processing and fulfillment efficiency.

📄 Query: [`order_sales_analysis.sql`](SQL/order_sales_analysis.sql)

---

### 2. Customer Analysis 👥

**Goal:** Understand customer behavior such as repeat purchases and customer segmentation.

🔍 Key Metrics:
- First-time vs repeat customers: 7336/ 7664
- Customer Segments: Segment	Criteria (One-Time Buyer	Exactly 1 order, Occasional Buyer	2 to 4 orders, Frequent Buyer)

🔍 Insight: One-Time Buyers usually form the majority — good for growth, but retention is key. Frequent Buyers, though smaller in number, often contribute disproportionately to total revenue.
You can use this segmentation for targeted marketing: Loyalty programs for Frequent Buyers, Incentives for Occasional Buyers to become loyal, Re-engagement campaigns for One-Time Buyers

📄 Query: [`customer_analysis.sql`](SQL/customer_analysis.sql)

---

### 3. Payment Status Analysis 💳

**Goal:** Investigate payment outcomes, success rates, and issues across methods.

🔍 Key Metrics:
- Success vs failure rate: Out of 15,000 total payments, only 33.27% were successfully completed. That’s just 1 in 3 payments going through smoothly — a major red flag that points to potential friction in the payment process.
- Monthly payment trends: Keeping track of how payments perform each month is key. Identifying spikes in failures or improvements in success rates over time can help tie performance back to campaigns, seasonal demand, or platform issues.
- Payment success by method: PayPal edges out slightly as the best performer with a 34.42% success rate, Credit Card follows close at 33.42%, Bank Transfer trails at 32.03%.
The differences aren’t huge, but they signal areas for improvement and prioritization.

🔍 Insight: 📊 Keep an eye on the monthly trend data once it’s available — that could reveal when and possibly why issues are peaking.


📄 Query: [`payment_status_analysis.sql`](SQL/payment_status_analysis.sql)

---

### 4. Order Details Report 📑

**Goal:** Combine order and payment information for a complete reporting view.

🔍 Key Metrics:
- Order ID, date, status, amount
- Payment status, method, amount
- Summary stats (AOV, fulfillment counts)

🔍 Insight: the data reveals key insights into order fulfillment efficiency, payment behavior, and customer purchase trends, enabling informed decision-making to optimize operations and revenue.
📄 Query: [`order_details_report.sql`](SQL/order_details_report.sql)

---

### 5. Customer Retention Analysis 📈

**Goal:** Analyze how customer cohorts retain over time.

🔍 Key Insight:
- Cohort-based retention matrix using first purchase month
- Repeat purchase behavior tracked month over month



📊 Visualization: Designed in [Tool: Tableau / Power BI / Google Data Studio]

---

## 🔧 Tools Used

- MySQL
- Power BI / Tableau (for visualization)
- GitHub for version control

---

## 📬 Author

**Name:** *Sunny Bibyan*  
**Role:** Data Analyst Candidate  
**Contact:** *sunnykumar6121997@gmail.com*  
**GitHub:** [github.com/yourusername](https://github.com/yourusername)

---


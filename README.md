
# Kultra Mega Stores Inventory Analysis DOCUMENTATION

## Project Overview
This project analyzes sales data for Kultra Mega Stores (KMS), an office supplies and furniture retailer based in Lagos with operations in Abuja. The analysis covers order data from 2009 to 2012 to provide business insights and recommendations.

## Data Cleaning and Transformation
- Dataset dimensions: 8,399 rows × 21 columns
- Handled missing values: Replaced 63 empty cells in the Product Margin column with 0

## Case Scenario I Analysis

### 1. Product Category with Highest Sales
Answer  
Technology had the highest sales at **$5,984,248.50**


### 2. Top 3 and Bottom 3 Regions by Sales
Top 3 Regions:
1. West - $3,597,549.41
2. Ontario - $3,063,212.60
3. Prarie - $2,837,304.60

Bottom 3 Regions:
1. Yukon - $975,867.39
2. Northwest Territories - $800,847.35
3. Nunavut - $116,376.47



### 4. Recommendations for Bottom 10 Customers
Strategy: Send discount coupon + free shipping offer to these low-revenue customers:

1. Jeremy Farry ($85.72)
2. Natalie DeCherney ($125.90)
3. Nicole Fjeld ($153.03)
4. Katrina Edelman ($180.76)
5. Dorothy Dickinson ($198.08)
6. Christine Kargatis ($293.22)
7. Eric Murdock ($343.33)
8. Chris McAfee ($350.18)
9. Rick Huthwaite ($415.82)
10. Mark Hamilton ($450.99)


### 5. Shipping Method with Highest Cost
Answer: 
Delivery Truck incurred the highest shipping cost at **$51,971.94**


## Case Scenario II Analysis

### 6. Most Valuable Customers
Top Customers by Sales:

1. Emily Phan (Consumer) - $117,124.43  
   Typical Purchases: Furniture, Office Supplies, Technology

2. Roy Skaria (Corporate) - $92,542.16  
   Typical Purchases: Furniture, Office Supplies, Technology

3. Liz MacKendrick (Corporate) - $76,306.43  
   Typical Purchases: Furniture, Office Supplies, Technology

4. Dennis Kane (Small Business) - $75,967.59  
   Typical Purchases: Furniture, Office Supplies, Technology

5. John Lucas (Small Business) - $72,331.88  
   Typical Purchases: Furniture, Office Supplies, Technology


### 7. Small Business Customer with Highest Sales
Answer: 
Dennis Kane with $75,967.59 in sales (13 orders)


### 8. Corporate Customer with Most Orders (2009-2012)
Answer:  
Adam Hart placed 18 orders totaling $26,114.27


### 9. Most Profitable Consumer Customer
Answer: 
Emily Phan with $34,005.44 profit (29.03% margin)



### 11. Shipping Cost Analysis by Order Priority
Analysis:  
The company's shipping cost allocation by order priority shows mixed efficiency:

- Critical Orders: 
  - Delivery Truck: 228 orders, $47.30 avg cost (Needs Review)
  - Express Air: 200 orders, $8.71 avg cost (Needs Review)
  - Regular Air: 1,180 orders, $7.28 avg cost (Needs Review)

- High Priority Orders: 
  - Delivery Truck: 248 orders, $45.19 avg cost (Inefficient)
  - Express Air: 212 orders, $6.86 avg cost (Optimal)
  - Regular Air: 1,308 orders, $7.65 avg cost (Needs Review)

- Low Priority Orders:  
  - Delivery Truck: 250 orders, $44.53 avg cost (Optimal)
  - Express Air: 190 orders, $8.17 avg cost (Needs Review)
  - Regular Air: 1,280 orders, $8.02 avg cost (Needs Review)
Recommendation:  
The company should optimize shipping methods based on order priority:
- Reserve Express Air for truly critical orders
- Use Delivery Truck more efficiently for low-priority bulk orders
- Re-evaluate the high cost of Delivery Truck for High priority orders



## Conclusion
This analysis provides KMS management with actionable insights to:
1. Focus on high-performing product categories (Technology)
2. Optimize regional sales strategies
3. Improve customer retention for low-revenue customers
4. Optimize shipping costs based on order priority
5. Better understand their most valuable customer segments

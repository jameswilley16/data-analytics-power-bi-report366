# data-analytics-power-bi-report366

## Milestone 2 Completed 
- Orders Table Imported into Power BI 
- Query editor used to remove the card number column
-  Date Columns were split using the split column feature into seperate data and time columns  
- Null data was filtered out the Order Date Column by filtering in the query editor 
- Products Table imported into Power BI
-  Duplicates of removed from the product code column using the remove duplicates function
- Stores Table Imported into Power BI
- Region column was made to be consistent e.g. eeEurope was replaced with Europe
- The three customer tables were uploaded and combined into one table.
- First name and last name columns were merged into one column for the full name
- Columns were renamed to to align with the Power BI naming conventions and to be consistent across the report

## Milestone 3 Completed
- Date Table Created
- Relationships between my dimension table and fact table created in the form of a star schema
- Measures table created and some key measures added e.g. Total Orders & Profit YTD 
- Date and Geographic Hierarchies created 

## Milestones 4 & 5 Completed 
- Report pages created (executive summary, customer detail, product detail, stores map)
- Navigation bar added (still needs to be set up)
### Customer detail page has been built
- Cards added for total number of customers & revenue per customer
- Donut charts added to show customers per country and customers per product category
- Line graph added showing total customers per year
- Table added showing the top 20 customers
- Cards added for top customer (name, their total orders, the total revenue from that customer)
- Date slicer added so the user can select between different years 
  
## Milestone 6 Completed
- Executive Summary Page updated
- Card visuals showing Total Revenue, Total Profit and Total Orders
- Graph showing revenue over time added
- Donut charts for for revenue by country and revenue by store type added
- Bar chart for orders by product category added
- KPI visuals for quarterly revenue, orders, and profit added

## Milestone 7 Completed
- Product Detail Page Updated
- Gauge visuals comparing the current quarterly performance (orders, revenue, profit) to a target of 10% growth from the previous quarter.
- Area Chart added to show the revenue by product category
- Top 10 products added as a table
- Added a scatter graph of Quantity Sold vs Profit per Item
- Slicer Toolbar added allowing the data to be filtered by category and/or country
- Filter state cards were added showing the current filtering which had been applied 

## Milestone 8 Completed
- Store Map Visual added
- Drill through page added so you can click on the different stores on the map and drill through to get more information about a specific store including profit and revenue vs target, top 5 products, and total orders by category
- Tool tip page added so you can hover over the stores on the map to see the profit vs target for that store

## Milestone 9 Completed
- Cross Filtering of the visuals was fixed
- Navigation Bar was updated so you can easily navigate from one page to another.

## Milestone 10 Completed
- Queries were run on the following things using SQL
- How many staff are there in all of the UK stores?
- Which month in 2022 has had the highest revenue?
  - to find the revenue I used REGEXP_REPLACE to remove the £ from the product_price then converted it from text to numeric to allow it to be multiplied by the product quantity
  - joined the orders table and the products table by the shared product code column
  - filtered so only orders made in 2022 were shown
  - extracted month from the order date column, column had to be cast as date as the data type was text, this allowed me to group by month
  - Ordered with highest revenue at the top of the column
- Which German store type had the highest revenue for 2022
   - adapted the previous query
   - added dim_stores.country_code = 'DE' to the WHERE statement
   - added an additional join statement, joining dim_stores and orders column by store code
   - Grouped by store_type instead of month
- Create a view where the rows are the store types and the columns are the total sales, percentage of total sales and the count of orders
   - took sales to be revenue
   - ran a main query adapted from the previous queries which found the total revenue grouped by store type
   - ran a subsquery which just calculated the total revenue without it being grouped
   - therefore, (main query/subquery)*100 = percentage of sales for that store type
- Which product category generated the most profit for the "Wiltshire, UK" region in 2021?
   - Instead of profit I used revenue again as I couldn't find the cost of the product to take off the price they were sold for.
   - adapted from the other queries with the WHERE statement being amended accordingly  

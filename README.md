# AdventureWorks Cycles Database Project

A normalized SQL database system for a fictional cycling company, *AdventureWorks Cycles*, designed to demonstrate advanced relational design, constraint enforcement, transaction control, and performance tuning using SQL.

---

## Project Structure

| File | Description |
|------|-------------|
| `a_b_c_main_tables.sql` | Core schema: tables, PKs, FKs (non-cascading) |
| `b_referential_integrity_constraints.sql` | Adds cascading foreign key constraints |
| `d_populate_tables.sql` | Sample data for testing and demonstration |
| `e_constraints_testing.sql` | Tests for NOT NULL, CHECK, FK, PK, defaults, etc. |
| `f_rollback_commit.sql` | Transactions and stored procedure with COMMIT/ROLLBACK |
| `g_performance_tuning.sql` | Adds indexes for performance optimization |

---

## Database Schema Overview

### Core Tables
- `Manufacturer`, `Product`, `Category`, `Customer`, `Order`, `OrderStatus`
- `ContactDetails`, `Tags`, `Dimensions`, `Feedback`

### Junction Tables
- `ManufacturerContactDetails`, `ProductCategory`, `ProductTags`
- `ProductDimensions`, `OrderDetails`

### Key Features
- Composite primary keys
- Foreign key constraints with `ON DELETE CASCADE` or `SET NULL`
- Computed columns (e.g., `LineTotal`)
- Default values and check constraints
- Stored procedure for transaction-safe order placement
- Indexes for performance tuning

---

## 🔧 How to Set Up

1. **Create Tables**  
   Run `a_b_c_main_tables.sql` in your MySQL-compatible environment.

2. **Apply Cascading Foreign Keys**  
   Execute `b_referential_integrity_constraints.sql` to enforce referential integrity.

3. **Insert Sample Data**  
   Load entries using `d_populate_tables.sql`.

4. **Run Constraint Tests**  
   Use `e_constraints_testing.sql` to validate behavior for NULLs, CHECKs, FK violations, etc.

5. **Test Transactions**  
   - Commit sample transaction
   - Use `PlaceOrderWithStockCheck()` stored procedure
   File: `f_rollback_commit.sql`

6. **Optimize with Indexes**  
   Add performance indexes using `g_performance_tuning.sql`.

---
## Constraint Testing Highlights

| Constraint Type | Example Test |
|-----------------|--------------|
| NOT NULL | `ManufacturerName`, `CustomerName` |
| DEFAULT | `CustomerPoints` defaults to 0 |
| CHECK | `StockQuantity ≥ 0`, `Rating` between 1–5 |
| FOREIGN KEY | Invalid references → error |
| COMPOSITE PK | Duplicate pairings rejected |
| ON DELETE CASCADE | Deletion of parent removes dependents |
| ON DELETE SET NULL | Order status is NULLed if deleted |
| AUTO-INCREMENT + PK | ID conflicts fail |
| Transaction Safety | Rollback if insufficient stock |

---
## Potential issues (look into!)

OrderStatusID in the Order table is marked as NOT NULL but the foreign key uses ON DELETE SET NULL, which causes a conflict.

The table name Order is a reserved SQL keyword and may cause issues despite being wrapped in backticks.

Foreign keys are defined twice: once in the main table file and again with cascading rules. This is intentional, but be cautious to avoid conflicts.

Columns with ON DELETE SET NULL behavior must be nullable, but some are defined as NOT NULL.

## Stored Procedure

### `PlaceOrderWithStockCheck()`

Safely inserts an order only if stock is available:

```sql
CALL PlaceOrderWithStockCheck(
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    shipping_date DATE,
    order_status INT,
    total_amount DECIMAL(10,2)
);




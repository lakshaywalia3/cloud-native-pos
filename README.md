# 📦 Advance Inventory Manager & POS System

A comprehensive **Offline Point of Sale (POS) and Inventory Management System** built with Python and Flask. Designed for small businesses to manage sales, track inventory with QR codes, handle customer credits, and analyze business performance without needing an active internet connection.

![POS Terminal](demo/demo%20(3).png)

## ✨ Features

### 🛒 Point of Sale (POS) Terminal
* **Fast Checkout:** Search products by name or scan QR codes instantly.
* **Cart Management:** Adjust quantities, remove items, and view live tax/total calculations.
* **Multiple Payment Methods:** Process transactions via **Cash**, **Card**, or **Credit** (Book Debt).
* **Quick Customer Add:** Add new customers directly from the checkout screen.
* **Receipts:** Generates printable receipts for every transaction.

### 📦 Inventory Management
* **Product Tracking:** Manage stock levels, prices, and product details.
* **QR Code Generation:** Automatically generates unique QR codes for every product for scanning.
* **Bulk Operations:** **Import** and **Export** inventory data via CSV.
* **Dead Stock Alerts:** Identifies products with high stock but low sales.

### 👥 Customer & Credit Management
* **Customer Profiles:** Store contact details, address, and transaction history.
* **Credit/Debt Tracking:** Automatically calculates outstanding balances for "Credit" sales.
* **Payment Recording:** Record partial or full payments against customer debts.

### 📊 Business Analytics Dashboard
* **Financial Overview:** View Total Revenue, Gross Profit, and Inventory Value.
* **Risk Assessment:** Estimates potential loss from unpaid customer credits.
* **Sales Breakdown:** Visual separation of Cash vs. Card vs. Credit sales.

---

## 📸 Screenshots

| Inventory Management | Business Analysis |
|:---:|:---:|
| ![Inventory](demo/demo%20(1).png) | ![Analysis](demo/demo%20(2).png) |

| Customer Data | POS Terminal |
|:---:|:---:|
| ![Customers](demo/demo%20(4).png) | ![POS](demo/demo%20(3).png) |

---

## 🛠️ Tech Stack

* **Backend:** Python 3, Flask
* **Database:** SQLite (SQLAlchemy ORM)
* **Frontend:** HTML5, CSS3, JavaScript (Vanilla)
* **Tools:**
    * `qrcode` (Python library for generating codes)
    * `pandas` (For CSV handling)
    * `Flask-Login` (Authentication)

---

## 🚀 Installation & Setup

### Prerequisites
* Python 3.x installed
* Git installed



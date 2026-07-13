# 🛒 Men's Store App

A modern, fully-functional E-commerce mobile application built with Flutter. This project showcases a seamless user experience for browsing, searching, managing a shopping cart, and handling user accounts.

Developed as part of the **ITI (Information Technology Institute)** Flutter Development Track.

---

## 📱 App Walkthrough

<p align="center">
  <!-- اسحب ملف الفيديو Men's Store App.mp4 وارميه في الـ Readme على جيت هاب، واستبدل الرابط اللي تحت بالرابط اللي جيت هاب هيولده لك -->
  <video src="ضع_رابط_الفيديو_المرفوع_هنا" width="300" controls autoplay muted loop>
    Your browser does not support the video tag.
  </video>
</p>

---

## ✨ Key Features

* **🔐 User Authentication:** Complete login and signup flows with:
  * Password visibility toggle.
  * Form validations and error handling.
  * Loading state indicators during network requests.
* **🔍 Product Discovery & Search:**
  * Categorized product feed (All, Clothes, Electronics, etc.).
  * Dynamic search bar to find products quickly.
* **🛍️ Product Details:** Dedicated screen displaying item details, description, rating, price, and a direct "Add to Cart" action.
* **🛒 Cart Management:** Real-time calculation of sub-totals, dynamic quantity adjustments, and a smooth checkout flow.
* **👤 User Profile & Settings:** Easy access to shipping address book, system FAQs, and secure logout confirmation.

---

## 🛠️ Tech Stack & Architecture

* **Framework:** [Flutter](https://flutter.dev/) (Dart)
* **Architecture Pattern:** Clean Architecture (Feature-First approach)
* **State Management:** BLoC / Cubit 
* **Data Sources:** REST API (Fake API for product catalog & authentication)

---

## 📂 Project Structure (Feature-First)

The project is structured using a **Feature-First** approach, making it highly modular and scalable:

```text
lib/
│
├── core/                    # Shared utilities, themes, network client, and global constants
│
└── features/                # Application features (Modular approach)
    ├── auth/                # Authentication Feature
    │   ├── data/            # Models, data sources, and repositories for Auth
    │   ├── cubit/           # Auth Cubits and States
    │   └── presentation/    # Login, Sign Up screens & widgets
    │
    ├── products/            # Product Catalog & Search Feature
    │   ├── data/            # Product models & API requests
    │   ├── cubit/           # Product fetching Cubits and States
    │   └── presentation/    # Discover & Product Details screens
    │
    └── cart/                # Shopping Cart Feature
        ├── data/            # Cart models & logic
        ├── cubit/           # Cart management Cubits
        └── presentation/    # Cart & Checkout screens


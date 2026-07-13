# 🛒 Men's Store App (ITI Project #3)

A modern, fully-functional E-commerce mobile application built with Flutter. This project showcases a seamless user experience for browsing, searching, managing a shopping cart, and handling user accounts.

This is the **3rd Project** developed as part of the **ITI (Information Technology Institute)** Flutter Development Track.

---

## 📱 App Walkthrough

You can watch the full application walkthrough video directly on Google Drive by clicking the link below:

🚀 **[Click Here to Watch the App Walkthrough Video](https://drive.google.com/file/d/1Ykfjl7C889aAB420v3RFUPXqSrp4xs6z/view?usp=sharing)**

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

## ⚠️ Project Status & Known Limitations

> 📌 **Note:** As this is an academic/training project, some features are currently simulated (Mocked) or under active development:
* **Real Payment Gateway:** The checkout button navigates smoothly but does not process real financial transactions (using dummy values for shipping and VAT).
* **Profile Edit:** Some options inside the Account section (like editing user details) are static UI views and not connected to active database writes.
* **State Persistence:** Cart items and authentication tokens may reset when the application is completely closed and reopened (No persistent local storage integration yet).

---

## 🛠️ Tech Stack & Architecture

* **Framework:** [Flutter](https://flutter.dev/) (Dart)
* **Architecture Pattern:** Clean Architecture (Feature-First approach)
* **State Management:** BLoC / Cubit 
* **Data Sources:** REST API (Fake API for product catalog & authentication)

---

## 📂 Project Structure (Feature-First)

The project is structured using a strict **Feature-First** approach, keeping global shared code in `core` and self-contained features inside `features` with a clean separation of concerns:

```text
lib/
│
├── core/                         # Shared & global application helper layers
│   ├── constants/                # Global constants (App assets, strings, colors)
│   ├── models/                   # Global shared models
│   ├── network/                  # API Service client config
│   ├── routing/                  # App routes and navigation setup
│   ├── theme/                    # Light/Dark themes and style sheets
│   └── widgets/                  # Reusable global widgets
│
├── features/                     # Highly modular feature components
│   ├── address_book/             # Saved shipping addresses feature
│   │   ├── data/                 # Data layer (Clean Architecture)
│   │   │   ├── data_source/      # Remote/Local data sources (e.g., Address_remote_data_source.dart)
│   │   │   ├── models/           # Data models & JSON serialization (e.g., Address_model.dart)
│   │   │   └── repositories/     # Repository implementations (e.g., Address_repository.dart)
│   │   └── presentation/         # UI layer
│   │
│   ├── auth/                     # Authentication Module
│   │   ├── models/               # Request & Response models (e.g., Login models)
│   │   └── presentation/         
│   │       ├── manager/          # State management (log_in_cubit.dart & log_in_state.dart)
│   │       ├── screens/          # Screen layouts (log_in_screen.dart & sign_up_screen.dart)
│   │       └── widgets/          # UI specific widgets (auth_header.dart & auth_footer.dart)
│   │
│   ├── cart/                     # Shopping cart module
│   │
│   ├── layout/                   # Main app container layout (Bottom Navigation Bar)
│   │   └── presentation/         
│   │       └── screens/          
│   │
│   ├── products/                 # Clothes & Products Catalog
│   │
│   └── profile/                  # Account & user options
│       └── presentation/         
│
└── main.dart                     # Application entry point

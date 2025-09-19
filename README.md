# rick_and_morty_app

[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Kikekike/rick_and_morty_app)](https://github.com/Kikekike/rick_and_morty_app)
![GitHub top language](https://img.shields.io/github/languages/top/Kikekike/rick_and_morty_app?color=pink)
![GitHub last commit](https://img.shields.io/github/last-commit/Kikekike/rick_and_morty_app?color=green)

A Flutter application inspired by the Rick and Morty universe, developed with a focus on best practices, clean architecture, and a smooth, responsive user experience.

Flutter project created with FlutLab - https://flutlab.io

## 🚀 Key Features

* **Clean architecture** using `Provider`, `Controllers`, and `Custom Widgets`
* Integration with **REST** and **GraphQL APIs** from [rickandmortyapi.com](https://rickandmortyapi.com)
* **Responsive design** tested across multiple resolutions (Android & iOS)
* **Progressive data loading** with scroll using `ListView.builder`
* Data validation and **error handling**
* **Filters and search functionality** on character, location, and episode pages
* Custom **Navigation Bar** and reusable `BaseLayout` for consistent page structure
* **Visual optimization** with real device and emulator screenshots

## API Used

This project uses the Rick and Morty API as a data source to display characters and episodes.
The Rick and Morty API is an open-source project created by Axel Fuhrmann. All rights to the Rick and Morty series belong to their respective creators and distributors.

- View on https://rickandmortyapi.com/

## 📱 App Views

#### Physical Device View (Motorola G60)
             
<img src="https://github.com/user-attachments/assets/f99a1e90-688f-4d1b-a60a-c6816ed0f164" alt="Portada del celular" height="400" title="Home"> 
<img src="https://github.com/user-attachments/assets/a691a6a5-80fd-4a7b-964b-79e17342b641" alt="Home" height="400" title="App Flow"> 
<img src="https://github.com/user-attachments/assets/1624d5d7-226d-45d7-b6b4-60c4fd45d268" height="400"> 
<img src="https://github.com/user-attachments/assets/a6b4f820-4111-450e-acf6-551c6e79981f" height="400"> 
<img src="https://github.com/user-attachments/assets/9d473ccc-da7d-449c-916c-2da0adf97535" height="400">
<img src="https://github.com/user-attachments/assets/e42135cb-08cc-43f9-afaf-d3432d7d5baa" height="400">
<img src="https://github.com/user-attachments/assets/c16ba37b-0230-4733-9b25-2ffcb891b4ec" height="400">
<img src="https://github.com/user-attachments/assets/ab47408f-b409-48b0-8f10-6bf108580a5c" height="400">
<img src="https://github.com/user-attachments/assets/d0c756ca-5389-4ace-bf44-834e0af6ab99" height="400">
<img src="https://github.com/user-attachments/assets/8570663c-0d8d-4536-93bc-32bc1e218dbe" height="400">
<img src="https://github.com/user-attachments/assets/f6c8cf97-211d-47a9-a17a-29ed47fd7a5a" height="400">
<img src="https://github.com/user-attachments/assets/564bea67-86c9-4255-82ab-646466a636ab" height="400">
<img src="https://github.com/user-attachments/assets/a3aa119f-f135-4a98-8744-50fb44add425" height="400">
<img src="https://github.com/user-attachments/assets/b558a7de-2a72-467b-b7ae-aeab2ae2cef9" height="400">
<img src="https://github.com/user-attachments/assets/8381004f-f312-4910-97ad-f96e979903b5" height="400">

## Emulator Views

* **Android** (360x640)

<img height="400" alt="1  360 x 640" src="https://github.com/user-attachments/assets/0e50872f-729e-4d08-98b8-26ac3a99fdf3" />
<img height="400" alt="2  360 x 640" src="https://github.com/user-attachments/assets/b2e2bd62-fa7b-49e7-9df4-9c1304cdd761" />
<img height="400" alt="3  360 x 640" src="https://github.com/user-attachments/assets/a4b604d4-6d08-45c9-9494-70c6998555c9" />

* **Android** (411x731)

<img height="400" alt="1  411 x 731" src="https://github.com/user-attachments/assets/601b66b8-e7bc-4cab-b63f-cb9876a9c713" />
<img height="400" alt="2  411 x 731" src="https://github.com/user-attachments/assets/5d9158b6-eb1a-4f89-a715-27c167cc675b" />
<img height="400" alt="3  411 x 731" src="https://github.com/user-attachments/assets/9c68a678-6732-44c7-acc0-13b4abcddbc4" />

* **iPhone** (375x812)

<img height="400" alt="1  375 x 812" src="https://github.com/user-attachments/assets/74876bf1-9ba8-4411-845b-2d5eac8c1659" />
<img height="400" alt="2  375 x 812" src="https://github.com/user-attachments/assets/9abc852b-d6b6-4ee0-bf34-e2803d95751f" />
<img height="400" alt="3  375 x 812" src="https://github.com/user-attachments/assets/82f50d25-ff39-47fc-8876-6f982a32a544" />

* **iPhone** (428x926)

<img height="400" alt="1  428 x 926" src="https://github.com/user-attachments/assets/c7a338fc-1702-4970-abaa-2bed674e3bb3" />
<img height="400" alt="2  428 x 926" src="https://github.com/user-attachments/assets/1a56aeee-fb86-44ad-aeea-fe53f3518825" />
<img height="400" alt="3  428 x 926" src="https://github.com/user-attachments/assets/4d26d6a0-cc88-49c7-a5e8-24dbaefbe9d9" />

## 🧠 Applied Best Practices

* Separation of logic and UI
* State management with `Provider`
* Reusable custom widgets
* Code modularization
* Structured navigation
* Responsiveness using `Expanded`, `Flexible`, `MediaQuery`, etc.
* `BaseLayout` for visual consistency across pages

## 🔗 Useful Resources

* [Flutter Codelab](https://flutter.dev/docs/get-started/codelab)
* [Flutter Cookbook](https://flutter.dev/docs/cookbook)
* [Flutter Docs](https://flutter.dev/docs)
* [FlutLab Docs](https://flutlab.io/docs)
* [Rick and Morty API](https://rickandmortyapi.com/)

## 🛠️ IDE Used

Project developed in **FlutLab**, an online IDE for Flutter that allows compiling, testing, and sharing projects directly from the browser.

## Getting Started: FlutLab - Flutter Online IDE

- How to use FlutLab? Please, view our https://flutlab.io/docs
- Join the discussion and conversation on https://flutlab.io/residents

# 📌 Final Notes

This project showcases how to build a complete Flutter app with a focus on scalability, maintainability, and user experience. If you're interested in collaborating or have suggestions, I'd love to hear from you!

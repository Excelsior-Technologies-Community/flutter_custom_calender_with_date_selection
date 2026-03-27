# 📅 flutter_custom_calendar_with_date_selection
```
flutter_custom_calendar_with_date_selection is a modern, lightweight and highly customizable Flutter calendar library that provides powerful date selection features including single date selection and range selection.

It helps developers easily build booking systems, scheduling apps, event planners and productivity tools without handling complex calendar logic manually.

The library offers a clean monthly calendar UI, proper weekday alignment (Mon–Sun), smooth navigation between months, range highlighting, event indicators and customizable styling options.

You can seamlessly integrate this calendar into Android, iOS, Web and Desktop applications using a simple controller-based architecture.
```

-------------

## ✨ Features
```
- 🗓️ Full Monthly Calendar View (Mon–Sun aligned)  
- 🔁 Smooth Month Navigation (Previous / Next)  
- 🎯 Single Date Selection  
- 🔄 Range Selection (Start → End)  
- 🌟 Highlight Current Day (Today)  
- 📆 Previous & Next Month Date Preview  
- 🔴 Event Indicator Dots  
- 🎨 Fully Customizable UI Styles  
- 🧠 Controller-Based State Management  
- ⚡ Lightweight & High Performance  
- 📱 Supports Android, iOS, Web & Desktop  
```

----------------------------

## 📦 Installation

Add dependency in your pubspec.yaml
```
yaml
dependencies:
  flutter_custom_calendar_with_date_selection:
    path: https://github.com/your-username/flutter_custom_calendar_with_date_selection
```
Then run:
```
flutter pub get
```

------------------------------

## 🎬 Preview

https://github.com/user-attachments/assets/3d185b47-83a4-49e9-a00d-235f3f0f71de

------------------------------

## 🗂 File Structure
```
flutter_custom_calendar_with_date_selection/
│
├─ lib/
│   ├─ flutter_custom_calendar_with_date_selection.dart
│   │   // Main export file
│   │
│   ├─ main.dart
│   │   // Example demo app
│   │
│   └─ src/
│       ├─ calendar_controller.dart
│       │   // Handles state, navigation & selection logic
│       │
│       ├─ calendar_model.dart
│       │   // Calendar date model structure
│       │
│       ├─ calendar_style.dart
│       │   // UI customization (colors, text styles)
│       │
│       └─ calendar_view.dart
│           // Main calendar UI widget
│
├─ README.md
│   // Documentation
│
├─ LICENSE
│   // License file
│
└─ pubspec.yaml
    // Package configuration
```

------------------------------

## 🚀 How To Use

1️⃣ Import Package
```
import 'package:flutter_custom_calendar_with_date_selection/flutter_custom_calendar_with_date_selection.dart';
```
2️⃣ Initialize Controller
```
final controller = CalendarController();
```
3️⃣ Use Calendar Widget
```
CustomCalendar(
  controller: controller,
  onDateSelected: (date) {
    print("Selected Date: $date");
  },
)
```
4️⃣ Range Selection Example
```
controller.selectDate(DateTime(2026, 3, 10));
controller.selectDate(DateTime(2026, 3, 15));
```
5️⃣ Custom Styling
```
CustomCalendar(
  controller: controller,
  style: CalendarStyle(
    selectedColor: Colors.teal,
    todayColor: Colors.orange,
    defaultColor: Colors.grey,
  ),
)
```

-------------------------

## 🎨 Calendar Properties

| Feature         | Description                       |
| --------------- | --------------------------------- |
| Month View      | Displays full monthly grid        |
| Navigation      | Move between months               |
| Selection       | Single & range date selection     |
| Today Highlight | Highlights current date           |
| Event Dots      | Show indicators on specific dates |
| Styling         | Customize colors & text           |
| Controller      | Manage calendar state             |


## 📄 MIT License
```
Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files to deal in the Software without restriction.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.
```


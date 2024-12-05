# Todo App
A simple Todo app built with Flutter following the principles of Clean Architecture. The app utilizes BLoC for state management, GetIt for Dependency Injection, and Hive for local storage.

## DEMO

Here is a quick demo of the App   
<img src="assets/screenshot/todo_rec2.gif" alt="Demo GIF" width="500" height="300">



Features
Create, read, update, and delete tasks.
Tasks are persisted locally using Hive.
State management is handled by BLoC.
Dependency Injection using GetIt for managing app dependencies.
Technologies Used
Flutter - Cross-platform app development framework.
BLoC - State management pattern.
Clean Architecture - Organizes code to ensure separation of concerns.
GetIt - Service locator for Dependency Injection.
Hive - Lightweight NoSQL database for local storage.
Architecture
This app follows Clean Architecture, dividing the code into several layers:

Data Layer - Responsible for managing data (local storage with Hive).
Domain Layer - Contains the business logic, models, and use cases.
Presentation Layer - Responsible for UI components and state management with BLoC.


## Setup

To get started with the app, clone this repository and install the required dependencies.

### Clone the repo:
 
`git clone https://github.com/yourusername/todo-app.git
`      
 
`cd todo-app
`    

Install the dependencies and Run:  
`flutter pub get
`  
Run the app:   
`flutter run
`  

## File Structure 


lib/
├── core/                 # Core utilities, constants, helpers
│   ├── utils/            # Utility functions, helpers
│   │   ├── di/           # Dependency injection setup (GetIt)
├── features/             # App features (e.g., task, authentication)
│   ├── tasks/            # Task feature
│   │   ├── data/         # Data sources, repositories
│   │   ├── domain/       # Business logic, use cases
│   │   └── presentation/ # UI, BLoC
└── main.dart             # Entry point for the app

# Todo App

Project struture

...
assets

├── images                              # App images
lib
├── app
|   ├── router
|   |   ├── app_router.dart             # Application Router
|   ├── app.dart                        # MainApp File
├── core
|   ├── base State sceren               # Base class for ui
|   ├── base use case                   # Base class for use case
|   ├── di                              # Dependency Injection Module
|   ├── domain                          # Base Classes for domain layer
|   ├── utils                           # utilities, constants, and extensions
├── shared                              # Shared Entity, Models, Widget, Service
├── features
|   ├── counter                         # Feature Counter
|   |   ├── data
|   |   |   ├── datasources             # Data source (network, local)
|   |   |   ├── models                  # DTO / Payload Model
|   |   |   ├── repositories            # Implementation of domain Repository
|   |   ├── domain
|   |   |   ├── entities                # Business Domain Entity
|   |   |   ├── repositories            # Interface Repository
|   |   |   ├── usecases                # Business Use Cases
|   |   ├── presentation
|   |   |   ├── blocs                   # Application Logic & State management
|   |   |   ├── pages                   # Application pages
|   |   |   ├── widgets                 # Common Widgets in Feature

test
├── app                                 # App Test
├── features
|   ├── counter                         # Feature Counter Test
|   |   ├── data
|   |   |   ├── datasources             # Data source (network, local) test
|   |   |   ├── models                  # DTO / Payload Model test
|   |   |   ├── repositories            # Implementation repository test
|   |   ├── domain
|   |   |   ├── entities                # Business Domain Entity test
|   |   |   ├── repositories            # Interface Repository test
|   |   |   ├── usecases                # Business Use Cases test
|   |   ├── presentation
|   |   |   ├── blocs                   # Bloc Test
|   |   |   ├── pages                   # Application pages test
|   |   |   ├── widgets                 # Common Widgets in Feature test
├── helpers                             # Common Test Helpers
...



How to Use
Step 1:

Download or clone this repo by using the link below:

Step 2:

Go to project root and execute the following command in console to get the required dependencies:

flutter pub get 
Step 3:

This project uses inject library that works with code generation, execute the following command to generate files:

flutter packages pub run build_runner build --delete-conflicting-outputs
or watch command in order to keep the source code synced automatically:

flutter packages pub run build_runner watch


Libraries & Tools Used
Dio
Hive
Bloc (State Management)
Logging
Json Serialization
Dependency Injection
Sizer
Equatable
Clean Architecture


Feature

1)For add todo you can do using click add button 
2)To select date use calendra at top
3)To mark done or unmark long press todo
4)For delete click delete icon
5)For edit click on todo and edit todo


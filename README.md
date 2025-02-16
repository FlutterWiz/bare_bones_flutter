# bare_bones_flutter

<img src="https://github.com/user-attachments/assets/1b251200-f632-446d-a552-64fbf193daad" width="500">

A Flutter project that serves as a template with essential features for building a robust mobile application.


## ✨ Features

- **Localization**  
  Supports multiple languages to cater to a global audience.
- **MVVM Architecture**  
  Follows the Model-View-ViewModel architecture for a clean and maintainable codebase.
- **Authentication Pages**  
  Includes Sign In and Sign Up pages with text form fields validated using regular expressions.
- **Navigation**  
  Utilizes `go_router` for navigation and `shell_route` for nested routing.
- **Main Branch**  
  No state management, providing the most general case. No ViewModel since there is no functionality yet.
- **Firebase Integration**  
  - Functional Sign In, Sign Out, and Sign Up using Firebase.
  - Built on top of the main branch's features.
  - Incorporates `BLoC` and `Riverpod` for state management.

## 🌿 Branches

- **main**  
  Basic template with the features listed above. No state management or ViewModel.
- **bloc**  
  Extends the main branch with Firebase integration (using BLoC) and additional authentication functionalities.
- **riverpod**  
  Extends the main branch with Firebase integration (using Riverpod) and additional authentication functionalities.

## 🚀 Getting Started

To get started with this project, clone the repository and switch to your desired branch.

## 📁 Project Structure

The project follows a modular structure with a focus on separation of concerns:

    lib/
    ├─ core/
    │  ├─ config/
    │  ├─ constants/
    │  ├─ di/
    │  ├─ init/
    ├─ presentation/
    │  ├─ design_system/
    │  ├─ l10n/
    │  ├─ views/
    ├─ main.dart


## 🛠 Makefile

The project includes a Makefile to manage tasks such as generating localization files and cleaning the project.

### Generate the localization files

```sh
make localization
```


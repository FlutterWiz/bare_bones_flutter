# bare_bones_flutter

In progress.

---

![x](https://github.com/matanlurey/mansion/assets/67283777/a16ab1c4-671a-4832-9c9e-da2a13a39c91)

A Flutter project that serves as a template with essential features for building a robust mobile application.

YouTube Video: https://youtu.be/t7Ama0flQrY

Medium Article: https://medium.com/@alperefesahin/jumpstart-your-flutter-development-with-bare-bones-flutter-a6592fda9d84

## Features

- **Localization**: Supports multiple languages to cater to a global audience.
- **MVVM Architecture**: Follows the Model-View-ViewModel architecture for a clean and maintainable codebase.
- **Authentication Pages**: Includes Sign In and Sign Up pages with text form fields validated using regular expressions.
- **Navigation**: Utilizes `go_router` for navigation and `shell_route` for nested routing.
- **Main Branch**: No state management, providing the most general case. No ViewModel since there is no functionality yet.
- **Firebase Integration (firebase-riverpod branch)**:
  - Functional Sign In, Sign Out, and Sign Up using Firebase.
  - Built on top of the main branch's features.
  - Incorporates `Riverpod` for state management.

## Branches

- **main**: Contains the basic template with the features listed above. No state management or ViewModel.
- **firebase-riverpod**: Builds on the main branch with Firebase integration (using Riverpod) and additional functionalities for user authentication.

## Getting Started

To get started with this project, clone the repository and switch to your desired branch.

## Project Structure

The project follows a modular structure with a focus on separation of concerns:

    lib/
    ├─ core/
    │  ├─ constants/
    │  ├─ design_system/
    │  ├─ di/
    │  ├─ init/
    ├─ data/
    │  ├─ di_repository/
    │  ├─ repository/
    ├─ domain/
    │  ├─ di_usecase/
    │  ├─ model/
    │  ├─ usecase/
    ├─ features/
    │  ├─ auth/
    │  ├─ dashboard/
    │  ├─ navigation/
    │  ├─ profile/
    │  ├─ search/
    ├─ l10/
    │  ├─ en.arb
    │  ├─ tr.arb
    ├─ main.dart


## Makefile

The project includes a Makefile to manage tasks such as generating localization files and cleaning the project.

### Generate the localization files

```sh
make -f Makefile localization
```


# Project Overview

This project is a Flutter-based drag-and-drop editor for creating simple, interactive lessons. The editor, named "Rubric," allows users to build educational content by arranging various elements on a canvas. It supports exporting lessons to JSON and previewing them in a read-only mode.

## Key Technologies

- **Framework:** Flutter
- **Language:** Dart
- **State Management:** The project appears to use a custom solution with `ChangeNotifier` for managing editor and canvas state.
- **Serialization:** JSON serialization is handled using `json_serializable` and `freezed` for immutable data models.
- **UI Components:** The editor includes custom-built UI components for a rich user experience, such as a color picker and various input fields.

## Architecture

The application is structured into three main parts:

1.  **Rubric Editor:** The core of the application, providing the drag-and-drop interface for creating and editing lessons. It consists of a navigation bar, a sidebar for adding new elements, and a central viewer that displays the canvas.
2.  **Rubric Reader:** A read-only viewer for previewing the created lessons. It renders the lesson content based on the JSON output from the editor.
3.  **Models:** A set of data models represents the canvas, its elements, and their properties. These models are immutable and use the `freezed` package for code generation.

## Building and Running

To build and run this project, you'll need to have the Flutter SDK installed.

### Get dependencies

```bash
flutter pub get
```

### Run the code generator

This project uses code generation for data models. Run the following command to generate the necessary files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Run the app

You can run the app on any of the supported platforms (web, desktop, or mobile):

```bash
flutter run
```

## Development Conventions

### Coding Style

The project follows the standard Dart and Flutter coding styles, with a few customizations defined in `analysis_options.yaml`. It uses `flutter_lints` for static analysis and enforces a line width of 120 characters.

### Testing

The `test/` directory contains unit tests for the project. To run the tests, use the following command:

```bash
flutter test
```

### Contribution Guidelines

There are no explicit contribution guidelines in the project. However, based on the code structure, it's recommended to follow these conventions:

-   Create new UI components in the `lib/src/components/` directory.
-   Define new lesson elements in the `lib/src/elements/` directory, following the existing structure for models, views, and toolbars.
-   Add any new data models to the `lib/src/models/` directory and use the `freezed` package for creating immutable classes.

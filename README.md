# Bookly
[![image alt](https://github.com/manar42/Bookly/blob/9fd2508187164c97c097b8f43ec697317360e57e/-.png)
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/manar42/Bookly)

Bookly is a cross-platform mobile application built with Flutter that allows users to discover, search, and read free books. It fetches data from the Google Books API and provides a clean, user-friendly interface for an enjoyable reading experience. The app supports both light and dark themes, as well as multiple languages (English and Arabic).

## Features

- **Discover Books**: Browse curated lists of featured and the newest books available.
- **Book Search**: Find books by searching for their titles.
- **Detailed Views**: Get comprehensive details for each book, including title, author, description, and user ratings.
- **Book Reader**: Read books directly within the app. The app uses `syncfusion_flutter_pdfviewer` for PDF previews and provides a text reader for descriptions.
- **Light & Dark Mode**: Seamlessly switch between light and dark themes for comfortable reading in any environment.
- **Multi-Language Support**: The interface is available in both English and Arabic.
- **Interactive Drawer Menu**: An easy-to-access side menu, built with `flutter_zoom_drawer`, for settings and navigation.
- **Pull to Refresh**: Update the book lists with a simple pull-down gesture.

## Architecture

The application is built following principles of Clean Architecture to ensure a scalable, maintainable, and testable codebase.

-   **State Management**: BLoC (with Cubit) is used for managing the application's state, separating UI from business logic.
-   **Dependency Injection**: `get_it` is used as a service locator to provide dependencies like repositories and API services throughout the app.
-   **Navigation**: `go_router` handles declarative routing, making navigation logic clear and centralized.
-   **Networking**: `dio` is used for efficient and robust communication with the Google Books API.
-   **Local Storage**: `shared_preferences` caches user preferences like theme and language settings.

## Core Dependencies

-   `flutter_bloc`: For state management.
-   `go_router`: For application routing.
-   `dio`: For network requests.
-   `get_it`: For dependency injection.
-   `cached_network_image`: To cache and display book cover images.
-   `syncfusion_flutter_pdfviewer`: For rendering PDF book previews.
-   `flutter_zoom_drawer`: For the animated side menu.
-   `flutter_localization`: For internationalization (i18n).
-   `shimmer`: To display loading skeletons for a better user experience.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)

### Installation

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/manar42/Bookly.git
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd Bookly
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the app:**
    ```sh
    flutter run
    ```

## Project Structure

The project is organized into a feature-first directory structure.

```
lib
├── core/                  # Core components shared across features
│   ├── cubit/             # Global Cubits (theme, localization)
│   ├── errors/            # Failure and error handling
│   ├── theme/             # Theme data
│   └── utils/             # API services, routing, DI, helpers
│
├── features/              # Feature-based modules
│   ├── home/              # Home screen (book lists, drawer)
│   ├── search/            # Book search functionality
│   ├── reader/            # In-app book reader
│   └── splash/            # Splash screen
│
├── main.dart              # App entry point
└── constants.dart         # App-wide constants

Hungry - Food Ordering Flutter App

Hungry is a modern, feature-rich food ordering application built with Flutter. It demonstrates a clean, scalable, and production-ready architecture, suitable for building complex mobile applications.

✨ Key Features

Splash Screen: An animated entry point that handles initial app loading.

User Authentication: Secure user registration and login functionality.

Dynamic Home Screen: Browse products by categories, search for items, and view a dynamic list of meals.

Meal Customization: A detailed view for each meal where users can select toppings, side options, and adjust the spiciness level before adding to the cart.

Shopping Cart: A fully reactive cart where users can view items, adjust quantities, and see the total price update in real-time.

Order Checkout: A streamlined process to review the order summary and place the order.

Order History: A dedicated screen for users to view their past orders.

Profile Management: Users can view and update their profile information, including their name, email, and profile picture.

🏗️ Architectural Design

The application is built following the principles of Clean Architecture with a Feature-First project structure. This approach ensures a clear separation of concerns, making the codebase modular, scalable, and easy to maintain.

1. Feature-First Structure

Each primary feature of the app (e.g., auth, home, cart, checkout) is encapsulated in its own directory under lib/features/. This makes features independent and easy to work on without affecting other parts of the app. Each feature folder contains:

data: Handles all data-related logic.

models: Defines the data structures (e.g., MealModel, UserModel).

datasource: Communicates directly with external sources (local cache or remote API).

repo: Implements the repository pattern, abstracting the data source from the business logic.

presentation: Contains the UI and state management.

controller / cubit: The state management logic using Bloc/Cubit.

views: The main screens/pages of the feature.

widgets: Reusable UI components specific to that feature.

2. State Management: Bloc/Cubit

The app uses the Bloc library for state management. This pattern provides a clear and predictable way to manage UI state by separating business logic from the UI.

Events/Methods: UI widgets send events or call methods on the Cubit to signify user actions.

Cubit: Processes the action, performs business logic (like calling a repository), and emits a new state.

State: An immutable object representing the state of the UI.

UI: The UI rebuilds reactively based on the new state received from the Cubit.

3. Dependency Injection: get_it

get_it is used as a service locator to manage dependencies throughout the app. This decouples classes from their concrete implementations, making the code more modular and easier to test. All dependencies are registered in lib/core/di/service_locator.dart.

4. Repository Pattern

This pattern is used to abstract the data layer. The presentation layer (Cubits) communicates with an abstract Repository interface, which is implemented in the data layer. This allows the data source (e.g., from a REST API to a local database) to be swapped without changing any business logic.

🛠️ Core Components & Libraries

The project leverages a modern stack of high-quality Flutter libraries:

State Management: flutter_bloc, equatable

Networking: dio for powerful HTTP requests and pretty_dio_logger for easy debugging.

Dependency Injection: get_it for service location.

Routing: Custom AppRouter using Flutter's built-in Navigator 2.0.

UI & UX:

flutter_screenutil: For building a responsive UI that adapts to different screen sizes.

google_fonts: For beautiful and consistent typography.

animate_do & skeletonizer: For creating elegant animations and loading skeletons.

fluttertoast & SnackBar: For providing user feedback.

Data Persistence & Caching:

shared_preferences & flutter_secure_storage: For caching data locally (like auth tokens).

cached_network_image: For efficiently loading and caching network images.

Environment Variables: envied to securely manage sensitive data like API base URLs.

Error Handling: dartz (Either type) for robust functional error handling in the data layer.

📁 Project Structure

The lib directory is organized as follows:

lib
├── core/               # Shared modules for the entire app
│   ├── api/            # Networking, endpoints, interceptors
│   ├── di/             # Dependency injection setup
│   ├── helpers/        # Utility classes (e.g., CacheHelper)
│   ├── navigation/     # Routing logic
│   ├── utils/          # App constants, colors, styles
│   └── widgets/        # Common reusable widgets (e.g., buttons)
│
├── features/           # Individual feature modules
│   ├── auth/           # Authentication feature
│   ├── cart/           # Shopping cart feature
│   ├── checkout/       # Checkout feature
│   ├── home/           # Home screen feature
│   ├── orders_history/ # Past orders feature
│   └── profile/        # User profile feature
│
├── env/                # Environment variable management
├── hungry_app.dart     # Root widget with Bloc providers
└── main.dart           # Application entry point


🚀 Getting Started

To get a local copy up and running, follow these simple steps.

Prerequisites:

Flutter SDK installed (version 3.x or higher).

A configured IDE (like VS Code or Android Studio).

Installation:

Clone the repo:

git clone [https://github.com/alinassef/hungry.git](https://github.com/alinassef/hungry.git)


Install packages:

flutter pub get


Generate necessary files (for envied and other code generation):

flutter pub run build_runner build --delete-conflicting-outputs


Run the app:

flutter run

# cook-snap

# explanation of the structure
- constants/: Store app-wide constants, such as API keys or theme data.
 - data/:
    - models/: Define data models for your app, such as FoodModel and UserModel.
    - repositories/: Implement repositories responsible for data retrieval and manipulation. Examples are FoodRepository and UserRepository.
      - user_repository.dart: A repository for user data.
    - services/: Include services responsible for interacting with external services, like SupabaseService.
 - ui/:
    - screens/: Organize your app screens by feature or module (e.g., home/, profile/). Each screen should have its own folder containing its respective Dart file.
    - viewmodels/: Implement view models using the MVVM pattern. Each screen or feature may have its corresponding view model (e.g., HomeViewModel, ProfileViewModel).
      - user_view_model.dart: A view model for the user profile screen.
    - widgets/: Reusable widgets that are used across multiple screens or features.
- app.dart: The main entry point of your Flutter application, where you initialize the app and set up the initial screen.
- locator.dart: Use a dependency injection package (e.g., get_it) to set up a service locator. This file helps manage the instances of your services and view models.
- main.dart: The main file that runs your Flutter app.
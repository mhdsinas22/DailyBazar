## Dependencies
- **flutter_bloc** – State management using Bloc pattern.  
- **equatable** – Simplifies value comparison in Bloc events/states.  
- **http** – For API requests.  
- **flutter_svg** – For rendering SVG icons/images.  
- **intl** – Date and time formatting.  
- **permission_handler** – For handling device permissions.  
- **flutter_test** – Unit and widget testing.  

> All dependencies are listed in `pubspec.yaml`.

---

## Implementation Steps

### 1. Project Setup
- Created new Flutter project via CLI.  
- Structured project folders for screens, models, services, state, and assets.  

### 2. Design Implementation
- Exported assets (images, icons, fonts) from Figma.  
- Implemented **Home Screen** and **Notifications Screen** UI as per design.

### 3. JSON Data Fetching
- Created `ApiService` class to handle HTTP requests.  
- Fetched JSON data from the provided API endpoint.

### 4. JSON Parsing
- Created `JsonParser` class to parse JSON response.  
- Optionally used **isolates** to improve performance for large JSON responses.

### 5. Home Screen
- Displayed parsed data dynamically.  
- Added UI elements according to Figma design.

### 6. Notifications Screen
- Implemented a screen that displays notifications fetched from API.  
- Added a button on Home Screen to navigate to Notifications Screen.

### 7. Routing
- Implemented named routes for navigation between screens.  
- Passed data between screens using route arguments or state management.

### 8. Optional: Isolate Usage
- Used **isolates** for JSON parsing to prevent UI blocking.  
- Improved performance when dealing with large JSON datasets.

### 9. Optional: Testing
- Wrote unit tests for API service, JSON parsing, and widget tests.  
- Used **flutter_test** package.

---
## Project Structure

lib/
├── main.dart # App entry point
├── screens/
│ ├── home_screen.dart
│ └── notifications_screen.dart
├── models/
│ └── notification_model.dart
├── services/
│ └── api_service.dart # Handles API requests
├── utils/
│ └── json_parser.dart # Handles JSON parsing (optional isolates)
└── state/
└── app_provider.dart # State management (Provider / Bloc)
assets/
├── images/
├── icons/
└── fonts/
test/
├── api_service_test.dart
└── widget_test.dart
## Running the Project

1. **Clone the repository**:
   ```bash
   git clone <your-repo-url>
   cd bording_week1

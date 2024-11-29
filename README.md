
# Project Title
Scorers

## Project Overview
This project is a Flutter application designed for a technical assessment. The primary objective is to develop a detailed "Match Details" screen that replicates a given Figma design, showcasing various UI components and functionality for an engaging user experience.

## Objective
TThe objective of this assessment is to evaluate my ability to implement a complex UI, handle state management, and integrate dynamic data within a Flutter app. The focus is on the following components:

Header section with match details
Momentum graph for match performance
Penalty shootout outcomes
Match incidents list with timestamps and event icons

## Development Approach
UI Components Implemented
Header Section: Displays the match score, team names, team logos, and basic match details (e.g., status of the match: full-time, ongoing).
Momentum Graph: A visual representation of match momentum, implemented with mock data to demonstrate dynamic rendering.
Penalty Shootout Section: Shows outcomes of penalty shootouts, indicating scored or missed penalties.
Match Incidents: A scrollable list of match events (e.g., goals, yellow cards, substitutions) with timestamps, player names, and event icons.

## State Management
The project utilizes Bloc state management to handle data updates and interactivity, ensuring that UI elements reflect changes in real-time.

## Data Integration
Mock JSON data is used to populate all UI components, ensuring realistic data rendering without relying on backend integration during the assessment phase. The only exception is the match incidents section, which leverages a different approach to display event data dynamically and accurately within the UI.

## Design Fidelity
The UI layout matches the provided Figma design in terms of:

Typography
Spacing
Colors
Alignment

## Installation Instructions
To run this project locally, follow these steps:

Clone the repository: git clone https://github.com/OjoLego/Scorers.git
Navigate to the project directory: cd scorers
Install dependencies: flutter pub get
Run the application: flutter run

## Dependencies
The project uses the following dependencies:

Flutter SDK: Ensure you have Flutter 3.24.4 or compatible version installed.
Bloc: State management library for handling UI state.
Json serializable and Build runner

## Assumptions and Limitations
Mock Data: The app uses mock data for demonstration purposes. Integrating real backend data is not part of this assessment but can be done for further functionality.
Dynamic Navigation: Navigation functionality from a Matches Overview page to the Match Details page is integrated to provide context.

## Screenshots

Below are some screenshots of the Match Details screen:

![FBE19359-1081-4100-A10B-509E03642A0B_4_5005_c](https://github.com/user-attachments/assets/b25fc4c9-1100-41e3-a284-5c85a8b9bb9b)

![BE1518BA-9091-4946-9DF8-EF301E83D40A_4_5005_c](https://github.com/user-attachments/assets/59c430a7-70d1-43b5-b57e-931cd3d5b4ae)

![7E220081-F614-4D4C-8ECC-3080D4A38EC9_4_5005_c](https://github.com/user-attachments/assets/0d2a025d-c2f4-4fd4-ae38-7bd1140d7928)

## Future Enhancements
Integrate real-time data fetching using a backend API.
Implement user authentication and profile management.
Enhance responsiveness and optimization for various device sizes.

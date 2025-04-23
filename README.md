# StudyBuddy

## Table of Contents  
- [Overview](#overview)  
- [Product Spec](#product-spec)  
- [Wireframes](#wireframes)  
- [Schema](#schema)

---

## Overview

### Description  
StudyBuddy is a productivity app that helps students stay on track with their academic goals. It allows users to add and view study sessions, track to-dos, and build study streaks to stay motivated. The app also features motivational quotes from an external API to encourage users.

### App Evaluation  

**Category:** Productivity / Education  
**Mobile:** Built for iPhone using UIKit and Storyboards  
**Story:** Helps students plan, track, and stay consistent with studying  
**Market:** Aimed at high school and college students  
**Habit:** Encourages daily use through study streaks and motivational quotes  
**Scope:** Core features are simple but expandable for future updates

---

## Product Spec

### 1. User Stories  

**Required Must-have Stories**  
- User can view current quote on the home screen  
- User can add a study session and see it in a list  
- User can view tasks in a to-do list format  
- User can track their streak of study days  
- Study sessions persist across app restarts (UserDefaults)  
- Tabs navigate between Home, Tasks, Add, and Streak views

**Optional Nice-to-have Stories**  
- Custom animations or color themes  
- Detailed session stats  
- Sort/filter options in task or session list  
- Backend integration for syncing sessions

---

### 2. Screen Archetypes  

- **Home Screen**  
  - Displays a motivational quote from an API  
- **Tasks Screen**  
  - Shows a list of to-dos  
- **Add Session Screen**  
  - Form to input and save new study sessions  
- **Streak Screen**  
  - Shows how many days in a row the user has studied

---

### 3. Navigation  

**Tab Navigation (Tab to Screen)**  
- Home → HomeViewController (Quote display)  
- Tasks → TasksViewController (To-do list)  
- Add → AddSessionViewController (Add form)  
- Streak → StreakViewController (Streak tracking)

**Flow Navigation (Screen to Screen)**  
- AddSessionViewController → SessionDetailViewController (view/edit session)

---

## Wireframes  




---

## [BONUS] Digital Wireframes & Mockups  
*(Optional: Insert Figma or other mockup links/images here)*

---

## [BONUS] Interactive Prototype  
*(Optional: Add prototype link if created)*

---

## Schema  
*Will be completed later in Unit 9.*

### Models  
**StudySession**  
| Property     | Type   | Description                   |  
|--------------|--------|-------------------------------|  
| title        | String | Name of the session           |  
| date         | Date   | When the session happened     |  

**Task**  
| Property     | Type   | Description                   |  
|--------------|--------|-------------------------------|  
| title        | String | To-do item                    |  
| isComplete   | Bool   | Whether it’s marked as done   |

---

### Networking  
**Home Screen (Quotes API)**  
- **GET** fetch motivational quote  
  - Endpoint: `https://api.api-ninjas.com/v1/quotes`  
  - Parses JSON into `Quote` struct  
  - Displays quote on Home screen  

Example request:
```swift
URLSession.shared.dataTask(with: url) { data, _, _ in ... }
```

--- 

Let me know if you want a `.md` file version too.

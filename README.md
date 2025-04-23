# StudyBuddy

## Table of Contents  
- [Overview](#overview)  
- [Product Spec](#product-spec)  
- [Wireframes](#wireframes)  
- [Schema](#schema)

---

## Overview

### Videos: 
<div>
    <a href="https://www.loom.com/share/a5bbdd7883ed4920af38bee3d375de02">
    </a>
    <a href="https://www.loom.com/share/a5bbdd7883ed4920af38bee3d375de02">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/a5bbdd7883ed4920af38bee3d375de02-7ac6e2c31580743a-full-play.gif">
    </a>
  </div>
  <div>
    <a href="https://www.loom.com/share/568111b4353d46b88f19c690a7f6d857">
    </a>
    <a href="https://www.loom.com/share/568111b4353d46b88f19c690a7f6d857">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/568111b4353d46b88f19c690a7f6d857-2adfa7361d9dc1d7-full-play.gif">
    </a>
  </div>

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

---

## Wireframes  

![image](https://github.com/user-attachments/assets/e896ca38-e5f9-42f1-95a4-69f2a3eb5955)



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

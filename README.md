# 📱 Mobile App – Job Board Assignment

This is the **mobile application** for the Job Board project, developed using **Flutter** with full integration of **Firebase** services. It provides a comprehensive experience for both **Job Seekers** and **Admins**.

---

## 🔧 Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/job-board-assignment.git
   cd job-board-assignment/mobile
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

---

## 🧰 Technologies Used

- **Flutter** – cross-platform mobile development
- **Firebase** – authentication, Firestore database, and more
- **Cubit** – lightweight state management from the Bloc library

---

## 🧪 Validation & Error Handling

- The app includes **comprehensive error handling** for all critical flows, including:
  - Authentication errors (wrong password, user not found, etc.)
  - Network failures
  - Firebase-related exceptions
  - Application logic edge cases
- Form inputs are validated thoroughly with:
  - Required field checks
  - Email format validation 
  - Resume and cover letter content checks

Users are notified gracefully via UI feedback for all validation and error cases, ensuring a robust and user-friendly experience.

---

## 👥 User Roles and Features

### **Job Seeker**

- Register and log in
- View a list of available jobs
- View detailed information for each job
- Submit job applications (resume text and cover letter)
- Track previously submitted applications

### **Admin**

- Register and log in securely
- View list of all job postings
- Create, edit, and delete job posts
- View registered job seekers
- View submitted applications per job

---

## 🛠️ Assumptions

- All data is stored and synced in Firebase Firestore
- Users must use valid email/password credentials for login
- Job posts and applications are real-time synced

---

## ⚠️ Known Limitations / Areas for Improvement

- No push notification integration yet
- Resume uploads are plain text (no PDF or file uploads)
- UI is functional but could benefit from design enhancements


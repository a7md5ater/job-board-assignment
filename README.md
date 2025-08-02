# 📱 Mobile App – Job Board Assignment

This is the **mobile application** for the Job Board project, developed using **Flutter** with full integration of **Firebase** services. It provides a comprehensive experience for both **Job Seekers** and **Admins**.

---

## 🔧 Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/a7md5ater/job-board-assignment.git
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
- App Size is larger than the regular because of Firebase

## 📱 Screenshots
<img width="620" height="1280" alt="Screenshot_20250802-130651" src="https://github.com/user-attachments/assets/7c98422c-ad2e-484d-867f-29860b785575" />
<img width="620" height="1280" alt="Screenshot_20250802-131006" src="https://github.com/user-attachments/assets/ca2557d2-cf61-44c8-a20f-e9a8bd932ba9" />
<img width="620" height="1280" alt="Screenshot_20250802-130959" src="https://github.com/user-attachments/assets/388ff88b-efaa-4fc0-a012-149874cad691" />
<img width="620" height="1280" alt="Screenshot_20250802-130953" src="https://github.com/user-attachments/assets/90ba31fb-ff83-4829-b1a8-4db98d0e4f74" />
<img width="620" height="1280" alt="Screenshot_20250802-130941" src="https://github.com/user-attachments/assets/2b7bd5e5-1899-465c-b14c-a2a917bd1388" />
<img width="620" height="1280" alt="Screenshot_20250802-130814" src="https://github.com/user-attachments/assets/24f51e0b-6952-4695-9f51-643776470a52" />
<img width="620" height="1280" alt="Screenshot_20250802-130802" src="https://github.com/user-attachments/assets/6ec9c626-c32a-47e7-824b-6327633d2dc8" />
<img width="620" height="1280" alt="Screenshot_20250802-130758" src="https://github.com/user-attachments/assets/5daf2c4f-12e7-4f46-842b-25640b6af2a8" />
<img width="620" height="1280" alt="Screenshot_20250802-130750" src="https://github.com/user-attachments/assets/35046ccf-cb6a-46a5-9a7e-6850a8615654" />
<img width="620" height="1280" alt="Screenshot_20250802-130707" src="https://github.com/user-attachments/assets/d9f964a1-a242-40ec-b6a3-ba0cbe0cda9c" />

## 🔗 App Link
https://drive.google.com/file/d/1Any7ikw-_BBKZgb1AIQ1wiChpIl3YnkW/view?usp=sharing

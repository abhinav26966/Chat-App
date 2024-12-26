# 💬 MernChat - Real-Time Chat Application

A full-stack real-time chat application built with the MERN stack and WebSocket technology for seamless communication.

---

## ✨ Features

- **💬 Real-time Communication** - Instant message delivery with WebSocket.
- **🔒 User Authentication** - Secure login and registration system.
- **📂 File Sharing** - Easily send and receive files.
- **🟢 Online Status** - Real-time user online/offline tracking.
- **🗂️ Persistent Storage** - Message history stored in MongoDB.
- **💻 Modern UI** - Sleek, responsive interface powered by Tailwind CSS.
- **🔐 Secure** - JWT-based authentication and encrypted passwords.

---

## 🛠️ Technologies Used

### Frontend
- **React.js**
- **Tailwind CSS**
- **Axios**
- **WebSocket Client**
- **Context API** for state management

### Backend
- **Node.js**
- **Express.js**
- **MongoDB**
- **WebSocket (ws)**
- **JWT** for authentication
- **bcrypt** for password hashing

---

## 🚀 Getting Started

### Prerequisites
- [Node.js](https://nodejs.org/)
- [MongoDB](https://www.mongodb.com/)
- npm or yarn

### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/abhinav26966/Chat-App.git
   ```

2. **Install Backend Dependencies**
   ```bash
   cd api
   npm install
   ```

3. **Install Frontend Dependencies**
   ```bash
   cd client
   npm install
   ```

4. **Set Up Environment Variables**
   Create a `.env` file in the `api` directory with the following variables:
   ```env
   MONGO_URL=your_mongodb_connection_string
   JWT_SECRET=your_jwt_secret
   CLIENT_URL=http://localhost:5173
   ```

5. **Start the Backend Server**
   ```bash
   cd api
   npm start
   ```

6. **Start the Frontend Server**
   ```bash
   cd client
   npm run dev
   ```

---

## 🌟 Features in Detail

### **Authentication System**
- User registration with encrypted passwords.
- JWT-based login system.
- Persistent sessions.

### **Real-time Chat Features**
- One-on-one messaging.
- File attachment support.
- Message history.
- Online/Offline status indicators.
- Auto-scroll to the latest messages.
- Unread message indicators.

### **User Interface**
- Clean and intuitive design.
- Responsive layout for all devices.
- User avatars with unique colors.
- Message time stamps.
- Loading states and error handling.

---

## 🔒 Security Features

- Password encryption using bcrypt.
- JWT token-based authentication.
- Secure WebSocket connections.
- Protected API endpoints.
- HTTP-only cookies.

---
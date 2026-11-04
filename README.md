# Apex-Media-Platform

A full-stack web application designed for seamless media management, user authorization, and scheduling operations.

## 🚀 Tech Stack

- **Backend:** Node.js, Express.js
- **Database:** PostgreSQL
- **Frontend:** HTML5, CSS3, Vanilla JavaScript
- **Containerization:** Docker

## 📁 Repository Structure

```text
Apex-Media-Platform/
├── public/              # Frontend client files
│   ├── index.html       # Primary application layout
│   ├── styles.css       # Core design system
│   ├── app.js           # Client-side user logic
│   └── admin.js         # Client-side admin console
├── server/              # Backend server logic
│   ├── controllers/     # Route logic handlers
│   ├── routes/          # API route definitions
│   ├── db.js            # PostgreSQL connection pool
│   └── index.js         # Express app entry point
├── Dockerfile           # Deployment container config
├── package.json         # Node dependencies & scripts
└── schema.sql           # Database table definitions

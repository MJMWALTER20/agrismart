# AgriSmart

[![Status](https://img.shields.io/badge/status-development-orange)]()
[![License](https://img.shields.io/badge/license-MIT-blue)]()

## 🎯 Présentation

**AgriSmart** est une plateforme d’agriculture intelligente conçue pour aider les producteurs togolais à :

- Améliorer leurs rendements
- Bénéficier de conseils personnalisés
- Recevoir des alertes météo locales
- Organiser leurs activités agricoles
- Acheter / vendre intrants et récoltes
- Échanger directement avec agents et acheteurs

Le système complet inclut :
- **Application mobile (Flutter)**
- **Backend API (Spring Boot)**
- **Panel Admin (Next.js / React)**
- **Infrastructure Docker**

---

# 🚀 Fonctionnalités (MVP)

### 👤 Producteur
- Inscription par **numéro de téléphone + OTP**
- Profil complet : localisation, cultures, surfaces
- Dashboard météo + tâches du jour
- Calendrier agricole intelligent
- Conseils agricoles selon culture / stade
- Notifications push (FCM)
- Marketplace : publier / acheter des intrants
- Messagerie avec agents

### 🛠️ Admin
- Gestion des utilisateurs
- Gestion des cultures / conseils
- Modération des annonces
- Envoi de notifications push

---

# 🧱 Architecture générale

Mobile (Flutter) <------> Backend API (Spring Boot)
|--- PostgreSQL
|--- Redis
|--- Firebase (OTP + FCM)
|--- Weather API
|--- Mobile Money API
Admin Panel (Next.js) <---|


---

# 🛠️ Stack Technique

### Frontend Mobile
- Flutter (Dart)
- Provider / Riverpod
- Firebase Messaging

### Backend
- Spring Boot 3 (Java 17+)
- PostgreSQL + PostGIS (optionnel)
- Redis
- Flyway (migrations)
- JWT Auth
- Firebase Admin SDK

### Admin
- Next.js 14
- Tailwind CSS
- Axios

### Infra
- Docker & Docker Compose
- NGINX
- CI/CD GitHub Actions

---

# 📦 Structure du dépôt

agrismart/
backend/ # API
mobile_app/ # App Flutter
admin/ # Panel Admin
infra/ # Docker, Nginx, CI
docs/ # SQL, diagrammes, docs techniques
README.md
LICENSE
.gitignore


---

# 🧪 Installation locale

## 1️⃣ Cloner le projet
```bash
git clone https://github.com/MJMWALTER20/agrismart.git
cd agrismart

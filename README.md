# Portfolio DevOps — Marega Djibril

Bienvenue sur le repository de mon **Portfolio DevOps**.  
Ce projet présente mon parcours, mes compétences et mes projets techniques en Administration Système, DevOps et Cloud.  
Le site a été conçu pour être **simple, rapide et facilement déployable**, tout en illustrant mes compétences en conteneurisation, CI/CD, infrastructure-as-code et bonnes pratiques DevOps.

---

## 🚀 Fonctionnalités

- Page HTML/Tailwind entièrement responsive  
- Présentation de mes projets DevOps, ML et scraping  
- Études de cas intégrées sous forme de PDF  
- Structure pensée pour le déploiement automatisé  
- Conteneurisation complète (Docker + Nginx)  
- Déploiement Cloud (Terraform + Ansible + AWS)

---

## 🛠️ Stack Technique

### **Frontend**
- HTML5 / CSS3
- TailwindCSS
- JavaScript minimal (modales + interactions)

### **DevOps / Infrastructure**
- Docker, Docker Compose  
- Nginx (serveur web)  
- Terraform (AWS)  
- Ansible (provisioning + déploiement)  
- CI/CD via GitHub Actions  
- Github Registery (registry Docker privé)

---

## 📦 Conteneurisation

Le projet inclut :
- un **Dockerfile** servant le portfolio avec **Nginx**
- un **docker-compose.yml** minimal pour exécuter le service web (facile à étendre si plusieurs services sont ajoutés)

Build local :

```bash
# Avec Docker seul
docker build -t portfolio-devops .
docker run -p 80:80 portfolio-devops

# Avec Docker Compose
docker-compose up --build

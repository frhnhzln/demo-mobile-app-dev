# HOWTO

1. Document your codes as detail as possible.
2. Clone this repository.
3. Override this README & provide instructions on how to compile and run your code in simulator mode within Android Studio or Xcode.
4. Commit your codes & create a pull request.

---

# Cinema Booking Mobile App

## Developer Info
- **Name:** Farhan Hazlan  
- **Role:** Full Stack Developer  
- **Frontend:** Vue.js  
- **Backend:** Laravel (REST API)

---

## Project Structure

```
demo-mobile-app-dev/
├── frontend/ # Vue 3 app (Vite) - movie booking UI
└── backend/  # Laravel API - movies, ratings, bookings
```

## Frontend(Vue.js)
cd frontend
npm install
npm run dev
# Runs on: http://127.0.0.1:8000

## Backend(Laravel)
cd backend
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
php artisan serve --port=8001
# Runs on: http://127.0.0.1:8001

API Guideline (Add Review):  
To submit a movie review using the API, make a POST request to the following endpoint:  
http://127.0.0.1:8001/api/movies/1/reviews  
Use `raw` as the body type and choose `JSON` format.  

Example request body:  
{  
  "user": "Farhan",  
  "stars": 4,  
  "comment": "Great experience and visuals!"  
}  


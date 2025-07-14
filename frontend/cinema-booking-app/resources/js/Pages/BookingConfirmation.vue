<template>
  <div class="bg-dark text-light min-vh-100 p-4">
    <h2 class="text-center mb-4">Booking Confirmation</h2>

    <div class="bg-secondary rounded p-4 mx-auto" style="max-width: 500px;">
      <p><strong>Movie ID:</strong> {{ movieId }}</p>
      <p><strong>Location:</strong> {{ location }}</p>
      <p><strong>Hall:</strong> {{ hall }}</p>
      <p><strong>Date:</strong> {{ date }}</p>
      <p><strong>Time:</strong> {{ time }}</p>
      <p><strong>Seats:</strong> {{ formattedSeats }}</p>
    </div>
  </div>
</template>

<script setup>
import { useRoute } from 'vue-router'

const route = useRoute()

const movieId = route.query.movieId || route.query.id || '-'
const location = route.query.location || '-'
const hall = route.query.hall || '-'
const date = route.query.date || '-'
const time = route.query.time || '-'

let parsedSeats = []

try {
  const raw = route.query.seats || '[]'
  const temp = typeof raw === 'string' ? JSON.parse(raw) : raw
  parsedSeats = Array.isArray(temp) ? temp : []
} catch {
  parsedSeats = []
}

const formattedSeats = parsedSeats.join(', ')
</script>


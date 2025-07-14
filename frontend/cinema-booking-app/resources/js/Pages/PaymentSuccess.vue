<template>
  <div class="bg-dark text-white min-vh-100 d-flex flex-column justify-content-center align-items-center p-4">
    <div class="d-flex justify-content-center mb-3">
      <div class="rounded-circle bg-secondary d-flex align-items-center justify-content-center" style="width: 180px; height: 180px;">
        <i class="bi bi-check-lg text-white" style="font-size: 10.5rem;"></i>
      </div>
    </div>

    <h2 class="mb-3">Congratulations!</h2>
    <p class="text-center">Your ticket purchase is successful, a confirmation has been sent to your e-mail</p>

    <div class="d-flex justify-content-center gap-3 mt-4">
      <router-link to="/" class="btn text-white bg-transparent border border-white">
        <i class="bi bi-arrow-left me-2"></i>Main Menu
      </router-link>

      <router-link
        :to="{
          name: 'booking-confirmation',
          query: {
            movieId: route.query.movieId,
            location: route.query.location,
            hall: route.query.hall,
            date: route.query.date,
            time: route.query.time,
            seats: seatsParam
          }
        }"
        class="btn text-white bg-transparent border border-white"
      >
        <i class="bi bi-ticket me-2"></i>View Ticket
      </router-link>
    </div>
  </div>

  <!-- ===================== DEBUG START ===================== -->
  <div class="bg-light text-dark p-3 mt-5 rounded" style="white-space: pre-wrap; font-size: 0.85rem;">
    <strong>Debug Output</strong>
    <hr />
    <pre>{{ JSON.stringify(debug, null, 2) }}</pre>
  </div>
  <!-- ===================== DEBUG END ===================== -->
</template>

<script setup>
import { useRoute } from 'vue-router'
import { ref } from 'vue'

const route = useRoute()

const debug = ref({
  fromRoute: route.query,
  seatsParsed: []
})

let seatsParam = '[]'
try {
  const rawSeats = route.query.seats
  const parsed = typeof rawSeats === 'string' ? JSON.parse(rawSeats) : rawSeats
  debug.value.seatsParsed = parsed
  seatsParam = JSON.stringify(parsed)
} catch (err) {
  console.error('Error parsing seats:', err)
  debug.value.seatsParsed = []
}
</script>

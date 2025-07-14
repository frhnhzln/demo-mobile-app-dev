<template>
  <div class="bg-dark text-light min-vh-100 p-4">
    <div class="position-relative text-center mb-4">
      <button class="btn btn-link text-white position-absolute start-0 top-0" @click="goBack">
        <i class="bi bi-arrow-left fs-4"></i>
      </button>
      <h2 class="m-0">Card Payment</h2>
    </div>

    <div class="bg-secondary rounded p-4 mx-auto" style="max-width: 400px;">
      <form @submit.prevent="submitPayment">
        <div class="mb-3">
          <label class="form-label text-white">Card Number</label>
          <input
            type="text"
            class="form-control"
            v-model="card.number"
            maxlength="19"
            placeholder="Enter card number"
            required
          />
        </div>

        <div class="d-flex gap-3 mb-3">
          <div class="flex-fill">
            <label class="form-label text-white">Expiry date</label>
            <input
              type="text"
              class="form-control"
              v-model="card.expiry"
              placeholder="MM/YY"
              maxlength="5"
              required
            />
          </div>
          <div class="flex-fill">
            <label class="form-label text-white">CVV2</label>
            <input
              type="password"
              class="form-control"
              v-model="card.cvv"
              placeholder="Enter CVV"
              maxlength="4"
              required
            />
          </div>
        </div>

        <button type="submit" class="btn w-100 fw-bold text-white border-0" style="background-color: gray;">
          Pay Now - RM {{ bookingData.total.toFixed(2) }}
        </button>
      </form>
    </div>
  </div>

  <!-- ===================== DEBUG START ===================== -->
  <!-- <div class="bg-light text-dark p-3 mt-5 rounded" style="white-space: pre-wrap; font-size: 0.85rem;">
    <strong>Debug Output</strong>
    <hr />
    <pre>{{ JSON.stringify(debug, null, 2) }}</pre>
  </div> -->
  <!-- ===================== DEBUG END ===================== -->
</template>

<script setup>
import { useRouter, useRoute } from 'vue-router'
import { ref, onMounted } from 'vue'

const router = useRouter()
const route = useRoute()

const card = ref({
  number: '',
  expiry: '',
  cvv: ''
})

const bookingData = ref({
  method: '',
  movieId: '',
  location: '',
  hall: '',
  date: '',
  time: '',
  seats: [],
  food: [],
  total: 0
})

// Debugging
const debug = ref({
  movieId: route.query.movieId,
  location: route.query.location,
  hall: route.query.hall,
  date: route.query.date,
  time: route.query.time,
  total: route.query.total,
  seatsRaw: route.query.seats,
  foodRaw: route.query.food,
  seatsParsed: [],
  foodParsed: [],
  bookingData: {}
})

onMounted(() => {
  bookingData.value.method = route.query.method || ''
  bookingData.value.movieId = parseInt(route.query.movieId) || null
  bookingData.value.location = route.query.location || ''
  bookingData.value.hall = route.query.hall || ''
  bookingData.value.date = route.query.date || ''
  bookingData.value.time = route.query.time || ''
  bookingData.value.total = parseFloat(route.query.total) || 0

  try {
    const rawSeats = route.query.seats || '[]'
    const parsedSeats = JSON.parse(rawSeats)
    bookingData.value.seats = Array.isArray(parsedSeats) ? parsedSeats : rawSeats.split(',')
    debug.value.seatsParsed = bookingData.value.seats
  } catch {
    bookingData.value.seats = (route.query.seats || '').split(',')
    debug.value.seatsParsed = bookingData.value.seats
  }

  try {
    bookingData.value.food = JSON.parse(route.query.food || '[]')
    debug.value.foodParsed = bookingData.value.food
  } catch {
    bookingData.value.food = []
    debug.value.foodParsed = []
  }

  debug.value.bookingData = bookingData.value
})

const goBack = () => router.back()

const submitPayment = async () => {
  try {
    const response = await fetch('http://127.0.0.1:8001/api/submit-payment', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        card_number: card.value.number,
        expiry_date: card.value.expiry,
        cvv: card.value.cvv,
        amount: bookingData.value.total,
        movie_id: bookingData.value.movieId,
        location: bookingData.value.location,
        hall: bookingData.value.hall,
        date: bookingData.value.date,
        time: bookingData.value.time,
        seats: bookingData.value.seats
      })
    })

    if (!response.ok) throw new Error('Payment submission failed')

    alert('Payment submitted successfully!')

    router.push({
      name: 'paymentsuccess',
      query: {
        movieId: bookingData.value.movieId,
        location: bookingData.value.location,
        hall: bookingData.value.hall,
        date: bookingData.value.date,
        time: bookingData.value.time,
        seats: JSON.stringify(bookingData.value.seats)
      }
    })

  } catch (error) {
    console.error('Payment submission failed:', error)
  }
}
</script>

<style scoped>
input::placeholder {
  color: #aaa;
}
</style>

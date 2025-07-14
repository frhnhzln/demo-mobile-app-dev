<template>
  <div class="bg-dark text-light min-vh-100 p-4">
    <div class="position-relative text-center mb-4">
      <button class="btn btn-link text-white position-absolute start-0 top-0" @click="goBack">
        <i class="bi bi-arrow-left fs-4"></i>
      </button>
      <h2 class="m-0">Booking Summary</h2>
    </div>

    <div class="d-flex flex-column align-items-center gap-3">
      <div v-if="movie" class="bg-secondary text-white rounded p-3 w-100" style="max-width: 400px;">
        <div class="d-flex align-items-stretch gap-3 mb-2">
          <div style="width: 60px; background-color: #fff; border-radius: 4px;"></div>
          <div class="d-flex flex-column justify-content-center">
            <h5 class="mb-1">{{ movie.title }}</h5>
            <p class="mb-1">{{ movie.genres.join(', ') }}</p>
            <p class="mb-1">{{ movie.duration }}</p>
            <p class="mb-1">English, IMDb 3D</p>
            <p class="mb-0">Classic Tickets</p>
          </div>
        </div>
        <hr class="my-2" style="border-top: 1px dashed #ccc;" />

        <div><strong>Cinema:</strong> {{ location }} (Hall {{ hall }})</div>
        <div class="d-flex justify-content-between mt-2">
          <p><strong>Date:</strong><br />{{ date }}</p>
          <p><strong>Seats:</strong><br />{{ seats.join(', ') }}</p>
          <p><strong>Start:</strong><br />{{ time }}</p>
          <p><strong>End:</strong><br />{{ endTime }}</p>
        </div>
      </div>

      <div class="bg-secondary text-white rounded p-3 w-100" style="max-width: 400px;">
        <div>
          <p class="mb-2"><strong>Tickets</strong></p>
          <div class="d-flex justify-content-between small mb-2">
            <span>{{ ticketCount }} x Classic</span>
            <span>RM {{ ticketTotal.toFixed(2) }}</span>
          </div>

          <p class="mb-2"><strong>Food & Beverage</strong></p>
          <div v-if="foodOrder.length > 0">
            <div v-for="item in foodOrder" :key="item.name" class="d-flex justify-content-between small">
              <span>{{ item.name }} x{{ item.quantity }}</span>
              <span>RM {{ (item.price * item.quantity).toFixed(2) }}</span>
            </div>
          </div>
          <div v-else class="small text-muted">No food selected</div>

          <hr class="my-3" style="border-top: 1px solid #fff;" />
          <div class="d-flex justify-content-between align-items-center">
            <h5 class="mb-0">Total Payable</h5>
            <h5 class="mb-0">RM {{ totalAmount.toFixed(2) }}</h5>
          </div>
        </div>
      </div>

      <div class="d-flex justify-content-center mt-4">
        <button class="btn fw-bold text-white w-100" style="max-width: 400px; background-color: gray;" @click="goToPayment">
          Proceed to Payment
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter, useRoute } from 'vue-router'
import { ref, onMounted, computed } from 'vue'

const router = useRouter()
const route = useRoute()

const movie = ref(null)
const foodOrder = ref([])
const seats = ref([])

const location = ref(route.query.location || '')
const hall = ref(route.query.hall || '')
const date = ref(route.query.date || '')
const time = ref(route.query.time || '')
const ticketPrice = 20

const goBack = () => router.back()

if (route.query.seats) {
  try {
    seats.value = JSON.parse(decodeURIComponent(route.query.seats))
  } catch {
    seats.value = decodeURIComponent(route.query.seats).split(',')
  }
}

const ticketCount = computed(() => seats.value.length)
const ticketTotal = computed(() => ticketCount.value * ticketPrice)

const endTime = computed(() => {
  const [h, m] = time.value.split(':').map(Number)
  const endH = (h + 2) % 24
  return `${endH.toString().padStart(2, '0')}:${m.toString().padStart(2, '0')}`
})

onMounted(async () => {
  const response = await fetch('/mock/movies.json')
  const data = await response.json()

  const movieId = route.query.movieId
  movie.value = data.movies.find(m => m.id === movieId) || data.movies[0]

  try {
    const foodQuery = route.query.food
    if (foodQuery) {
      foodOrder.value = JSON.parse(decodeURIComponent(foodQuery))
    }
  } catch (err) {
    console.error('Failed to parse food order:', err)
  }
})

const totalAmount = computed(() =>
  ticketTotal.value + foodOrder.value.reduce((sum, item) => sum + item.price * item.quantity, 0)
)

const goToPayment = () => {
  router.push({
    name: 'payment',
    query: {
      total: totalAmount.value.toFixed(2),
      movieId: route.query.movieId,
      location: location.value,
      date: date.value,
      time: time.value,
      hall: hall.value,
      seats: JSON.stringify(seats.value),
      food: JSON.stringify(foodOrder.value),
    }
  })
}
</script>

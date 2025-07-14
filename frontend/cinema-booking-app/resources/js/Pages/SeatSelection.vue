<template>
  <div class="bg-dark text-light min-vh-100 p-3">
    <div class="p-3 text-center mb-5">
      <div class="d-flex align-items-center justify-content-center position-relative mb-2">
        <button class="btn btn-link position-absolute start-0 text-white text-decoration-none" @click="goBack">
          <i class="bi bi-arrow-left fs-5"></i>
        </button>
        <p class="mb-0 fw-bold">Select Seat</p>
      </div>

      <div class="d-flex align-items-center justify-content-center gap-4 flex-wrap">
        <div class="d-flex align-items-center gap-2">
          <div style="width: 20px; height: 20px; background-color: #343a40; border: 1px solid #ccc;"></div>
          <small class="text-white">Available</small>
        </div>
        <div class="d-flex align-items-center gap-2">
          <div class="d-flex justify-content-center align-items-center text-white fw-bold"
               style="width: 20px; height: 20px; background-color: gray; border: 1px solid #ccc;">X</div>
          <small class="text-white">Unavailable</small>
        </div>
        <div class="d-flex align-items-center gap-2">
          <div style="width: 20px; height: 20px; background-color: #adb5bd; border: 1px solid #ccc;"></div>
          <small class="text-white">Selected</small>
        </div>
      </div>
    </div>

    <div class="p-3 text-center mb-2">
      <svg style="display: block; margin: 0 auto;" width="600" height="150" viewBox="0 0 600 150" xmlns="http://www.w3.org/2000/svg">
        <path d="M30 140 Q300 20 570 140 Z" fill="#222" stroke="#444" stroke-width="4" filter="url(#shadow)" />
        <defs>
          <filter id="shadow" x="-20%" y="-20%" width="140%" height="140%">
            <feDropShadow dx="0" dy="8" stdDeviation="8" flood-color="#000" flood-opacity="0.7" />
          </filter>
        </defs>
      </svg>
    </div>
    <div class="p-3 text-center mb-5 text">
      <p>Screen</p>
    </div>

    <div class="d-flex flex-column align-items-center gap-2 mb-5">
      <div v-for="row in rows" :key="row" class="d-flex gap-2 align-items-center">
        <div class="text-white fw-bold" style="width: 20px;">{{ row }}</div>

        <div
          v-for="col in cols"
          :key="`${row}${col}`"
          @click="!shouldHideSeat(row, col) && !bookedSeats.includes(`${row}${col}`) && toggleSeat(`${row}${col}`)"
          :style="{
            width: '20px',
            height: '20px',
            backgroundColor: shouldHideSeat(row, col)
              ? 'transparent'
              : getSeatColor(`${row}${col}`),
            border: shouldHideSeat(row, col) ? 'none' : '1px solid #ccc',
            cursor: shouldHideSeat(row, col) || bookedSeats.includes(`${row}${col}`) ? 'default' : 'pointer',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            fontWeight: 'bold',
            fontSize: '0.75rem',
            color: bookedSeats.includes(`${row}${col}`) ? 'white' : 'transparent'
          }"
        >
          {{ bookedSeats.includes(`${row}${col}`) ? 'X' : '' }}
        </div>

        <div class="text-white fw-bold" style="width: 20px;">{{ row }}</div>
      </div>
    </div>

    <div class="p-3 text-center mb-5">
      <div class="d-flex justify-content-center">
        <div class="d-flex bg-secondary text-white rounded p-3 gap-5">
          <div class="text-center">
            <p class="mb-1 fw-bold">SEAT</p>
            <p class="mb-0" style="font-size: 1.25rem;">{{ selectedSeats.join(', ') || '-' }}</p>
          </div>

          <div class="border-start" style="height: 100%; width: 1px; background-color: #fff;"></div>

          <div class="text-center">
            <p class="mb-1 fw-bold">SUB-TOTAL</p>
            <p class="mb-0" style="font-size: 1.25rem;">RM {{ totalAmount }}</p>
          </div>
        </div>
      </div>
    </div>

    <div class="fixed-bottom p-3 bg-dark">
      <div class="d-flex gap-3">
        <button class="btn text-dark fw-bold flex-fill" style="background-color: white;" @click="goBack">Cancel</button>
        <button class="btn text-white fw-bold flex-fill" style="background-color: gray;" @click="goToFood">Proceed</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import axios from 'axios'

const route = useRoute()
const router = useRouter()

const movieId = ref('')
const location = ref('')
const hall = ref('')
const date = ref('')
const time = ref('')

const bookedSeats = ref([])

const rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
const cols = [1, 2, 3, 4, 5, 6, 7, 8, 9]
const selectedSeats = ref([])

onMounted(async () => {
  movieId.value = route.query.movieId || ''
  location.value = route.query.location || ''
  hall.value = route.query.hall || ''
  date.value = route.query.date || ''
  time.value = route.query.time || ''

  if (movieId.value && location.value && hall.value && date.value && time.value) {
    try {
      const response = await axios.get('http://127.0.0.1:8001/api/booked-seats', {
        params: {
          movieId: movieId.value,
          location: location.value,
          hall: hall.value,
          date: date.value,
          time: time.value
        }
      })
      bookedSeats.value = response.data
    } catch (error) {
      console.error('Error fetching booked seats:', error)
    }
  }
})

const getSeatColor = (seatId) => {
  if (bookedSeats.value.includes(seatId)) return 'gray'
  if (selectedSeats.value.includes(seatId)) return '#adb5bd'
  return '#343a40'
}

const toggleSeat = (seatId) => {
  const index = selectedSeats.value.indexOf(seatId)
  if (index === -1) {
    selectedSeats.value.push(seatId)
  } else {
    selectedSeats.value.splice(index, 1)
  }
}

const shouldHideSeat = (row, col) => {
  return (row === 'A' || row === 'H') && (col === 1 || col === 9)
}

const totalAmount = computed(() => {
  const pricePerSeat = 20
  return selectedSeats.value.length * pricePerSeat
})

const goBack = () => {
  router.back()
}

const goToFood = () => {
  if (selectedSeats.value.length === 0) {
    alert('❌ Please select at least one seat.')
    return
  }

  router.push({
    name: 'food',
    query: {
      id: movieId.value,
      location: location.value,
      hall: hall.value,
      date: date.value,
      time: time.value,
      seats: JSON.stringify(selectedSeats.value)
    }
  })
}
</script>

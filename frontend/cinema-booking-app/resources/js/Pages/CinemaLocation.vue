<template>
  <div class="bg-dark text-light p-3" style="min-height: calc(100vh + 120px); padding-bottom: 160px;">
    <div class="p-3">
      <div class="position-relative text-center mb-3">
        <button class="btn btn-link text-light position-absolute start-0 top-50 translate-middle-y" @click="goBack">
          <i class="bi bi-arrow-left"></i>
        </button>
        <h3 class="mb-0">Ticket Booking</h3>
      </div>
      <p>Where would you like to see the movie? Kindly select as appropriate</p>
    </div>

    <div class="p-3 border-secondary">
      <div class="d-flex">
        <div class="border border-secondary rounded text-white text-start d-flex flex-column justify-content-end me-3"
             style="width: 250px; height: 250px; background-color: #6c757d; padding: 1rem;">
          <small>Tickets from</small>
          <div class="fw-bold">NGN 2000 - NGN 5000</div>
        </div>
        <div class="border border-secondary rounded text-white text-start d-flex flex-column justify-content-end"
             style="width: 250px; height: 250px; background-color: #6c757d; padding: 1rem;">
          <small>Tickets from</small>
          <div class="fw-bold">NGN 1500 - NGN 4500</div>
        </div>
      </div>
    </div>

    <div class="p-3">
      <p>Location</p>
      <select v-model="selectedLocation" class="form-select border-secondary text-dark" style="width: 50%; background-color: white;">
        <option disabled value="">Select Location</option>
        <option value="Cinema One">Cinema One</option>
        <option value="Cinema Two">Cinema Two</option>
      </select>
    </div>

    <div class="p-3">
      <p>Cinema Hall</p>
      <select v-model="selectedHall" class="form-select border-secondary text-dark" style="width: 50%; background-color: white;">
        <option disabled value="">Select Cinema Hall</option>
        <option value="Hall 1">Hall 1</option>
        <option value="Hall 2">Hall 2</option>
      </select>
    </div>

    <div class="p-3 text-white">
      <p>Select a date</p>

      <div class="d-flex justify-content-start align-items-center mb-2">
        <button class="btn btn-sm btn-outline-light px-2" @click="prevMonth" :disabled="isPrevDisabled" style="border: none;">&lt;</button>
        <p class="mb-0 mx-1 text-white">&nbsp;{{ currentMonthName }}&nbsp;</p>
        <button class="btn btn-sm btn-outline-light px-2" @click="nextMonth" style="border: none;">&gt;</button>
      </div>

      <div class="p-3 text-white">
        <div class="d-flex text-center mb-1 fw-bold">
          <div v-for="(day, index) in next7Days" :key="'weekday-' + index" class="flex-fill">
            {{ day.weekday }}
          </div>
        </div>
        <div class="d-flex text-center">
          <div
            v-for="(day, index) in next7Days"
            :key="'date-' + index"
            class="flex-fill"
            @click="selectedDate = day.fullDate"
            :style="{ cursor: 'pointer', backgroundColor: selectedDate === day.fullDate ? '#adb5bd' : 'transparent' }"
          >
            {{ day.date }}
          </div>
        </div>
      </div>
    </div>

    <div class="p-3">
      <p>Available Time</p>
      <div class="d-flex flex-wrap gap-3" style="width: 360px;">
        <div
          v-for="(time, index) in availableTimes"
          :key="index"
          @click="selectedTime = time"
          :style="{
            width: '80px',
            backgroundColor: selectedTime === time ? '#adb5bd' : '#6c757d',
            color: 'white',
            textAlign: 'center',
            padding: '8px 0',
            border: '1px solid #dee2e6',
            borderRadius: '0.25rem',
            cursor: 'pointer'
          }"
        >
          {{ time }}
        </div>
      </div>
    </div>

    <div class="p-3 text-center mb-5">
      <p class="mb-2">Select Seat</p>
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

    <div class="fixed-bottom p-3 bg-dark">
      <div class="d-flex gap-3">
        <button class="btn text-dark fw-bold flex-fill" style="background-color: white;" @click="goBack">
          Cancel
        </button>
        <button class="btn text-white fw-bold flex-fill" style="background-color: gray;" @click="goToSeats">
          Proceed
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRoute, useRouter } from 'vue-router'
import { ref, onMounted, computed } from 'vue'

const route = useRoute()
const router = useRouter()

const movieId = ref('')

const selectedLocation = ref('')
const selectedHall = ref('')
const selectedDate = ref('')
const selectedTime = ref('')

onMounted(() => {
  if (!route.query.movieId) {
    alert('❌ Movie ID is missing. Returning to home page.')
    router.push({ name: 'home' })
  } else {
    movieId.value = route.query.movieId
  }
})

const goBack = () => {
  router.back()
}

const goToSeats = () => {
  if (!selectedLocation.value || !selectedHall.value || !selectedDate.value || !selectedTime.value) {
    alert('❌ Please fill in all booking details.')
    return
  }

  router.push({
    name: 'seats',
    query: {
      movieId: movieId.value,
      location: selectedLocation.value,
      hall: selectedHall.value,
      date: selectedDate.value,
      time: selectedTime.value
    }
  })
}

const next7Days = computed(() => {
  const days = []
  const today = new Date()

  for (let i = 0; i < 7; i++) {
    const future = new Date(today)
    future.setDate(today.getDate() + i)

    const weekday = future.toLocaleString('default', { weekday: 'short' })
    const date = future.getDate()
    const fullDate = future.toISOString().split('T')[0]

    days.push({ weekday, date, fullDate })
  }

  return days
})

const currentMonthName = computed(() => {
  const today = new Date()
  return today.toLocaleString('default', { month: 'long' })
})

const availableTimes = [
  '10:00 AM', '12:30 PM', '2:00 PM', '3:30 PM',
  '5:00 PM', '6:30 PM', '8:00 PM'
]
</script>
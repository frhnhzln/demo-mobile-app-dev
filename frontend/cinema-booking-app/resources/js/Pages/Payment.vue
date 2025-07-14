<template>
  <div class="bg-dark text-light min-vh-100 p-4">
    <div class="position-relative text-center mb-4">
      <button class="btn btn-link text-white position-absolute start-0 top-0" @click="goBack">
        <i class="bi bi-arrow-left fs-4"></i>
      </button>
      <h2 class="m-0">Payment</h2>
    </div>

    <div class="text-start mb-4">
      <p>
        <strong>How would you like to make the payment? Kindly select your preferred option.</strong>
      </p>
    </div>

    <div class="d-flex flex-column gap-3" style="max-width: 400px;">
      <button class="btn bg-transparent text-white w-100 text-start py-3" @click="selectPayment('card')">
        <div class="d-flex justify-content-between align-items-center w-100 border-bottom border-white pb-2">
          <div class="d-flex align-items-start">
            <i class="bi bi-credit-card me-2 fs-5"></i>
            <div class="d-flex flex-column">
              <span class="fw-bold">Debit / Credit Card</span>
              <small class="text-white mt-1">Pay with VISA</small>
            </div>
          </div>
          <div class="text-white fs-5">&gt;</div>
        </div>
      </button>

      <button class="btn bg-transparent text-white w-100 text-start py-3" @click="selectPayment('bank')">
        <div class="d-flex justify-content-between align-items-center w-100 border-bottom border-white pb-2">
          <div class="d-flex align-items-start">
            <i class="bi bi-bank me-2 fs-5"></i>
            <div class="d-flex flex-column">
              <span class="fw-bold">Bank Transfer</span>
              <small class="text-white mt-1">Transfer from your bank account</small>
            </div>
          </div>
          <div class="text-white fs-5">&gt;</div>
        </div>
      </button>

      <button class="btn bg-transparent text-white w-100 text-start py-3" @click="selectPayment('crypto')">
        <div class="d-flex justify-content-between align-items-center w-100 border-bottom border-white pb-2">
          <div class="d-flex align-items-start">
            <i class="bi bi-currency-bitcoin me-2 fs-5"></i>
            <div class="d-flex flex-column">
              <span class="fw-bold">Crypto Wallet</span>
              <small class="text-white mt-1">Pay from your cryptocurrency wallet</small>
            </div>
          </div>
          <div class="text-white fs-5">&gt;</div>
        </div>
      </button>
    </div>
  </div>
</template>

<script setup>
import { useRouter, useRoute } from 'vue-router'
import { ref } from 'vue'

const router = useRouter()
const route = useRoute()

const goBack = () => router.back()

const movieId = ref(route.query.movieId || '')
const location = ref(route.query.location || '')
const hall = ref(route.query.hall || '')
const date = ref(route.query.date || '')
const time = ref(route.query.time || '')
const total = ref(route.query.total || '')

const seats = ref([])
const food = ref([])

try {
  seats.value = JSON.parse(route.query.seats)
} catch {
  seats.value = decodeURIComponent(route.query.seats || '').split(',')
}

try {
  food.value = JSON.parse(route.query.food || '[]')
} catch (e) {
  food.value = []
}

const selectPayment = (method) => {
  router.push({
    name: 'payment-form',
    query: {
      method,
      movieId: movieId.value,
      location: location.value,
      hall: hall.value,
      date: date.value,
      time: time.value,
      seats: JSON.stringify(seats.value),
      food: JSON.stringify(food.value),
      total: total.value
    }
  })
}
</script>

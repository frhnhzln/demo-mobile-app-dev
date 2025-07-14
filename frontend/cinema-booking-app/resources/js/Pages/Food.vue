<template>
  <div class="bg-dark text-light min-vh-100 p-4">
    <div class="position-relative text-center mb-4">
      <button class="btn btn-link text-white position-absolute start-0 top-0" @click="goBack">
        <i class="bi bi-arrow-left fs-4"></i>
      </button>
      <h2 class="m-0">Food & Beverage</h2>
      <button class="btn btn-link text-white position-absolute end-0 top-0" @click="skipToSummary">
        Skip &gt;
      </button>
    </div>

    <div class="text-center mb-4">
      <div class="d-inline-flex gap-4">
        <button class="btn text-white bg-transparent px-3 py-2 border-0" :class="{ 'border-bottom border-white fw-bold': selectedCategory === 'combo' }" @click="selectCategory('combo')">Combo</button>
        <button class="btn text-white bg-transparent px-3 py-2 border-0" :class="{ 'border-bottom border-white fw-bold': selectedCategory === 'food' }" @click="selectCategory('food')">Food/Snacks</button>
        <button class="btn text-white bg-transparent px-3 py-2 border-0" :class="{ 'border-bottom border-white fw-bold': selectedCategory === 'beverage' }" @click="selectCategory('beverage')">Beverages</button>
      </div>
    </div>

    <div v-if="selectedCategory === 'combo'" class="container">
      <div class="row row-cols-2 row-cols-md-3 g-4 justify-content-center">
        <div class="col" v-for="(item, index) in comboItems" :key="'combo-' + index">
          <div class="rounded p-3 text-white h-100">
            <div style="height: 120px; background-color: #ccc; border-radius: 4px;"></div>
            <div class="mt-3 d-flex justify-content-between align-items-center">
              <div class="text-start">
                <h6 class="mb-1">{{ item.name }}</h6>
                <p class="mb-0">RM {{ item.price.toFixed(2) }}</p>
              </div>
              <div class="d-flex align-items-center gap-2">
                <button class="btn btn-sm btn-light px-2 py-1" @click="decrease(item)">-</button>
                <span>{{ item.quantity }}</span>
                <button class="btn btn-sm btn-light px-2 py-1" @click="increase(item)">+</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div v-if="selectedCategory === 'food'" class="container">
      <div class="row row-cols-2 row-cols-md-3 g-4 justify-content-center">
        <div class="col" v-for="(item, index) in foodItems" :key="'food-' + index">
          <div class="rounded p-3 text-white h-100">
            <div style="height: 120px; background-color: #ccc; border-radius: 4px;"></div>
            <div class="mt-3 d-flex justify-content-between align-items-center">
              <div class="text-start">
                <h6 class="mb-1">{{ item.name }}</h6>
                <p class="mb-0">RM {{ item.price.toFixed(2) }}</p>
              </div>
              <div class="d-flex align-items-center gap-2">
                <button class="btn btn-sm btn-light px-2 py-1" @click="decrease(item)">-</button>
                <span>{{ item.quantity }}</span>
                <button class="btn btn-sm btn-light px-2 py-1" @click="increase(item)">+</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div v-if="selectedCategory === 'beverage'" class="container">
      <div class="row row-cols-2 row-cols-md-3 g-4 justify-content-center">
        <div class="col" v-for="(item, index) in beverageItems" :key="'bev-' + index">
          <div class="rounded p-3 text-white h-100">
            <div style="height: 120px; background-color: #ccc; border-radius: 4px;"></div>
            <div class="mt-3 d-flex justify-content-between align-items-center">
              <div class="text-start">
                <h6 class="mb-1">{{ item.name }}</h6>
                <p class="mb-0">RM {{ item.price.toFixed(2) }}</p>
              </div>
              <div class="d-flex align-items-center gap-2">
                <button class="btn btn-sm btn-light px-2 py-1" @click="decrease(item)">-</button>
                <span>{{ item.quantity }}</span>
                <button class="btn btn-sm btn-light px-2 py-1" @click="increase(item)">+</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="container mt-4">
      <div class="border border-white rounded text-white px-3 py-2" style="max-width: 400px; margin: 0 auto;">
        <div class="d-flex justify-content-between mb-2">
          <strong>Item</strong>
          <strong>Sub-total</strong>
        </div>
        <div class="d-flex justify-content-between">
          <span>{{ totalQuantity }}</span>
          <span>RM {{ totalAmount.toFixed(2) }}</span>
        </div>
      </div>
    </div>

    <div class="mt-4 d-flex justify-content-center">
      <button class="btn btn-success fw-bold w-100" style="max-width: 400px;" @click="proceedToPayment">Proceed to Payment</button>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useRouter, useRoute } from 'vue-router'

const router = useRouter()
const route = useRoute()

const movieId = ref(route.query.id || '') 
const location = ref(route.query.location || '')
const hall = ref(route.query.hall || '')
const date = ref(route.query.date || '')
const time = ref(route.query.time || '')

let parsedSeats = []
const rawSeats = route.query.seats

if (rawSeats) {
  try {
    parsedSeats = JSON.parse(rawSeats)
  } catch (e) {
    parsedSeats = rawSeats.split(',')
  }
}

const seats = ref(parsedSeats)

const selectedCategory = ref('combo')

const comboItems = ref([
  { name: 'Combo 1', price: 12, quantity: 0 },
  { name: 'Combo 2', price: 14, quantity: 0 },
  { name: 'Combo 3', price: 16, quantity: 0 },
  { name: 'Combo 4', price: 18, quantity: 0 },
  { name: 'Combo 5', price: 20, quantity: 0 },
  { name: 'Combo 6', price: 22, quantity: 0 },
])

const foodItems = ref([
  { name: 'Snack 1', price: 6.5, quantity: 0 },
  { name: 'Snack 2', price: 8, quantity: 0 },
  { name: 'Snack 3', price: 9.5, quantity: 0 },
  { name: 'Snack 4', price: 11, quantity: 0 },
  { name: 'Snack 5', price: 12.5, quantity: 0 },
  { name: 'Snack 6', price: 14, quantity: 0 },
])

const beverageItems = ref([
  { name: 'Beverage 1', price: 5.2, quantity: 0 },
  { name: 'Beverage 2', price: 6.4, quantity: 0 },
  { name: 'Beverage 3', price: 7.6, quantity: 0 },
  { name: 'Beverage 4', price: 8.8, quantity: 0 },
  { name: 'Beverage 5', price: 10, quantity: 0 },
  { name: 'Beverage 6', price: 11.2, quantity: 0 },
])

const allItems = computed(() => [...comboItems.value, ...foodItems.value, ...beverageItems.value])
const totalQuantity = computed(() => allItems.value.reduce((sum, item) => sum + item.quantity, 0))
const totalAmount = computed(() => allItems.value.reduce((sum, item) => sum + item.price * item.quantity, 0))

const increase = (item) => item.quantity++
const decrease = (item) => { if (item.quantity > 0) item.quantity-- }

const selectCategory = (category) => selectedCategory.value = category
const goBack = () => router.back()

const proceedToPayment = () => {
  const selectedItems = allItems.value.filter(item => item.quantity > 0)
  const food = encodeURIComponent(JSON.stringify(selectedItems))
  const encodedSeats = encodeURIComponent(JSON.stringify(seats.value))

  router.push({
    name: 'booking-summary',
    query: {
      movieId: movieId.value,
      location: location.value,
      hall: hall.value,
      date: date.value,
      time: time.value,
      seats: encodedSeats,
      food
    }
  })
}

const skipToSummary = () => {
  const encodedSeats = encodeURIComponent(JSON.stringify(seats.value))
  router.push({
    name: 'booking-summary',
    query: {
      movieId: movieId.value,
      location: location.value,
      hall: hall.value,
      date: date.value,
      time: time.value,
      seats: encodedSeats
    }
  })
}
</script>

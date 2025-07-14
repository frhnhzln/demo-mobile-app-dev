<template>
  <div class="bg-dark text-white min-vh-100 px-3 py-4">
    <div class="d-flex justify-content-between align-items-center mb-2">
      <h5 class="mb-0">Hello, Raymond</h5>
      <i class="bi bi-bell fs-4"></i>
    </div>

    <p>Want to go see a movie? Get your ticket today</p>

    <input type="text" v-model="search" class="form-control bg-secondary text-white border-0 mb-4" placeholder="Search by movies or cinema hall"/>

    <div>
      <h6 class="mb-2">New Releases <span class="float-end text-muted">view all</span></h6>

      <div v-if="filteredMovies.length" class="d-flex flex-nowrap overflow-auto gap-3 mb-4">
        <div
          v-for="movie in filteredMovies"
          :key="movie.id"
          class="bg-secondary text-white rounded p-2 text-center"
          style="width: 140px"
          @click="goToMovie(movie.id)"
        >
          <div class="bg-light mb-2" style="height: 100px; border-radius: 5px;"></div>
          <small>{{ movie.title }}</small>
        </div>
      </div>

      <div v-else class="text-muted">
        No movies found.
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
import { ref, onMounted, computed } from 'vue'

const router = useRouter()
const search = ref('')
const newReleases = ref([])

const loadMovies = async () => {
  try {
    const res = await fetch('http://127.0.0.1:8001/api/movies')
    const data = await res.json()
    newReleases.value = data.slice(0, 4)
  } catch (error) {
    console.error('Failed to load movies:', error)
  }
}

const goToMovie = (id) => {
  router.push({ name: 'movie-details', params: { id } })
}

const filteredMovies = computed(() => {
  const keyword = search.value.toLowerCase()
  return newReleases.value.filter(movie =>
    movie.title.toLowerCase().includes(keyword)
  )
})

onMounted(loadMovies)
</script>

<template>
  <div class="bg-dark text-light min-vh-100 p-3" v-if="movie">
    <div class="d-flex align-items-start mb-3">

        <div class="position-relative me-3" style="width: 150px;">
            <div class="bg-secondary rounded" style="height: 200px;"></div>
            <button class="btn btn-outline-light position-absolute top-0 end-0 m-2">🔊</button>
        </div>

        <div class="flex-grow-1">
            <h4>{{ movie.title }}</h4>
            <div class="mb-2">
                <span v-for="genre in movie.genres" :key="genre" class="badge border border-white text-white me-1" style="background-color: transparent;">{{ genre }}</span>
            </div>
            <div class="mb-2 d-flex align-items-center gap-2 ">
                <i class="bi bi-calendar-event"></i>
                <span class="text-white">{{ movie.release_date }}</span>

                <i class="bi bi-tv"></i>
                <span class="text-white">{{ movie.age_rating }}</span>

                <i class="bi bi-clock"></i>
                <span class="text-white">{{ movie.duration }}</span>
            </div>
            <div class="mb-2 d-flex align-items-center gap-2">
                <div style="color: #aaa;">
                    <i v-for="index in 5" :key="index" :class="getStarClass(index)"></i>
                </div>
                <span class="text-white">{{ movie.rating }} / 5</span>
            </div>
        </div>
    </div>

   <ul class="nav nav-tabs mt-3" id="movieTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button
            class="nav-link active text-secondary fw-bold border-secondary"
            id="details-tab"
            data-bs-toggle="tab"
            data-bs-target="#details"
            type="button"
            role="tab"
            aria-controls="details"
            aria-selected="true"
            >
            Movie Details
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button
            class="nav-link text-secondary fw-bold border-secondary"
            id="reviews-tab"
            data-bs-toggle="tab"
            data-bs-target="#reviews"
            type="button"
            role="tab"
            aria-controls="reviews"
            aria-selected="false"
            >
            Ratings & Reviews
            </button>
        </li>
    </ul>

    <div class="tab-content mt-3" id="movieTabContent">
        <!-- Movie Details-->
        <div class="tab-pane fade show active" id="details" role="tabpanel" aria-labelledby="details-tab">
            <div class="border border-secondary p-3 rounded mb-3">
                <h6 class="d-flex justify-content-between align-items-center">
                    Full Synopsis
                    <button class="btn btn-sm text-secondary p-0 border-0" @click="toggleSynopsis">
                    <i :class="showFullSynopsis ? 'bi bi-chevron-up' : 'bi bi-chevron-down'"></i>
                    </button>
                </h6>
                <p>{{ showFullSynopsis ? movie.synopsis : truncatedSynopsis }}</p>
            </div>

            <div class="border border-secondary p-3 rounded mb-3">
            <h6>Cast</h6>
            <p>{{ movie.cast.join(', ') }}</p>
            </div>

            <div class="border border-secondary p-3 rounded mb-3">
            <h6>Director</h6>
            <p>{{ movie.director }}</p>
            </div>

            <div class="border border-secondary p-3 rounded">
            <h6>Writers</h6>
            <p>{{ movie.writer }}</p>
            </div>
        </div>

        <!-- Ratings & Reviews -->
        <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
            <div class="pb-3 border-bottom border-secondary mb-3">
                <p class="mb-0 text-white d-flex align-items-center gap-2">
                <i class="bi bi-star-fill text-secondary"></i>
                {{ movie.rating.toFixed(1) }}
                <span class="text-secondary">[{{ movie.totalReviews }} reviews]</span>
                </p>
            </div>

            <div class="pb-3 border-bottom border-secondary">
                <div v-for="item in ratingBreakdown" :key="item.stars" class="d-flex align-items-center mb-2">

                <div style="min-width: 90px;">
                    <i v-for="n in item.stars" :key="n" class="bi bi-star-fill text-secondary me-1"></i>
                </div>

                <div class="text-white me-2" style="width: 20px;">{{ item.stars }}</div>

                <div class="flex-grow-1 bg-secondary rounded" style="height: 8px;">
                    <div class="bg-light rounded" :style="{ width: (item.count / maxCount * 100) + '%', height: '100%' }"></div>
                </div>

                <div class="text-white ms-2" style="width: 30px;">{{ item.count }}</div>
                </div>
            </div><br>

            <!-- Customer Reviews -->
            <div class="pb-3 border-bottom border-secondary">
                <h6 class="text-white mb-3">Customer Reviews:</h6>

                <div v-if="reviews.length === 0" class="text-secondary fst-italic">
                    No reviews yet. Be the first to write one!
                </div>

                <div v-else class="row g-3">
                    <div
                    v-for="(review, index) in reviews"
                    :key="index"
                    class="col-md-4"
                    >
                    <div class="bg-white text-secondary border border-secondary rounded p-3 h-100">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                        <strong>{{ review.user }}</strong>
                        <div>
                            <i
                            v-for="n in 5"
                            :key="n"
                            :class="n <= review.stars ? 'bi bi-star-fill text-secondary' : 'bi bi-star text-secondary'"
                            ></i>
                        </div>
                        </div>
                        <p class="mb-0">{{ review.comment }}</p>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="fixed-bottom p-3 bg-dark">
        <button class="btn w-100 text-white" style="background-color: gray;" @click="goToLocation">
            Book Ticket
        </button>
    </div>

  </div>
</template>

<script setup>
import { useRoute, useRouter } from 'vue-router'
import { ref, onMounted, computed } from 'vue'

const route = useRoute()
const router = useRouter()
const movie = ref(null)
const showFullSynopsis = ref(false)
const reviews = ref([])

const fetchMovie = async () => {
  const res = await fetch(`http://127.0.0.1:8001/api/movies/${route.params.id}`)
  const data = await res.json()

  data.genres = data.genres ? JSON.parse(data.genres) : []
  data.cast = data.cast ? JSON.parse(data.cast) : []

  movie.value = data
}

const fetchLiveRating = async () => {
  try {
    const res = await fetch(`http://127.0.0.1:8001/api/movies/${route.params.id}/ratings`)
    const data = await res.json()
    
    movie.value.rating = data.rating
    movie.value.totalReviews = data.totalReviews
    ratingBreakdown.value = data.breakdown
    reviews.value = data.reviews
  } catch (e) {
    console.error('Live rating fetch failed', e)
  }
}

const getStarClass = (index) => {
  if (movie.value.rating >= index) {
    return 'bi bi-star-fill'
  } else if (movie.value.rating >= index - 0.5) {
    return 'bi bi-star-half'
  } else {
    return 'bi bi-star'
  }
}

const toggleSynopsis = () => {
  showFullSynopsis.value = !showFullSynopsis.value
}

const truncatedSynopsis = computed(() => {
  return movie.value?.synopsis?.length > 120
    ? movie.value.synopsis.substring(0, 120) + '...'
    : movie.value.synopsis
})

const goToLocation = () => {
  if (!movie.value?.id) {
    alert('❌ Movie ID missing. Cannot proceed to booking.');
    return;
  }

  //debug route url
  console.log('Navigating to cinema-location with', {
    movie: movie.value.title,
    movieId: movie.value.id
  });

  router.push({
  name: 'cinema-location',
  query: {
    movie: movie.value.title,
    movieId: movie.value.id.toString()
  }
})

};

onMounted(() => {
  fetchMovie().then(() => {
    fetchLiveRating()
    setInterval(fetchLiveRating, 5000)
  })
})

const ratingBreakdown = ref([
  { stars: 5, count: 0 },
  { stars: 4, count: 0 },
  { stars: 3, count: 0 },
  { stars: 2, count: 0 },
  { stars: 1, count: 0 }
])

const maxCount = computed(() => {
  return Math.max(...ratingBreakdown.value.map(r => r.count), 1)
})
</script>
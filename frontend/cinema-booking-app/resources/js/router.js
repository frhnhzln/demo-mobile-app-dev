    import { createRouter, createWebHistory } from 'vue-router'
    import Home from './Pages/Home.vue'
    import MovieDetails from './Pages/MovieDetails.vue'
    import SeatSelection from './Pages/SeatSelection.vue'
    import BookingSummary from './Pages/BookingSummary.vue'
    import Food from './Pages/Food.vue'
    import Payment from './Pages/Payment.vue'
    import PaymentForm from './Pages/PaymentForm.vue'
    import PaymentSuccess from './Pages/PaymentSuccess.vue'
    import BookingConfirmation from './Pages/BookingConfirmation.vue'

    export default createRouter({
    history: createWebHistory(),
    routes: [
        { path: '/', component: Home, name: 'home' },
        { path: '/movie/:id', component: MovieDetails, name: 'movie-details' },
        { path: '/seats', name: 'seats', component: SeatSelection },
        { path: '/cinema-location', component: () => import('@/Pages/CinemaLocation.vue'), name: 'cinema-location'},
        { path: '/booking-summary', name: 'booking-summary', component: BookingSummary},
        { path: '/food', name: 'food', component: Food},
        { path: '/payment', name: 'payment', component: Payment },
        { path: '/payment-form', name: 'payment-form', component: PaymentForm},
        { path: '/payment-success', name: 'paymentsuccess', component: PaymentSuccess },
        { path: '/booking-confirmation', name: 'booking-confirmation', component: BookingConfirmation },
    ]
    })

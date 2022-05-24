import Vue from 'vue'
import VueRouter, { RouteConfig } from 'vue-router'

Vue.use(VueRouter)

const routes: Array<RouteConfig> = [
  {
    path: '/login',
    component: () => import('@/views/login/Login.vue')
  },
  {
    path: '/dashboard',
    component: () => import('@/views/dashboard/Dashboard.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router

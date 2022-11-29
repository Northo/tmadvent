<script setup>
// This starter template is using Vue 3 <script setup> SFCs
// Check out https://vuejs.org/api/sfc-script-setup.html#script-setup
import HelloWorld from './components/HelloWorld.vue'
import FlipCard from './components/FlipCard.vue'
import 'virtual:windi.css'
import json from './assets/data.json'
import moment from 'moment'

const days = [
  {image: "https://unsplash.com/photos/UnbOtvL1D9k/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8Qm4tRGpyY0Jyd298fHx8fDJ8fDE2Njk2NTE3MjE&force=true&w=640"},
  {image: "https://unsplash.com/photos/ahMCpXdUjv0/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjY5NjUzNzY3&force=true&w=640"},
  {image: "https://unsplash.com/photos/UnbOtvL1D9k/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8Qm4tRGpyY0Jyd298fHx8fDJ8fDE2Njk2NTE3MjE&force=true&w=640"},
  {image: "https://unsplash.com/photos/UnbOtvL1D9k/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8Qm4tRGpyY0Jyd298fHx8fDJ8fDE2Njk2NTE3MjE&force=true&w=640"},
  {image: "https://unsplash.com/photos/UnbOtvL1D9k/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8Qm4tRGpyY0Jyd298fHx8fDJ8fDE2Njk2NTE3MjE&force=true&w=640"},
  {image: "https://unsplash.com/photos/UnbOtvL1D9k/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8Qm4tRGpyY0Jyd298fHx8fDJ8fDE2Njk2NTE3MjE&force=true&w=640"},
  {image: "https://unsplash.com/photos/ahMCpXdUjv0/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjY5NjUzNzY3&force=true&w=640"},
  {image: "https://unsplash.com/photos/ahMCpXdUjv0/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjY5NjUzNzY3&force=true&w=640"},
  {image: "https://unsplash.com/photos/ahMCpXdUjv0/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjY5NjUzNzY3&force=true&w=640"},
  {image: "https://unsplash.com/photos/ahMCpXdUjv0/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjY5NjUzNzY3&force=true&w=640"},
]

function flipped(index) {
  return moment().add(index, 'days').startOf('day').isBefore()
}

</script>

<template>
  <div class="flex flex-wrap gap-1">
    <FlipCard v-for="(day, index) in json" :image="day.image" :day="index + 1" :opensOn="moment().add(index, 'days').startOf('day')" :flipped="flipped(index)" />
  </div>
  <div>
    <a href="https://vitejs.dev" target="_blank">
      <img src="/vite.svg" class="logo" alt="Vite logo" />
    </a>
    <a href="https://vuejs.org/" target="_blank">
      <img src="./assets/vue.svg" class="logo vue" alt="Vue logo" />
    </a>
  </div>
  <HelloWorld msg="Vite + Vue" />
  <FlipCard />
</template>

<style scoped>
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style>

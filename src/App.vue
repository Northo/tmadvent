<script setup>
// This starter template is using Vue 3 <script setup> SFCs
// Check out https://vuejs.org/api/sfc-script-setup.html#script-setup
import HelloWorld from './components/HelloWorld.vue'
import FlipCard from './components/FlipCard.vue'
import 'virtual:windi.css'
import json from './assets/data.json'
import moment from 'moment'

const startDay = '2022-11-28';

function flipped(index) {
  return moment(startDay).add(index + 1, 'days').startOf('day').isBefore()
}

function opensOn(index) {
  return moment(startDay).add(index, 'days')
}
</script>

<template>
  <h1 class="3xl my-5">Julekalender T&M</h1> 
  <div class="flex flex-wrap gap-1">
    <FlipCard v-for="(day, index) in json" 
      :image="day.image"
      :day="index + 1"
      :opensOn="opensOn(index)"
      :flipped="flipped(index)"
    />
  </div>
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

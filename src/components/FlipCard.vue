<script>
import * as moment from 'moment';
import ArrowExpandAllIcon from 'vue-material-design-icons/ArrowExpandAll.vue';

export default {
    props: {
        flipped: Boolean,
        opensOn: moment.Moment,
        image: String,
        day: Number,
    },
    computed: {
        open() {
          return this.opensOn.startOf('day').isBefore()
        }, 
        imageURL() {
          return import.meta.env.BASE_URL + this.image;
        },
        opensOnString() {
          return this.opensOn.calendar(null, {
            sameDay: '[Today]',
            nextDay: '[Tomorrow]',
            nextWeek: 'dddd',
            lastDay: '[Yesterday]',
            lastWeek: '[Last] dddd',
            sameElse: 'DD/MM/YYYY'
          })
        }
    },
    components: {
      ArrowExpandAllIcon
    }
}
</script>

<template>
    <div class="flip-card" :class="{ flipped: flipped }" @click="flipped = open && !flipped">
        <div class="flip-card-inner">
            <div class="flip-card-front rounded-xl">
                <h2 class="font-serif">T & M</h2>
                <h1 class="m-auto">{{ day }}</h1>
                <span v-if="!open" class="absolute inset-x-0 bottom-0">Opens {{ this.opensOnString }}</span>
            </div>
            <div class="flip-card-back rounded-xl" v-if="open">
                <span class="absolute left-2">
                  <a :href="imageURL" target="_blank" @click.stop>
                   <arrow-expand-all-icon />
                  </a>
                </span>
                <img :src=imageURL alt="Missing image" />
            </div>
        </div>
    </div>
</template>

<style>
/* The flip card container - set the width and height to whatever you want. We have added the border property to demonstrate that the flip itself goes out of the box on hover (remove perspective if you don't want the 3D effect */
.flip-card {
  background-color: transparent;
  width: 300px;
  height: 200px;
  perspective: 1000px; /* Remove this if you don't want the 3D effect */
}

/* This container is needed to position the front and back side */
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card.flipped .flip-card-inner {
  transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden; /* Safari */
  backface-visibility: hidden;
  overflow: hidden;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
  background-color: #f19393;
  color: black;
}

/* Style the back side */
.flip-card-back {
  background-color: dodgerblue;
  color: white;
  transform: rotateY(180deg);
}
</style>

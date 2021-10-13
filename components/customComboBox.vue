<template>
  <div
    class="custom-combo-box-wrapper"
    ref="customComboBox"
    @click="
      () => {
        if ($refs.comboBoxItemList.style.display == 'none') openComboBox();
        else closeComboBox();
      }
    "
  >
    <div class="combo-box-item">
      <h4>{{ comboItems[selectedIndex].itemTitle }}</h4>
    </div>
    <ul class="combo-box-items-list" ref="comboBoxItemList">
      <li v-for="(item, index) in comboItems" :key="index">
        <button
          @click="
            selectedIndex = index;
            closeComboBox();
            $emit('itemChanged');
          "
          class="combo-box-item-button"
        >
          {{ item.itemTitle }}
        </button>
      </li>
    </ul>
    <div class="combo-box-graphical-element">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="13.61"
        height="6.027"
        viewBox="0 0 13.61 6.027"
      >
        <path
          id="Path_1"
          data-name="Path 1"
          d="M14.71,28.59l6.5,5,6.5-5"
          transform="translate(-14.405 -28.194)"
          fill="none"
          stroke="#fafafa"
          stroke-width="1"
        />
      </svg>
    </div>
  </div>
</template>

<script>
import { gsap } from "gsap";
export default {
  props: {
    comboItems: Array,
    selectedIndex: Number
  },
  methods: {
    openComboBox() {
      this.$refs.comboBoxItemList.style.display = "initial";
      gsap.fromTo(
        ".combo-box-items-list",
        { opacity: 0, scaleY: 0.8, scaleX: 0.8 },
        { opacity: 1, scaleY: 1, scaleX: 1, duration: 0.3 }
      );
    },
    closeComboBox() {
      gsap.to(".combo-box-items-list", {
        opacity: 0,
        duration: 0.3,
        onComplete: () => {
          this.$refs.comboBoxItemList.style.display = "none";
        }
      });
    }
  }
};
</script>
<style>
.custom-combo-box-wrapper {
  user-select: none;
  transition: background-color 0.1s, box-shadow 0.1s;
  position: relative;
  cursor: pointer;
  display: flex;
  justify-content: center;
  background-color: #2a2a2a;
  border-radius: 3px;
  padding: 1em 1em 1em 1em;
}
.custom-combo-box-wrapper:hover {
  background-color: #333333;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16);
}
.combo-box-item {
  position: relative;
}
.combo-box-items-list {
  transform-origin: top left;
  background-color: #202020;
  list-style: none;
  opacity: 0;
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  display: none;
}
.combo-box-items-list li {
  margin: 0;
}
.combo-box-item-button {
  cursor: pointer;
  width: 100%;
  text-align: left;
  transition: background-color 0.1s, box-shadow 0.1s;
  padding: 1em;
  border-radius: 3px;
}
.combo-box-item-button:hover {
  background-color: #2a2a2a;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16);
}
.combo-box-item-button.selected {
  background-color: #333333;
}
.combo-box-items-list > li > button {
  color: #aaaaaa;
  background-color: transparent;
  border: none;
  border-radius: 3px;
}
.combo-box-item > h4 {
  font-weight: 500;
  color: #aaaaaa;
}
.combo-box-graphical-element {
  margin-left: 1em;
}
</style>

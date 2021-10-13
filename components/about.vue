<template>
  <div class="about-wrapper">
    <div class="about-container-wrapper">
      <div class="about-title-wrapper">
        <h2>About</h2>
      </div>
      <div class="about-content-wrapper">
        <div class="information-wrapper">
          <h4 class="info-name">
            Programmer: <span class="info-content">Arian Novin</span>
          </h4>
          <h4 class="info-name">
            Designer: <span class="info-content">Arian Novin</span>
          </h4>
          <h4 class="info-name">
            Organization name: <span class="info-content">Swan Dev Agency</span>
          </h4>
          <p class="info-description">
            A simple three js training project focused on the shaders concept<br />
            hope you like it, follow my github account for more
          </p>
        </div>
      </div>
      <div class="about-controls-wrapper">
        <nuxt-link
          to="/"
          class="close-about-button"
          @click.native="$emit('handleNavigation')"
          >Continue</nuxt-link
        >
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
.about-wrapper {
  position: fixed;
  display: none;
  justify-content: center;
  align-items: center;
  position: absolute;
  backdrop-filter: blur(10px);
  background-color: #0000003a;
  inset: 0;
}
.about-container-wrapper {
  position: fixed;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.26);
  padding: 2em;
  border-radius: 3px;
  background-color: #1a1a1a;
  border: 1px solid #333333;
  margin: auto;
  color: #f0f0f0;
}
.about-title-wrapper > h2 {
  padding-bottom: 0.5em;
  border-bottom: 1px solid #333333;
  font-weight: 300;
  margin-bottom: 0.5em;
}
.info-name {
  font-size: 0.8em;
  font-weight: 300;
  margin-bottom: 0.3em;
}
.info-content {
  font-weight: 500;
  margin-left: 1em;
}
.info-description {
  margin-top: 1em;
  font-size: 14px;
  letter-spacing: 0.1em;
  line-height: 1.5em;
}
.close-about-button {
  margin-top: 2em;
  transition: background-color 0.1s, box-shadow 0.1s;
  float: right;
  color: #aaaaaa;
  border-radius: 3px;
  border: none;
  background-color: #2a2a2a;
  padding: 1em;
  text-transform: uppercase;
  text-decoration: none;
  font-weight: 300;
}
.close-about-button:hover {
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16);
  background-color: #333333;
}
</style>

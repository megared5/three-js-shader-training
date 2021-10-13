<template>
  <div class="app-wrapper">
    <h3>Three-js Shader-training</h3>
    <div class="header-wrapper" ref="appHeader">
      <div class="navigation-links-wrapper">
        <ul class="navigation-links">
          <li>
            <nuxt-link to="/" @click.native="handleNavigation">Home</nuxt-link>
          </li>
          <li>
            <nuxt-link to="/#About" @click.native="handleNavigation"
              >About</nuxt-link
            >
          </li>
          <li><a href="#">Github</a></li>
          <li>
            <customComboBox
              :comboItems="[
                { itemTitle: 'French flag' },
                { itemTitle: 'Raging sea' }
              ]"
              :selectedIndex="0"
            />
          </li>
        </ul>
      </div>
    </div>
    <div class="content-wrapper">
      <canvas class="three-js-renderer" ref="threeJsRenderer"></canvas>
    </div>
    <AboutPage @handleNavigation="handleNavigation" />
  </div>
</template>

<script>
import customComboBox from "../components/customComboBox.vue";
import AboutPage from "../components/about.vue";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls.js";
import * as THREE from "three";
import { gsap } from "gsap";
export default {
  head: {
    title: "Three-js Shader-training"
  },
  components: {
    customComboBox,
    AboutPage
  },
  methods: {
    handleNavigation() {
      switch (window.location.hash) {
        case "#About":
          document.querySelector(".about-wrapper").style.display = "flex";
          gsap.fromTo(
            ".about-wrapper",
            { scale: 1.1, opacity: 0 },
            { scale: 1, opacity: 1, duration: 0.1 }
          );
          break;
        case "":
          gsap.to(".about-wrapper", {
            scale: 1.1,
            opacity: 0,
            duration: 0.1,
            onComplete: () => {
              document.querySelector(".about-wrapper").style.display = "none";
            }
          });
          break;
      }
    },
    tick() {
      this.renderer.render(this.scene, this.camera);
      this.controls.update();
      window.requestAnimationFrame(this.tick);
    },
    renderThreeJs() {
      // ? Three js codes
      // Canvas
      this.canvas = document.querySelector("canvas.three-js-renderer");

      // Sizes
      this.sizes = {
        width: this.canvas.clientWidth,
        height: this.canvas.clientHeight
      };

      // Scene
      this.scene = new THREE.Scene();

      // Object
      const cubeGeometry = new THREE.PlaneBufferGeometry(1, 1, 1, 1, 10);
      const cubeMaterial = new THREE.RawShaderMaterial({
        vertexShader: this.vertexShader,
        fragmentShader: this.fragmentShader
      });
      const cubeMesh = new THREE.Mesh(cubeGeometry, cubeMaterial);
      this.scene.add(cubeMesh);

      // Camera
      this.camera = new THREE.PerspectiveCamera(
        75,
        this.sizes.width / this.sizes.height
      );
      this.camera.position.z = 3;
      this.scene.add(this.camera);

      // Renderer
      this.renderer = new THREE.WebGLRenderer({
        canvas: this.canvas,
        alpha: true
      });
      this.controls = new OrbitControls(this.camera, this.canvas);
      this.renderer.setSize(this.sizes.width, this.sizes.height);
      this.tick();
    }
  },
  mounted() {
    // ? Setting canvas width
    this.$refs.threeJsRenderer.style.setProperty(
      "--header-width",
      this.$refs.appHeader.clientWidth + "px"
    );
    // ? VertexShader
    fetch("/vertex.glsl")
      .then(res => res.text())
      .then(data => {
        this.vertexShader = data;
        // ? FragmentShader
        fetch("/fragment.glsl")
          .then(res => res.text())
          .then(data => {
            this.fragmentShader = data;
            this.renderThreeJs();
          });
      });
    // ? Gsap intro animation
    gsap.fromTo(
      ".app-wrapper",
      {
        x: -100,
        opacity: 0
      },
      {
        x: 0,
        opacity: 1,
        duration: 1
      }
    );
  }
};
</script>
<style>
.app-wrapper {
  height: 100vh;
  display: grid;
  align-content: center;
}
.app-wrapper > h3 {
  text-align: center;
  font-size: 1em;
  font-weight: 500;
  letter-spacing: 0.1em;
  margin: 0 0 1em;
  color: #5a5a5a;
}
.header-wrapper {
  background-color: #1a1a1a;
  padding: 1em 0;
  border-radius: 3px;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16);
  width: 50vw;
  margin: Auto;
}
.navigation-links {
  list-style: none;
  padding: 0;
  display: flex;
  margin: 0;
}
.navigation-links > li {
  margin: 0 1em;
}
.navigation-links a {
  transition: background-color 0.1s, box-shadow 0.1s;
  display: inline-block;
  color: #aaaaaa;
  border-radius: 3px;
  text-align: center;
  padding: 1em;
  text-transform: uppercase;
  text-decoration: none;
  font-weight: 300;
}
.content-wrapper {
  margin: 1em 0 0;
  display: flex;
  justify-content: center;
}
.navigation-links a:hover {
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16);
  background-color: #333333;
}
.nuxt-link-exact-active {
  color: #fafafa !important;
  font-weight: 500 !important;
  background-color: #2a2a2a;
}
.three-js-renderer {
  --header-width: 0px;
  border-radius: 3px;
  background-color: #1a1a1a;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16);
  width: var(--header-width);
}
</style>

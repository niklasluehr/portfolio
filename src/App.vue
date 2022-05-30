<template>
  <!-- ---------- -->
  <!-- navigation -->
  <TheNavBar
    @openContactForm="toggleContactForm"
    @mobileMenuToggled="this.mobileMenuVisible = !this.mobileMenuVisible"
    ref="navBar"
  />
  <!-- navigation end -->
  <!-- -------------- -->

  <router-view />

  <div id="message-button" class="clickable" @click="toggleContactForm">
    <Icon icon="bx:bx-mail-send" />
  </div>

  <footer :style="{ background: footerBackground}">
    <router-link to="Impressum">Impressum</router-link>
    <router-link to="Datenschutz">Datenschutz</router-link>
    <a
      target="_blank"
      rel="noopener noreferrer"
      href="https://github.com/niklasluehr"
      >GitHub</a
    >
  </footer>

  <!-- ------ -->
  <!-- modals -->
  <TheContactForm
    @contactFormToggled="this.contactFormVisible = !this.contactFormVisible"
    ref="contactForm"
  />

  <div
    v-if="mobileMenuVisible || contactFormVisible"
    :class="{ 'only-mobile': mobileMenuVisible }"
    @click="hideForms"
    id="modal-bg"
    :style="{ height: getScrollHeight }"
  ></div>

  <!-- modals end -->
  <!-- ---------- -->
</template>

<script>
import TheNavBar from "@/components/TheNavBar.vue";
import { Icon } from "@iconify/vue";
import TheContactForm from "@/components/TheContactForm.vue";

export default {
  components: {
    TheNavBar,
    TheContactForm,
    Icon,
  },
  data() {
    return {
      contactFormVisible: false,
      mobileMenuVisible: false,
    };
  },
  methods: {
    toggleContactForm() {
      this.hideForms();
      this.$refs.contactForm.toggleContactForm();
    },
    hideForms() {
      if (this.contactFormVisible) {
        this.$refs.contactForm.toggleContactForm();
      }
      if (this.mobileMenuVisible) {
        this.$refs.navBar.toggleMobileMenu();
      }
    },
  },
  computed: {
    getScrollHeight() {
      return document.documentElement.scrollHeight + "px";
      // return "100vh";
    },
    footerBackground() {
      const currentRoute = this.$route.name;
      return currentRoute == "About" || currentRoute == "Home" ? "var(--background2)" : "unset";
    },
  },
  mounted() {
    document.onkeydown = (event) => {
      if (event.key === "Escape") {
        this.hideForms();
      }
    };
  },
};
</script>


<style lang="scss">
@import url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,700;1,400&display=swap");

* {
  box-sizing: border-box;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  -moz-tap-highlight-color: rgba(0, 0, 0, 0);
}

body {
  margin: 0;
  padding: 0;
  height: 100%;
}

#app {
  font-family: "Poppins", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background-color: var(--background);
  color: var(--primary);
  height: 100%;
}

#message-button {
  position: fixed;
  right: 5%;
  bottom: 5%;
  padding: 0.5em;
  padding-right: 0.68em;
  padding-top: 0.6em;
  // width: 53px;
  // height: 53px;
  border-radius: 100%;
  background: var(--accent);
  display: flex;
  justify-content: center;
  align-items: center;

  &:focus {
    outline: 2px solid var(--primary);
  }

  &:hover {
    transform: scale(1.1);
  }

  &:active {
    transform: scale(1.2);
  }
  svg {
    font-size: 1.5rem;
    color: var(--background);
  }
}

footer {
  padding: 1em;
  justify-content: center;
  display: flex;
  gap: 2em;
  background: var(--background2);

  > a {
    display: inline-block;

    &:hover {
      transform: translateY(-1px);
      /* font-weight: bold; */
    }
  }
}

#modal-bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 5;
  background: rgba(0, 0, 0, 0.7);
  transition: 0.3s ease;
}

@media only screen and (min-width: 768px) {
  .only-mobile {
    display: none;
  }
}
</style>

<template>
  <div class="navbar">
    <div class="container">
      <router-link to="/" class="logo">niklas luehr</router-link>

      <img
        id="mobile-cta"
        class="mobile-menu"
        src="@/assets/menu.svg"
        alt="Open Navigation"
      />

      <nav>
        <img
          id="mobile-exit"
          class="mobile-menu-exit"
          src="@/assets/exit.svg"
          alt="Close Navigation"
        />
        <ul class="navigation">
          <li>
            <router-link to="/" class="current">work</router-link>
          </li>
          <li>
            <router-link to="/about">about</router-link>
          </li>
          <li class="contact-me-cta">
            <a v-on:click="toggleContactForm">contact me</a>
          </li>
        </ul>
      </nav>
    </div>
  </div>
  <router-view />
  <div id="contact-form" :style="{top: contactFormTop}">
    <h1>let's get this done!</h1>
    <img v-on:click="toggleContactForm" src="@/assets/form-exit.svg" alt="close contact form">
  </div>
  <div v-if="contactFormVisible" id="contact-form-bg"></div>
</template>

<script>
export default {
  name: "CodeDisplay",
  data() {
    return {
      contactFormVisible: false,
    };
  },
  methods: {
    toggleContactForm() {
      this.contactFormVisible = !this.contactFormVisible;     
    },
  },
  computed: {
    contactFormTop() {
      return this.contactFormVisible ? "50%" : "-50%";
    }
  }
}
</script>


<style lang="scss">
@import url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,700;1,400&display=swap");

:root {
  --primary-color: #f7f7f7;
  --accent-color: #fea82f;
  --background-color: #2d2d2a;
}

* {
  box-sizing: border-box;
}

body {
  margin: 0;
  padding: 0;
}

#app {
  font-family: "Poppins", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background: var(--background-color);
  height: 100vh;
  color: var(--primary-color);
}

.navbar {
  padding: 1em 20.3em;
}

.container {
  display: flex;
  place-content: space-between;

  .navigation {
    display: flex;
    align-items: center;
    gap: 4.6em;
  }
}

.logo {
  color: var(--accent-color);
  font-weight: bold;
  font-size: 1.88rem;
}

a {
  text-decoration: none;
  color: var(--primary-color);

  &.router-link-exact-active {
    font-weight: bold;
  }
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;

  li {
    float: left;

    a {
      font-size: 1.25rem;
      display: block;
      text-align: center;
    }
  }
}

.contact-me-cta a {
  color: var(--background-color);
  background: var(--accent-color);
  border-radius: 1em;
  font-weight: bold;
  font-size: 1.13rem;
  padding: 0.44em 1.34em;
  box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 4rem;

  &:hover{
    cursor: pointer;
  }
}

.mobile-menu-exit {
  display: none;
}

.mobile-menu {
  display: none;
}

#contact-form {
  position: absolute;
  z-index: 10;
  left: 50%;
  top: -50%;
  transform: translate(-50%, -50%);
  width: 37em;
  height: 44em;
  padding: 2.5em 4.2em;

  background: #2D2D2A;
  border: 3px solid #FEA82F;
  box-shadow: 10px 10px 8px 2px rgba(0, 0, 0, 0.29);
  border-radius: 1.13em;

  transition: 0.3s ease;

  h1 {
    margin: 0;
    text-align: left;
    font-size: 1.75rem;
  }

  img {
    position: absolute;
    top: 1em;
    right: 1em;

    &:hover {
      cursor:pointer;
    }
  }
}

#contact-form-bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  z-index: 5;
  background: rgba(0, 0, 0, 0.7);
  transition: 0.3s ease;
}
</style>

<template>
  <div class="navbar">
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
        <li>
          <button class="button-cta" v-on:click="toggleContactForm">contact me</button>
        </li>
      </ul>
    </nav>
  </div>
  <router-view />
  <button id="message-button" v-on:click="toggleContactForm" class="button-cta"> 
    <img  src="@/assets/send-mail.svg" alt="Contact me">
  </button> 
  <footer>
    <a href="">Impresssum</a>
    <a target="_blank" rel="noopener noreferrer" href="https://github.com/niklasluehr">GitHub</a>
    <a href="">Instagram</a>
  </footer>

  <div id="contact-form" :style="{ top: contactFormTop }">
    <h1>let's get this done!</h1>
    <img
      v-on:click="toggleContactForm"
      src="@/assets/form-exit.svg"
      alt="close contact form"
    />
    <label for="name">name</label><br />
    <input type="text" id="name" v-model="name" placeholder="Your Name" /><br />
    <label for="email">email</label><br />
    <input
      type="email"
      id="email"
      v-model="email"
      placeholder="Your E-Mail"
    /><br />
    <label for="message">message</label><br />
    <textarea id="message" v-model="message" placeholder="Your Message" /><br />
    <button class="button-cta" v-on:click="toggleContactForm">send request</button>
  </div>
  <div v-if="contactFormVisible" id="contact-form-bg" :style="{ height: getScrollHeight }"></div>
</template>

<script>
export default {
  name: "CodeDisplay",
  data() {
    return {
      contactFormVisible: false,
      name: "",
      email: "",
      message: "",
    };
  },
  methods: {
    toggleContactForm() {
      this.contactFormVisible = !this.contactFormVisible;
      if (this.contactFormVisible) {
        document.querySelector("#name").focus();
      }
    },
  },
  computed: {
    contactFormTop() {
      return this.contactFormVisible ? "50%" : "-50em";
    },
    getScrollHeight(){
      return document.body.scrollHeight + "px";
    },
  },
  mounted() {
    document.onkeydown = (event) => {
      if (event.key === "Escape" && this.contactFormVisible) {
        this.contactFormVisible = false;
      }
    }
  }
};
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
  background-color: var(--background-color);
  color: var(--primary-color);
}

.navbar {
  padding: 1em 15%;
  display: flex;
  place-content: space-between;
  align-items: center;

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

.navigation {
  list-style-type: none;
  margin: 0;
  padding: 0;

  li {
    float: left;
  }
}

.button-cta {
  color: var(--background-color);
  background: var(--accent-color);
  border-radius: 1em;
  font-weight: bold;
  font-size: 1.13rem;
  padding: 0.5em 1.3em;
  box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 4rem;
  border: none;

  &:hover {
    cursor: pointer;
  }

  &:focus {
    outline: 2px solid var(--primary-color);
  }
}

#message-button {
  position: fixed;
  right: 15%;
  bottom: 15%;
  padding: .5em;
  padding: 14px 11px 10px 12px;
  width: 53px;
  height: 53px;
  border-radius: 100%;
}

.mobile-menu-exit {
  display: none;
}

.mobile-menu {
  display: none;
}

footer {
  padding: 1em;
  justify-content: center;
  display: flex;
  gap: 2em;
}

#contact-form {
  position: fixed;
  z-index: 10;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 37em;
  height: 44em;
  padding: 2.5em 4.2em;

  background: #2d2d2a;
  border: 3px solid #fea82f;
  box-shadow: 10px 10px 8px 2px rgba(0, 0, 0, 0.29);
  border-radius: 1.13em;
  transition: 0.3s ease;

  text-align: left;

  h1 {
    margin: 0;
    margin-bottom: 1em;
    font-size: 1.75rem;
  }

  img {
    position: absolute;
    top: 1em;
    right: 1em;

    &:hover {
      cursor: pointer;
    }
  }

  label {
    font-size: 1.13rem;
    font-weight: bold;
    color: var(--accent-color);
  }

  input,
  textarea {
    font-family: inherit;
    font-size: 1rem;
    background-color: var(--primary-color);
    padding: 0.63em;
    color: var(--background-color);
    border-radius: 0.2em;
    margin-bottom: 2.1em;
    margin-top: 0.2em;
    width: 100%;
    outline: none;
    border: 2px solid var(--primary-color);
    transition: 0.3s;
  }

  input:focus,
  textarea:focus {
    border: 2px solid var(--accent-color);
  }

  textarea {
    height: 12em;
    resize: none;
  }

  button {
    position: relative;
    // bottom: 2.5em;
    left: 50%;
    transform: translateX(-50%);
  }
}

#contact-form-bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 5;
  background: rgba(0, 0, 0, 0.7);
  transition: 0.3s ease;
}
</style>

<template>
  <form
    id="contact-form"
    @submit.prevent="handleSubmit"
    :class="{ visible: isVisible }"
  >
    <h1>let's get this done!</h1>
    <Icon
      class="clickable closeIcon"
      @click="toggleContactForm"
      icon="bx:bx-x"
      style="color: var(--accent)"
    />
    <label for="name">name</label><br />
    <input
      type="text"
      required
      id="name"
      name="name"
      v-model="name"
      placeholder="Ihr Name"
    /><br />
    <label for="email">e-mail</label><br />
    <input
      type="email"
      required
      id="email"
      name="email"
      v-model="email"
      placeholder="Ihre E-Mail"
    /><br />
    <label for="message">nachricht</label><br />
    <textarea
      id="message"
      required
      name="message"
      v-model="message"
      placeholder="Ihre Nachricht"
    /><br />
    <ActionButton label="senden"></ActionButton>
  </form>
</template>

<script>
import { Icon } from "@iconify/vue";
import ActionButton from "@/components/ActionButton.vue";

export default {
  components: {
    ActionButton,
    Icon,
  },
  emits: ["contactFormToggled"],
  data() {
    return {
      isVisible: false,
      name: "",
      email: "",
      message: "",
    };
  },
  methods: {
    handleSubmit() {
      //TODO
      this.toggleContactForm();
    },
    toggleContactForm() {
      this.isVisible = !this.isVisible;
      this.$emit("contactFormToggled");
      if (this.isVisible) {
        document.querySelector("#name").focus();
      }
    },
  },
};
</script>

<style lang="scss" scoped>
#contact-form {
  position: absolute;
  top: 0;
  transform: translateY(-110%);
  width: 100%;
  z-index: 10;
  padding: 2em 2em;

  background: var(--background);
  transition: transform 0.3s ease;

  text-align: left;

  h1 {
    margin: 0;
    margin-bottom: 0.66em;
    font-size: 1.5rem;
  }

  label {
    font-size: 1.13rem;
    font-weight: bold;
    color: var(--accent);
  }

  input,
  textarea {
    font-family: inherit;
    font-size: 1rem;
    background-color: var(--primary);
    padding: 0.63em;
    color: var(--background);
    border-radius: 0.2em;
    margin-bottom: 1.5em;
    margin-top: 0.2em;
    width: 100%;
    outline: none;
    border: 2px solid var(--primary);
    transition: border 0.3s;
  }

  input:focus,
  textarea:focus {
    border: 2px solid var(--accent);
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

  &.visible {
    transform: unset;
  }
}

@media only screen and (min-width: 768px) {
  #contact-form {
    left: 50%;
    transform: translate(-50%, -110%);
    width: 34em;
    padding: 3em;

    border: 3px solid var(--accent);
    box-shadow: 10px 10px 8px 2px rgba(0, 0, 0, 0.29);
    border-radius: 1.13em;

    h1 {
      font-size: 1.75rem;
      margin-bottom: 1em;
    }

    input,
    textarea {
      margin-bottom: 2.1em;
    }

    input:focus,
    textarea:focus {
      border: 2px solid var(--accent);
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

    &.visible {
      top: 50%;
      transform: translate(-50%, -50%);
    }
  }
}
</style>
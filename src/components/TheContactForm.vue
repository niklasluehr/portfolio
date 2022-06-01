<template>
  <div class="modal" :class="{ visible: isVisible }">
    <Icon
      v-if="!isSending"
      class="clickable closeIcon"
      @click="toggleContactForm"
      icon="bx:bx-x"
      style="color: var(--accent)"
    />
    <form
      v-if="!showAfterSubmitMessage"
      ref="form"
      @submit.prevent="handleSubmit"
    >
      <h1>{{ t("contact.slogan") }}</h1>
      <label for="name">name</label><br />
      <input
        type="text"
        required
        id="name"
        name="name"
        v-model="name"
        :placeholder="t('contact.name_ph')"
      /><br />
      <label for="email">e-mail</label><br />
      <input
        type="email"
        required
        id="email"
        name="email"
        v-model="email"
        :placeholder="t('contact.mail_ph')"
      /><br />
      <label for="message">{{ t("contact.message") }}</label
      ><br />
      <textarea
        id="message"
        required
        name="message"
        v-model="message"
        :placeholder="t('contact.message_ph')"
      /><br />
      <ActionButton :label="buttonLabel"></ActionButton>
    </form>
    <template v-else>
      <div class="response-message" v-if="submitSuccesful">
        <Icon icon="bx:check-circle" style="color: var(--accent)" />
        <h3>{{ t("contact.success") }}</h3>
        <p>{{ t("contact.success_sub") }}</p>
      </div>
      <div class="response-message" v-else>
        <Icon icon="bx:error-alt" style="color: var(--error)" />
        <h3>{{ t("contact.error") }}</h3>
        <p>
          {{ t("contact.error_sub") }}
          <a href="mailto:info@niklasluehr.com">{{
            t("contact.error_mail")
          }}</a>
        </p>
      </div>
    </template>
  </div>
</template>

<script>
import { Icon } from "@iconify/vue";
import ActionButton from "@/components/ActionButton.vue";
import { useI18n } from "vue-i18n";
import emailjs from "@emailjs/browser";

export default {
  components: {
    ActionButton,
    Icon,
  },
  emits: ["contactFormToggled"],
  setup() {
    const { t } = useI18n();

    return {
      t,
    };
  },
  data() {
    return {
      isVisible: false,
      name: "",
      email: "",
      message: "",

      isSending: false,
      showAfterSubmitMessage: false,
      submitSuccesful: false,
    };
  },
  methods: {
    handleSubmit() {
      this.isSending = true;
      
      emailjs
        .sendForm(
          "gmail_service",
          "portfolio_contact_form",
          this.$refs.form,
          "zKzHm_b3n8qBmg7IE"
        )
        .then(
          () => {
            this.submitSuccesful = true;
            this.showAfterSubmitMessage = true;
            this.isSending = false;
            
            this.name = "";
            this.email = "";
            this.message = "";
          },
          () => {
            this.submitSuccesful = false;
            this.showAfterSubmitMessage = true;
            this.isSending = false;
          }
        );
    },
    toggleContactForm() {
      if (this.isSending) {
        return;
      }
      this.isVisible = !this.isVisible;

      if (this.isVisible) {
        document.getElementById("name").focus();
      } else {
        this.showAfterSubmitMessage = false;
      }
      this.$emit("contactFormToggled");
    },
  },
  computed: {
    buttonLabel() {
      return this.isSending ? this.t('contact.button_label_active') : this.t('contact.button_label');
    }
  }
};
</script>

<style lang="scss" scoped>
.modal {
  position: absolute;
  top: 0;
  transform: translateY(-110%);
  width: 100%;
  height: 40rem;
  z-index: 10;
  padding: 2em 2em;

  background: var(--background);
  transition: transform 0.3s ease;

  form {
    text-align: left;

    h1 {
      margin: 0em 1.25em 0.66em 0em;
      font-size: 1.3rem;
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

      &:hover {
        transform: translate(-50%, -1px);
      }
    }
  }

  &.visible {
    transform: unset;
  }

  .response-message {
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;

    svg {
      font-size: 4rem;
    }

    h3 {
      margin: 1em 0 0.25em 0;
    }

    p {
      margin: 0;
    }

    a {
      color: var(--accent);

      &:hover {
        text-decoration: underline;
      }
    }
  }
}

@media only screen and (min-width: 768px) {
  .modal {
    width: 34rem;
    height: 43rem;
    padding: 3em;
    border: 3px solid var(--accent);
    box-shadow: 10px 10px 8px 2px rgba(0, 0, 0, 0.29);
    border-radius: 1.13em;
    left: 50%;
    transform: translate(-50%, -110%);

    form {
      width: 100%;
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
    }

    &.visible {
      top: 5%;
      transform: translateX(-50%);
    }

    .response-message {
      h3 {
        font-size: 1.5rem;
      }
      p {
        font-size: 1.2rem;
      }
    }
  }
}
</style>
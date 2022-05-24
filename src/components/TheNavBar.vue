<template>
  <div class="navbar">
    <router-link to="/" class="logo clickable">niklas luehr</router-link>

    <Icon icon="bx:bx-menu" class="clickable" @click="toggleMobileMenu" />

    <nav>
      <ul>
        <li>
          <router-link to="/">{{ t("nav.work") }}</router-link>
        </li>
        <li>
          <router-link to="/about"> {{ t("nav.about") }}</router-link>
        </li>
        <ActionButton :label="t('nav.contact')" @click="$emit('openContactForm')" />
      </ul>
    </nav>

    <Icon
      class="clickable"
      @click="$emit('openContactForm')"
      icon="bx:bx-mail-send"
      style="color: var(--accent)"
    />
  </div>

  <nav class="mobile-menu" :style="{ left: mobileMenuLeft }">
    <ul>
      <li>
        <router-link @click="toggleMobileMenu" to="/">{{
          t("nav.work")
        }}</router-link>
      </li>
      <li>
        <router-link @click="toggleMobileMenu" to="/about">{{
          t("nav.about")
        }}</router-link>
      </li>
    </ul>
    <Icon
      class="clickable closeIcon"
      @click="toggleMobileMenu"
      icon="bx:bx-x"
    />
  </nav>
</template>

<script>
import { Icon } from "@iconify/vue";
import ActionButton from "@/components/ActionButton.vue";
import { useI18n } from "vue-i18n";

export default {
  name: "TheNavBar",
  components: {
    Icon,
    ActionButton,
  },
  emits: ["openContactForm", "mobileMenuToggled"],
  setup() {
    const { t } = useI18n();

    return {
      t,
    };
  },
  data() {
    return {
      mobileMenuVisible: false,
    };
  },
  methods: {
    toggleMobileMenu() {
      this.$emit("mobileMenuToggled");
      this.mobileMenuVisible = !this.mobileMenuVisible;
    },
  },
  computed: {
    mobileMenuLeft() {
      return this.mobileMenuVisible ? "0" : "-100%";
    },
  },
};
</script>

<style scoped lang="scss">
.navbar {
  padding: 0.5em var(--margin-mobile);
  display: flex;
  place-content: space-between;
  align-items: center;

  .logo {
    display: none;
  }

  svg {
    font-size: 2.8em;
  }

  nav {
    display: none;
  }
}

.mobile-menu {
  position: absolute;
  display: flex;
  flex-direction: column;
  top: 0;
  height: 100%;
  width: 75%;
  z-index: 10;
  padding: 4em 2em;
  background: var(--background);
  transition: 0.3s ease;
  text-align: left;

  ul {
    margin: 0;
    padding: 0;

    li {
      list-style-type: none;
      display: flex;

      a {
        font-size: 1.6rem;
        border-left: 4px var(--background2) solid;
        padding: 0.15em 0em 0.15em 0.7em;

        &.router-link-exact-active {
          font-weight: bold;
          border-left: 4px var(--accent) solid;
        }
      }
    }
  }
}

@media only screen and (min-width: 768px) {
  .navbar {
    padding: 1em var(--margin-tablet);

    svg {
      display: none;
    }

    .logo {
      display: inline;
      color: var(--accent);
      font-weight: bold;
      font-size: 1.88rem;
    }

    nav {
      display: flex;

      ul {
        display: flex;
        align-items: center;
        gap: 3em;
        list-style-type: none;
        margin: 0;
        padding: 0;

        a {
          font-size: 1.25rem;

          &.router-link-exact-active {
            font-weight: bold;
          }
        }
      }
    }
  }

  .mobile-menu {
    display: none;
  }
}

@media only screen and (min-width: 1264px) {
  .navbar {
    padding: 1em calc((100% - var(--desktop-max-width)) / 2);

    nav {
      ul {
        gap: 4.6em;
      }
    }
  }

  .mobile-menu {
    display: none;
  }
}
</style>
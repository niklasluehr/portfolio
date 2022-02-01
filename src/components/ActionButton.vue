<template>
  <button class="clickable" @click="(e) => e.target.blur()">
    <Icon v-if="iconName" :icon="iconName" />
    <span v-if="label">{{ label }}</span>
  </button>
</template>

<script>
import { Icon } from "@iconify/vue";

export default {
  name: "ActionButton",
  components: {
    Icon,
  },
  props: {
    label: String,
    iconName: String,
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
button {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0.3em 1.1em;

  color: var(--background);
  background: var(--accent);
  box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.25);

  border-radius: 4rem;
  font-weight: bold;
  font-family: "Poppins", sans-serif;
  font-size: 1.125rem;
  border: none;

  &:focus {
    outline: 2px solid var(--primary);
  }

  &:active {
    transform: scale(1.1);
  }

  svg {
    margin-right: 15px;
    font-size: 1.65rem;
  }
}
</style>

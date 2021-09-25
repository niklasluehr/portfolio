<template>
  <div class="home">
    <section class="hero">
      <div class="hero-text">
        <h1>I bring your business to the next level!</h1>
        <p>Web Design &amp; Development</p>
      </div>
      <img src="@/assets/me.jpg" alt="Me" />
    </section>
  </div>
</template>

<script>
// @ is an alias to /src
// import HelloWorld from '@/components/HelloWorld.vue'

export default {
  name: "Home",
  // components: {
  //   HelloWorld
  // }
};
</script>

<style lang="scss">
:root {
  --primary-color: #f7f7f7;
  --accent-color: #fea82f;
  --background-color: #2d2d2a;
}

.home {
  background: #21211e;
  text-align: left;
  color: var(--primary-color);
}

.hero {
  padding: 10.5em 20.3em;
  display: flex;
  gap: 19em;
  place-content: space-between;

  img {
    width: 33em;
    max-height: 100%;
    max-width: 100%;
    box-shadow: inset 0px 0px 2px 2px #2d2d2a;
    border-radius: 25px;
  }

  h1 {
    margin: 0;
    font-size: 3.3rem;
    border-bottom: 2px solid var(--accent-color);
    padding-bottom: 0.15em;
  }

  p {
    margin: 0;
    font-size: 1.38rem;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    padding-top: 0.5em;
  }
}
</style>
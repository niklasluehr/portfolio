<template>
  <div class="home">
    <section class="hero">
      <div class="hero-text">
        <h1>I bring your business to the next level!</h1>
        <p>Web Design &amp; Development</p>
      </div>
      <img src="@/assets/me.jpg" alt="Me" />
    </section>
   
    <section class="work">
      <section class="work-example">
        <img src="@/assets/codefast.png" alt="codefast.app screenshot" />
        <div class="work-text">
          <h2>codefast.app</h2>
          <p>touch typing trainer for coders</p>
          <ul>
            <li>train special keys used in programming</li>
            <li>track time and words per minute</li>
            <li>user account management</li>
            <li>global leaderboards</li>
          </ul>
        </div>
      </section>
      <section class="work-example right">
        <div class="work-text">
          <h2>codefast.app</h2>
          <p>touch typing trainer for coders</p>
          <ul>
            <li>train special keys used in programming</li>
            <li>track time and words per minute</li>
            <li>user account management</li>
            <li>global leaderboards</li>
          </ul>
        </div>
        <img src="@/assets/codefast.png" alt="codefast.app screenshot" />
      </section>
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
  text-align: left;
  color: var(--primary-color);
}

.hero {
  background: #21211e;
  padding: 10.5em 15%;
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

.work {
  padding: 7em 15%;
}

.work-example {
  padding: 3.5em 0;
  gap: 3.2em;
  display: flex;

  h2 {
    margin: 0;
    font-size: 2rem;
    color: var(--accent-color);
    font-weight: bold;
  }

  p {
    margin: 0;
    letter-spacing: 0.185em;
    color: var(--accent-color);
    text-transform: uppercase;
    // padding-top: 0.5em;
  }

  ul {
    font-size: 1.25rem;
  }
}

.right{
  justify-content: right;
}
</style>
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

    <section class="testimonials">
      <ul>
        <li class="testimonial">
          <blockquote>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ut
            adipiscing dictum rutrum lorem egestas lectus massa nibh.
            Condimentum elementum lorem tempus ornare sit mauris. Hendrerit
            adipiscing diam massa.
          </blockquote>
          <hr>
          <h3>Ben Hughes</h3>
          <p>dance2diz.com</p>
        </li>
        <li class="testimonial">
          <blockquote>
            Orci, nunc diam egestas sed tellus neque, malesuada mauris. Cras
            ultrices quis tincidunt condimentum convallis arcu, ac at. Habitasse
            sed vel enim ac sit. Orci in arcu amet imperdiet mauris eget.
          </blockquote>
          <hr>
          <h3>Paul Hadi</h3>
          <p>paulhadimusic.com</p>
        </li>
        <li class="testimonial">
          <blockquote>
            Morbi facilisis condimentum pellentesque dignissim aliquet mi amet.
            Sit proin orci convallis nisi at ultricies nec praesent etiam.
            Lectus duis vel maecenas tortor, leo a. Et urna et lobortis faucibus
            elit viverra aliquam. Maecenas.
          </blockquote>
          <hr>
          <h3>Andrew Ng</h3>
          <p>deeplearning.ai</p>
        </li>
      </ul>
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

.testimonials {
  background: #21211e;
  padding: 7em 15%;

  ul {
    margin: 0;
    padding: 0;
    text-align: center;
    display: flex;
    flex-direction: row;
    gap: 12em;
    justify-content: space-between;
  }
}

.testimonial {
  list-style-type: none;

  blockquote {
    margin: 0;
    font-style: italic;
    font-size: 1.13rem;
  }
  h3 {
    font-size: 1.38rem;
    margin: 0;
  }
  p {
    font-size: 1rem;
    margin: 0;
  }
  hr {
    margin: 1em auto;
    width: 6.25em;
    color:var(--accent-color);
  }
}

.right {
  justify-content: right;
}
</style>
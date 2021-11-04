<template>
  <div class="home">
    <section class="hero">
      <div class="hero-text">
        <h1>I bring your business to the next level!</h1>
        <p>Web Design &amp; Development</p>
        <div class="scroll-container" v-on:click="scrollToWork">
          <div class="scroll-cta"></div>
          <span>see work</span>
        </div>
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

    <section class="work">
      <section v-for="project in projects" :key="project.id" class="work-example">
        <img :src="'http://localhost:1337' + project.preview.url" :alt="project.title + ' screenshot'" />
        <div class="work-text">
          <h2>{{ project.title }}</h2>
          <p>{{ project.subtitle }}</p>
          <ul>
            <li v-for="line in project.description.split('\n')" :key="line">{{ line }}</li>
          </ul>
        </div>
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
          <hr />
          <h3>Ben Hughes</h3>
          <p>dance2diz.com</p>
        </li>
        <li class="testimonial">
          <blockquote>
            Orci, nunc diam egestas sed tellus neque, malesuada mauris. Cras
            ultrices quis tincidunt condimentum convallis arcu, ac at. Habitasse
            sed vel enim ac sit. Orci in arcu amet imperdiet mauris eget.
          </blockquote>
          <hr />
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
          <hr />
          <h3>Andrew Ng</h3>
          <p>deeplearning.ai</p>
        </li>
      </ul>
    </section>
  </div>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      projects: [],
      headers: { "Content-Type": "application/json" },
    };
  },
  methods: {
    scrollToWork() {
      document.querySelector(".work").scrollIntoView({ behavior: "smooth" });
    },
    parseJSON: function (resp) {
      return (resp.json ? resp.json() : resp);
    },
    checkStatus: function (resp) {
      if (resp.status >= 200 && resp.status < 300) {
        return resp;
      }
      return this.parseJSON(resp).then((resp) => {
        throw resp;
      });
    }
  },
  async mounted() {
    try {
      const response = await fetch("http://localhost:1337/projects", {
        method: "GET",
        headers: this.headers,
      })
        .then(this.checkStatus)
        .then(this.parseJSON);
      this.projects = response
      console.log(this.projects);
    } catch (error) {
      console.log(error.message);
    }
  },
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
  padding: 7em 15%;
  display: flex;
  // gap: 19em;
  place-content: space-between;

  .hero-text {
    width: 28em;
    padding-right: 2em;
  }

  img {
    width: 33em;
    box-shadow: inset 0px 0px 2px 2px #2d2d2a;
    border-radius: 25px;
  }
}

.hero-text {
  display: flex;
  flex-direction: column;

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
.scroll-container {
  align-self: center;
  display: flex;
  align-items: center;
  margin-top: 3.2em;

  span {
    font-size: 1.25rem;
    padding-left: 0.5em;
    font-weight: bold;
  }

  &:hover {
    cursor: pointer;
  }
}
.scroll-cta {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0.15em;
  height: 3.88em;
  width: 1.81em;
  border: 2px solid var(--accent-color);
  border-radius: 3em;

  &:before {
    position: relative;
    top: 0;
    align-self: flex-end;
    width: 1em;
    height: 1em;
    border-radius: 50%;
    content: "";
    border: 2px solid var(--accent-color);
    animation: move-scroll 1.2s ease-in-out infinite;
  }
}

@keyframes move-scroll {
  0% {
    opacity: 0;
  }
  5% {
    top: 0;
  }
  15% {
    opacity: 1;
  }
  50% {
    opacity: 1;
  }
  60% {
    top: 2em;
  }
  65% {
    opacity: 0;
  }
  100% {
    top: 2em;
    opacity: 0;
  }
}
.work {
  padding: 3.5em 15%;
}

.work-example {
  padding: 3.5em 0;
  gap: 3.2em;
  display: flex;

  img {
    width: 30vw;
  }

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
    color: var(--accent-color);
  }
}

.right {
  justify-content: right;
}
</style>
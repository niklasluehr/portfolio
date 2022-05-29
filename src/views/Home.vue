<template>
  <div class="home">
    <section class="hero">
      <img src="@/assets/me.jpg" alt="Me" />
      <div class="hero-text">
        <h1>{{ t("hero.slogan") }}</h1>
        <hr />
        <p>Web Design &amp; Development</p>
        <div class="scroll-container" v-on:click="scrollToWork">
          <div class="scroll-cta"></div>
          <span>{{ t("hero.show_work") }}</span>
        </div>
      </div>
    </section>

    <section class="work">
      <!-- <section class="work-example">
        <img src="@/assets/dance.png" alt="dance2diz screenshot" />
        <div class="work-text">
          <h2>{{ t("projects.dance2diz.name") }}</h2>
          <p>{{ t("projects.dance2diz.subtitle") }}</p>
          <ul>
            <li>{{ t("projects.dance2diz.bullet_points.b1") }}</li>
            <li>{{ t("projects.dance2diz.bullet_points.b2") }}</li>
            <li>{{ t("projects.dance2diz.bullet_points.b3") }}</li>
          </ul>
        </div>
      </section> -->
      <section class="work-example">
        <!-- <img src="@/assets/codefast.png" alt="codefast.app screenshot" /> -->
        <video class="preview" autoplay muted loop>
          <source src="@/assets/codefast_demo.mp4" type="video/mp4" />
          Your browser does not support the video tag.
        </video>
        <div class="work-text">
          <div class="project-title">
            <h2>{{ t("projects.codefast.name") }}</h2>
            <a
              target="_blank"
              rel="noopener noreferrer"
              href="https://codefast.app"
            >
              <img
                src="@/assets/external_link.svg"
                class="icon-link"
                alt="open link"
              />
            </a>
          </div>
          <p>{{ t("projects.codefast.subtitle") }}</p>
          <ul>
            <li>{{ t("projects.codefast.bullet_points.b1") }}</li>
            <li>{{ t("projects.codefast.bullet_points.b2") }}</li>
            <li>{{ t("projects.codefast.bullet_points.b3") }}</li>
          </ul>
        </div>
      </section>
      <h3 class="work-in-progress">{{ t("projects.work_in_progress") }}</h3>
    </section>

    <!-- <section class="testimonials">
      <Swiper
        class="testimonial-swiper"
        :modules="modules"
        :slides-per-view="testimonialSlidesPerView"
        :space-between="50"
        :pagination="{ clickable: true, dynamicBullets: true }"
      >
        <SwiperSlide class="testimonial">
          <blockquote>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ut
            adipiscing dictum rutrum lorem egestas lectus massa nibh.
            Condimentum elementum lorem tempus ornare sit mauris. Hendrerit
            adipiscing diam massa.
          </blockquote>
          <hr />
          <h3>Ben Hughes</h3>
          <p>dance2diz.com</p>
        </SwiperSlide>
        <SwiperSlide class="testimonial">
          <blockquote>
            Orci, nunc diam egestas sed tellus neque, malesuada mauris. Cras
            ultrices quis tincidunt condimentum convallis arcu, ac at. Habitasse
            sed vel enim ac sit. Orci in arcu amet imperdiet mauris eget.
          </blockquote>
          <hr />
          <h3>Paul Hadi</h3>
          <p>paulhadimusic.com</p>
        </SwiperSlide>
        <SwiperSlide class="testimonial">
          <blockquote>
            Morbi facilisis condimentum pellentesque dignissim aliquet mi amet.
            Sit proin orci convallis nisi at ultricies nec praesent etiam.
            Lectus duis vel maecenas tortor, leo a. Et urna et lobortis faucibus
            elit viverra aliquam. Maecenas.
          </blockquote>
          <hr />
          <h3>Andrew Ng</h3>
          <p>deeplearning.ai</p>
        </SwiperSlide>
      </Swiper>
    </section> -->
  </div>
</template>

<script>
// import { Swiper, SwiperSlide } from "swiper/vue";
// import { Pagination, A11y } from "swiper";
import "swiper/css/bundle";
// import { VueScreenSizeMixin } from "vue-screen-size";
import { useI18n } from "vue-i18n";

export default {
  name: "Home",
  // components: { Swiper, SwiperSlide },
  // mixins: [VueScreenSizeMixin],
  data() {
    return {};
  },
  setup() {
    const { t } = useI18n();

    return {
      // modules: [Pagination, A11y],
      t,
    };
  },
  methods: {
    scrollToWork() {
      document.querySelector(".work").scrollIntoView({ behavior: "smooth" });
    },
  },
  computed: {
    testimonialSlidesPerView() {
      if (this.$vssWidth < 768) {
        return 1;
      } else if (this.$vssWidth < 1264) {
        return 2;
      } else {
        return 3;
      }
    },
  },
};
</script>

<style scoped lang="scss">
.hero {
  display: flex;
  flex-direction: column;
  gap: 1em;
  background: var(--background2);
  padding: var(--margin-mobile);

  img {
    width: 100%;
    object-fit: cover;
    box-shadow: inset 0px 0px 2px 2px #2d2d2a;
    border-radius: 25px;
  }

  .hero-text {
    display: flex;
    flex-direction: column;
    padding: 0.5em;

    h1 {
      margin: 0;
      font-size: 1.8rem;
    }

    hr {
      margin: 1em auto;
      width: 70%;
      color: var(--accent);
      border: none;
      height: 2px;
      background-color: var(--accent);
    }

    p {
      margin: 0;
      letter-spacing: 0.2em;
      text-transform: uppercase;
    }

    .scroll-container {
      align-self: center;
      display: flex;
      align-items: center;
      margin-top: 2em;

      span {
        font-size: 1.2rem;
        padding-left: 0.5em;
        font-weight: bold;
        transition: .3s;
      }

      &:hover {
        cursor: pointer;

        span {
          transform: translateY(2px);
        }
      }

      .scroll-cta {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 0.15em;
        height: 3.88em;
        width: 1.81em;
        border: 2px solid var(--accent);
        border-radius: 3em;

        &:before {
          position: relative;
          top: 0;
          align-self: flex-end;
          width: 1em;
          height: 1em;
          border-radius: 50%;
          content: "";
          border: 2px solid var(--accent);
          animation: move-scroll 1.2s ease-in-out infinite;
        }
      }
    }
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
  padding: 3em var(--margin-mobile);
  display: flex;
  flex-direction: column;
  gap: 7em;

  .work-example {
    /* height: max(100vh, 100vw); */
    display: flex;
    flex-direction: column;
    justify-content: center;

    .preview {
      width: 100%;
      margin-bottom: 1em;
    }

    .work-text {
      .project-title {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 0.7em;

        h2 {
          margin: 0;
          font-size: 1.5rem;
          color: var(--accent);
        }

        a {
          display: flex;
          /* align-items: center; */

          &:hover {
            transform: scale(1.1);
          }

          .icon-link {
            padding-top: 2px;
            height: 1.6rem;
          }
        }
      }

      p {
        margin: 0;
        letter-spacing: 0.15em;
        font-size: 0.9rem;
        color: var(--accent);
        text-transform: uppercase;
      }

      ul {
        text-align: left;
        margin-top: 0.5em;
        margin-bottom: 0;
        padding-left: 2em;

        li {
          padding-bottom: 0.3em;
        }
      }
    }
  }
}

.work-in-progress {
  color: var(--accent);
  margin-top: 0;
  margin-bottom: 3em;
  justify-self: center;
}

.testimonials {
  background: var(--background2);
  padding: 2em var(--margin-mobile);

  .testimonial-swiper {
    padding-bottom: 2em;

    .testimonial {
      list-style-type: none;

      blockquote {
        margin: 0;
        font-style: italic;
        font-size: 1rem;
      }

      h3 {
        font-size: 1.1rem;
        margin: 0;
      }

      p {
        margin: 0;
      }

      hr {
        margin: 0.8em auto;
        width: 8em;
        border: none;
        height: 1px;
        color: var(--accent);
        background-color: var(--accent);
      }
    }
  }
}

:global(.swiper-pagination-bullet) {
  background-color: var(--primary);
}

:global(.swiper-pagination-bullet-active) {
  background-color: var(--accent);
}

/* TABLET */
@media only screen and (min-width: 768px) {
  .hero {
    padding: 3em var(--margin-tablet);
    flex-direction: row-reverse;
    align-items: center;
    justify-content: space-between;
    // gap: 3.5em;

    .hero-text {
      text-align: left;
      width: 35ch;

      h1 {
        margin: 0;
        font-size: 1.7rem;
        padding-bottom: 0.3em;
      }
      hr {
        display: none;
      }

      p {
        align-self: flex-start;
        margin: 0;
        padding-top: 0.7em;
        border-top: 2px solid var(--accent);
      }
    }

    img {
      width: 50%;
      // min-width: 50%;
      max-width: 500px;
    }
  }

  .work {
    padding: 3em var(--margin-tablet);

    .work-example {
      height: unset;
      padding: 2em 0;
      flex-direction: row;
      justify-content: flex-start;
      align-items: center;
      gap: 2em;
      text-align: left;

      &:nth-child(even) {
        flex-direction: row-reverse;
        gap: 3em;
      }

      .work-text {
        .project-title {
          justify-content: flex-start;
        }
      }

      .preview {
        width: 60%;
        min-width: 60%;
        margin-bottom: 0;
        /* object-fit: cover; */
      }
    }
  }

  .testimonials {
    background: var(--background2);
    padding: 3em var(--margin-tablet);

    .testimonial-swiper {
      padding-bottom: 2em;

      .testimonial {
        padding: 0 1em;
      }
    }
  }
}
/* hero bigger text */
@media only screen and (min-width: 950px) {
  .hero {
    .hero-text {
      h1 {
        font-size: 2rem;
      }
      p {
        font-size: 1.1rem;
      }
    }
  }
}

/* DESKTOP */
@media only screen and (min-width: 1264px) {
  .hero {
    padding: 4em calc((100% - var(--desktop-max-width)) / 2);

    .hero-text {
      padding-right: 2em;
      width: 50ch;

      h1 {
        margin: 0;
        font-size: 3.3rem;
        padding-bottom: 0.15em;
      }
      hr {
        display: none;
      }

      p {
        margin: 0;
        font-size: 1.38rem;
        letter-spacing: 0.2em;
        text-transform: uppercase;
        padding-top: 0.5em;
        border-width: 3px;
      }
    }

    img {
      width: 550px;
      max-width: 550px;
      box-shadow: inset 0px 0px 2px 2px #2d2d2a;
      border-radius: 25px;
    }
  }

  .work {
    padding: 4em calc((100% - var(--desktop-max-width)) / 2);

    .work-example {
      gap: 3.5em;

      &:nth-child(even) {
        gap: 5em;
      }
    }
  }

  .testimonials {
    padding: 4em calc((100% - var(--desktop-max-width)) / 2);
  }
}
</style>
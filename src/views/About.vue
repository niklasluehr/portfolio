<template>
  <div class="about">
    <section class="personal">
      <img src="@/assets/me.jpg" alt="Me" />

      <blockquote>
        <span class="left-quote">"</span>
        I’m a computer science student from Munich, currently doing my Masters
        degree at LMU. I’ve been passionate about computers and programming ever
        since my grandpa told my how to write simple programs in BASIC.
        <span class="right-quote">"</span>
      </blockquote>
    </section>
  </div>
</template>

<style lang="scss">
:root {
  --primary-color: #f7f7f7;
  --accent-color: #fea82f;
  --background-color: #2d2d2a;
}

h1 {
  margin: 0;
}

.about {
  background: #21211e;
}

.personal {
  padding: 7em 15%;
  display: flex;
  align-items: center;
  gap: 10em;

  img {
    width: 33em;
    max-height: 100%;
    max-width: 100%;
    box-shadow: inset 0px 0px 2px 2px #2d2d2a;
    border-radius: 25px;
  }

  blockquote {
    text-align: left;
    margin: 0;
    font-style: italic;
    font-size: 1.25rem;
    color: var(--primary-color);

    span {
      position: absolute;
      font-size: 3.13rem;
      color: var(--accent-color);
      
      &.left-quote {
        transform: translate(-0.4em, -0.3em);
      }
      &.right-quote {
        transform: translateY(-0.3em);
      }
    }
  }
}
</style>

<template>
  <div class="about">
    <section class="personal">
      <img src="@/assets/me.jpg" alt="Me" />

      <blockquote>
        <span class="left-quote">"</span>
        I’m a computer science student from Munich, currently doing my Masters
        degree at LMU. I’ve been passionate about computers and programming ever
        since my grandpa taught my how to write simple programs in BASIC.
        <span class="right-quote">"</span>
      </blockquote>
    </section>
    <section class="block-section">
      <div class="block">
        <h2>education</h2>
        <ul>
          <li><b>2021</b> B.Sc. Computer Science (1.34)</li>
          <li>
            <b>2021</b> Bachelor Thesis “Action Quality Assessment of Trampline
            Routines”: Automatically judging the Olympic Trampoline event from
            videos with Deep Learning
          </li>
          <li><b>2016</b> Abitur (1.5)</li>
        </ul>
      </div>
      <div class="block">
        <h2>skills</h2>
        <ul>
          <li>Java</li>
          <li>Node, Vue, React</li>
          <li>Python &amp; Pytorch</li>
        </ul>
      </div>
      <div class="block">
        <h2>interests</h2>
        <ul>
          <li>Deep Learning, AI</li>
          <li>Sports: Gymnasctics, Breakdance, Fitness</li>
          <li>Personal Development</li>
        </ul>
      </div>
    </section>
  </div>
</template>

<style lang="scss">
.personal {
  background: var(--background2);
  padding: var(--margin-mobile);
  display: flex;
  flex-direction: column;

  img {
    box-shadow: inset 0px 0px 2px 2px #2d2d2a;
    border-radius: 25px;
  }

  blockquote {
    padding: 1.5em;
    text-align: left;
    margin: 0;
    font-style: italic;
    color: var(--primary);

    span {
      position: absolute;
      font-size: 2rem;
      color: var(--accent);

      &.left-quote {
        transform: translate(-0.4em, -0.25em);
      }
      &.right-quote {
        transform: translateY(-0.25em);
      }
    }
  }
}

.block-section {
  padding: var(--margin-mobile);
  text-align: left;
  display: flex;
  flex-direction: column;
  gap: 1.5em;

  .block {
    background: var(--background2);
    padding: 1em;
    h2 {
      margin: 0;
      margin-bottom: 0.2em;
      font-size: 1.25rem;
      color: var(--accent);
    }
    ul {
      margin: 0;
      list-style-type: none;
    }
    li {
      padding: 0.1em 0em;
    }
    li::before {
      content: "\2022"; /* Add content: \2022 is the CSS Code/unicode for a bullet */
      color: var(--accent); /* Change the color */
      font-weight: bold; /* If you want it to be bold */
      display: inline-block; /* Needed to add space between the bullet and the text */
      width: 1.6em; /* Also needed for space (tweak if needed) */
      margin-left: -1.6em; /* Also needed for space (tweak if needed) */
    }
  }
}
@media only screen and (min-width: 768px) {
  .personal {
    padding: var(--margin-tablet);
    flex-direction: row;
    gap: 1.5em;
    align-items: center;

    img {
      width: 50%;
      min-width: 50%;
    }

    blockquote {
      font-size: 1.1rem;

      span {
        font-size: 2.5rem;
      }
    }
  }

  .block-section {
    padding: var(--margin-tablet);
    gap: 2em;

    .block {
      padding: 1.2em 1.5em;
    }
  }
}

@media only screen and (min-width: 1264px) {
  .personal {
    padding: 7em calc((100% - var(--desktop-max-width)) / 2);
    background: var(--background2);
    display: flex;
    align-items: center;
    gap: 8em;

    img {
      width: 40%;
      min-width: 40%;
    }

    blockquote {
      width: 42ch;
      font-size: 1.25rem;
      color: var(--primary);

      span {
        font-size: 3.13rem;

        &.left-quote {
          transform: translate(-0.4em, -0.3em);
        }
        &.right-quote {
          transform: translateY(-0.3em);
        }
      }
    }
  }
  .block-section {
    padding: 4em calc((100% - var(--desktop-max-width)) / 2);
    display: grid;
    grid-template-columns: 2fr 1fr;
    grid-template-rows: auto auto auto;
    gap: 0;

    .block {
      &:nth-child(2) {
        grid-row: 2 / 3;
        grid-column: 2 / 3;
      }
      &:nth-child(3) {
        grid-row: 3 / 4;
        grid-column: 1 / 2;
      }
    }
  }
}
</style>

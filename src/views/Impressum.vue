<template>
  <div class="impressum">
    <h1>Impressum</h1>

    <h2>Angaben gem&auml;&szlig; &sect; 5 TMG</h2>
    <p>
      Niklas L&uuml;hr<br />
      Lerchenweg 2a<br />
      82538 Geretsried
    </p>

    <h2>Kontakt</h2>
    <p>
      <!-- Telefon: &#91;Telefonnummer&#93;<br /> -->
      E-Mail: info@niklasluehr.com
    </p>

    <h2>EU-Streitschlichtung</h2>
    <p>
      Die Europ&auml;ische Kommission stellt eine Plattform zur
      Online-Streitbeilegung (OS) bereit:
      <a
        href="https://ec.europa.eu/consumers/odr/"
        target="_blank"
        rel="noopener noreferrer"
        >https://ec.europa.eu/consumers/odr/</a
      >.<br />
      Unsere E-Mail-Adresse finden Sie oben im Impressum.
    </p>

    <h2>
      Verbraucher&shy;streit&shy;beilegung/Universal&shy;schlichtungs&shy;stelle
    </h2>
    <p>
      Wir sind nicht bereit oder verpflichtet, an Streitbeilegungsverfahren vor
      einer Verbraucherschlichtungsstelle teilzunehmen.
    </p>

    <p>Quelle: <a href="https://www.e-recht24.de">e-recht24.de</a></p>
  </div>
</template>

<style lang="scss" scoped>
.impressum {
  font-family: "Helvetica";
  min-height: 100vh;
  background: var(--background2);
  text-align: left;
  padding: var(--margin-mobile);
}

@media only screen and (min-width: 768px) {
  .impressum {
    padding: var(--margin-tablet);
  }
}

@media only screen and (min-width: 1264px) {
  .impressum {
    padding: 2em calc((100% - var(--desktop-max-width)) / 2);
  }
}
</style>
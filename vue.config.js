module.exports = {
  transpileDependencies: true,
  publicPath: '/',

  pluginOptions: {
    i18n: {
      locale: 'de',
      fallbackLocale: 'en',
      localeDir: 'locales',
      enableLegacy: false,
      runtimeOnly: false,
      compositionOnly: false,
      fullInstall: true
    }
  }
}

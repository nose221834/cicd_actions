// https://nuxt.com/docs/api/configuration/nuxt-config
export default {
  server: {
    host: '0.0.0.0', // デフォルト: localhost
    port: 8001, // デフォルト: 3000
  },

  css: ['@/tailwind.css'],
  build: {
    postcss: {
      postcssOptions: require('./postcss.config.js'),
    }
  }

}

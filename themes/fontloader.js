require("WebFont", function() {
  WebFont.load({
    google: {
      families: ['Roboto:400,400italic,500,700:latin-ext', 'Cormorant Spectral:200,200italic,300,300italic,500,500italic:latin-ext'],
//       families: ['Roboto:400,400italic,500,700:latin-ext', 'Cormorant Garamond:400,400italic,600,700,700italic:latin-ext'],
//     families: ['Roboto'],
//     urls: ['/lib/roboto/roboto.css'],
    },
    active: function () {
      sessionStorage.fonts = true
    },
  })
})
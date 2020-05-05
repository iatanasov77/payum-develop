var Encore = require( '@symfony/webpack-encore' );

Encore
	.setOutputPath( 'public/assets/build/' )
	.setPublicPath( '/assets/build' )
    .cleanupOutputBeforeBuild()
    
    .copyFiles({
         from: './assets/images',
         to: 'images/[path][name].[ext]',
     })
     .copyFiles({
         from: './node_modules/bootstrap-sass/assets/fonts/bootstrap',
         to: 'fonts/bootstrap/[name].[ext]',
     })
    
    .addEntry( 'js/app', './assets/js/app.js' )
    
    .addEntry('js/settings', './assets/js/pages/settings.js')
    .addEntry('js/profile', './assets/js/pages/profile.js')
    .addEntry('js/taxonomy', './assets/js/pages/taxonomy.js')
    .addEntry('js/pages-edit', './assets/js/pages/pages-edit.js')
    
    .autoProvidejQuery()
    .enableSassLoader(function(sassOptions) {}, {
        resolveUrlLoader: true
    })
    .configureFilenames({
        js: '[name].js?[contenthash]',
        css: '[name].css?[contenthash]',
        images: 'images/[name].[ext]?[hash:8]',
        fonts: 'fonts/[name].[ext]?[hash:8]'
    })
    .enableSingleRuntimeChunk()
    .enableVersioning(Encore.isProduction())
    .enableSourceMaps( !Encore.isProduction() )
;

module.exports = Encore.getWebpackConfig();

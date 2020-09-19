var Encore = require( '@symfony/webpack-encore' );

Encore
	.setOutputPath( 'public/assets/build/' )
	.setPublicPath( '/assets/build' )
    
   // delete old files before creating them
    .cleanupOutputBeforeBuild()
    
    // generate runtime.js that must to be loaded into the page template
    // bootstrap the environement
    .enableSingleRuntimeChunk()

    // add debug data in development
    .enableSourceMaps(!Encore.isProduction())

    // uncomment to create hashed filenames (e.g. app.abc123.css)
    .enableVersioning(Encore.isProduction())

    // show OS notifications when builds finish/fail
    .enableBuildNotifications()

    // empty the outputPath dir before each build
    .cleanupOutputBeforeBuild()

    // see https://symfony.com/doc/current/frontend/encore/bootstrap.html
    .enableSassLoader(function(sassOptions) {}, {
        resolveUrlLoader: true
    })
    
    .autoProvidejQuery()
    
    .configureFilenames({
        js: '[name].js?[contenthash]',
        css: '[name].css?[contenthash]',
        images: 'images/[name].[ext]?[hash:8]',
        fonts: 'fonts/[name].[ext]?[hash:8]'
    })
    
    
    
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
;

module.exports = Encore.getWebpackConfig();

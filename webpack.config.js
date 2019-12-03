var Encore = require( '@symfony/webpack-encore' );

Encore
    .setOutputPath( 'public/build/website/' )
    .setPublicPath( '/build/website' )
    .copyFiles({
         from: './assets/website/img',
         to: 'img/[path][name].[hash:8].[ext]',
     })
    
    .splitEntryChunks()
    .enableSingleRuntimeChunk()

    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSourceMaps(!Encore.isProduction())
    // enables hashed filenames (e.g. app.abc123.css)
    .enableVersioning(Encore.isProduction())
    .autoProvidejQuery()

    .addLoader({
        test: /jsrouting-bundle\/Resources\/public\/js\/router.js$/,
        loader: "exports-loader?router=window.Routing"
    })
    .enableSassLoader(function(sassOptions) {}, {
        resolveUrlLoader: true
    })
    .configureFilenames({
        js: '[name].js?[contenthash]',
        css: '[name].css?[contenthash]',
        images: 'images/[name].[ext]?[hash:8]',
        fonts: 'fonts/[name].[ext]?[hash:8]'
    })
    
    .addEntry('app', './assets/website/js/app.js')
    
    .addStyleEntry( 'css/global', './assets/website/css/app.css')
;

const websiteTemplate = Encore.getWebpackConfig();
websiteTemplate.name = 'websiteTemplate';

websiteTemplate.watchOptions = {
    poll: true,
    ignored: /node_modules/
};

var path = require('path');
websiteTemplate.resolve.alias	= {
    // Force all modules to use the same jquery version.
    'jquery': path.join(__dirname, 'node_modules/jquery/src/jquery'),
    'router': __dirname + '/assets/js/fos_js_routing.js'
};


//reset Encore to build the second config
Encore.reset();
Encore
    .setOutputPath( 'public/build/admin/' )
    .setPublicPath( '/build/admin' )
    
    .copyFiles({
         from: './assets/admin/images',
         to: 'images/[path][name].[ext]',
     })
    
    .addEntry( 'app', './assets/admin/js/app.js' )
    .addStyleEntry( 'css/global', './assets/admin/css/main.css' )
    
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
    
    .addEntry('profile', './assets/admin/js/pages/profile.js')
 
;

// build the second configuration
const adminTemplate = Encore.getWebpackConfig();
adminTemplate.name = 'adminTemplate';


// export the final configuration as an array of multiple configurations
module.exports = [websiteTemplate, adminTemplate];

require( 'jquery-easyui/css/easyui.css' );
require( 'jquery-easyui/js/jquery.easyui.min.js' );

$( function()
{
	// https://www.jeasyui.com/documentation/combotree.php
	//$('#cc').combotree('setValues', [1,3,21]);
	var taxonId	= $( '#page_form_category_taxon' ).attr( 'data-value' );
	$( '#page_form_category_taxon' ).combotree( 'setValue', taxonId );
	
	$( '#page_form_locale' ).on( 'change', function( e ) {
		var pageId	= $( '#pageFormContainer' ).attr( 'data-pageId' );
		var locale	= $( this ).val()
		
		$.ajax({
            type: 'GET',
            url: '/bundles/vs-cms/page-actions/get-form/' + locale + '/' + pageId,
            success: function ( data ) {
                $( '#pageFormContainer' ).html( data );
                $( '#page_form_category_taxon' ).combotree();
            }, 
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert( 'FATAL ERROR!!!' );
            }
        });
	});
});

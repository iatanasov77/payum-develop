require( 'bootstrap-gtreetable/dist/bootstrap-gtreetable.css' );
require( 'bootstrap-gtreetable/dist/bootstrap-gtreetable.js' );
require( 'jquery-easyui/css/easyui.css' );
require( 'jquery-easyui/js/jquery.easyui.min.js' );

$( function()
{
	$( '.btnTaxonomyTaxon' ).on( 'click', function( e ) {
		$.ajax({
			type: "GET",
		 	url: $( this ).attr( 'data-url' ),
			success: function( response )
			{
				$( '#taxonomyTaxonBody > div.card-body' ).html( response );
				$('#taxon_form_parentTaxon').combotree({
				    url: $( this ).attr( 'data-easyui-url' ),
				    required: true
				});
				$( '#taxonomyTaxonModal' ).modal( 'toggle' );
			},
			error: function()
			{
				alert( "SYSTEM ERROR!!!" );
			}
		});
	});
	
	$( '#btnSaveTaxon' ).on( 'click', function( e )
    {
    	var taxonForm	= $( '#taxonomyTaxonModal' ).find( 'form' );
    	
    	taxonForm.submit();
    });
	
	$( '#tableTaxons' ).gtreetable({
		'source': function ( id ) {
			return {
				type: 'GET',
				url: $( '#tableTaxons' ).attr( 'data-url' ),
				data: { 'parentTaxonId': id },
				dataType: 'json',
				error: function( XMLHttpRequest ) {
					alert( 'GTreeTable ERROR !!!' );
					alert( XMLHttpRequest.status + ': ' + XMLHttpRequest.responseText );
				}
  	      	}
  	    }
  	});
});

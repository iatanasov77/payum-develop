require( 'jquery-easyui/css/easyui.css' );
require( 'jquery-easyui/js/jquery.easyui.min.js' );

$( function()
{
	// https://www.jeasyui.com/documentation/combotree.php
	//$('#cc').combotree('setValues', [1,3,21]);
	var taxonId	= $( '#page_category_form_parent' ).attr( 'data-value' );
	$( '#page_category_form_parent' ).combotree( 'setValue', taxonId );
	
});

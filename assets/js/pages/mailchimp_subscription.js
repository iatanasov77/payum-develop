/*
 * Officially the typeahead is dropped from the boottrap 3.0
 * And is available separtely in typeahead.js
 */
require( 'bootstrap-3-typeahead/bootstrap3-typeahead.js' );	// Typehead is removed from Bootstrap 3 and it's provided as a separate package

require( 'bootstrap4-tagsinput-douglasanpa/tagsinput.css' );
require( 'bootstrap4-tagsinput-douglasanpa/tagsinput.js' );

var spinner = '<div id="project-spinner" style="text-align:center;"><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i></div>';

/**
 * onTopOf: ID of the element on top of display the spinner
 */
function showSpinner( onTopOf ) {
	$( onTopOf ).before( spinner );
	$( '#project-spinner' ).css( {'opacity': '0.8', 'position':'absolute', 'text-align':'center', 'top':'170px', 'left':'210px', 'z-index':'9'} );
	$( onTopOf ).css( {'pointer-events': 'none', 'position':'relative', 'width': '100%', 'height': '100%', 'opacity': '0.8'} );
}
function hideSpinner( onTopOf ) {
	$( onTopOf ).removeAttr( 'style' );
	$( '#project-spinner' ).remove();
}

$( function()
{
	$( '#btnMailchimpSubscribe' ).on( 'click', function( e )
    {
    	e.preventDefault();
    	e.stopPropagation();
    	
    	$( '#modalMailchimpSubscribe' ).modal( 'toggle' );
        showSpinner( '#formMailchimpSubscribeContainer' );
        
        $.ajax({
            type: "GET",
            url: "/newsletter/mailchimp/subscribe",
            success: function( response )
            {
            	hideSpinner( '#formMailchimpSubscribeContainer' );
                $( '#formMailchimpSubscribeContainer' ).html( response );
                
                // Initialize TagsInput
                var tags	= $( '#mailchimp_subscription_form_tags' ).attr( 'data-tags' );
                $( '.tagsInput' ).tagsinput({
					typeahead: {
					    source: eval( tags ) // ['Amsterdam', 'Washington', 'Sydney', 'Beijing', 'Cairo']
					},
					freeInput: true
				});
				$( '.tagsInput' ).on( 'itemAdded', function( event )
				{
					setTimeout( function()
					{
						$( ">input[type=text]",".bootstrap-tagsinput" ).val( "" );
					}, 1 );
				});
            },
            error: function()
            {
            	hideSpinner( '#formMailchimpSubscribeContainer' );
                alert( "SYSTEM ERROR!!!" );
            }
        });
    });
    
    $( '#btnSubscribe' ).on( 'click', function( e )
    {
    	showSpinner( '#formMailchimpSubscribeContainer' );
    	$.ajax({
            type: "POST",
            url: $( '#formMailchimpSubscription' ).attr( 'action' ),
            data: $('#formMailchimpSubscription').serialize(),
            success: function( response )
            {
	        	hideSpinner( '#formMailchimpSubscribeContainer' );
	        	if ( response['status'] == 'error' ) {
	        		alert( 'ERROR: ' + response['message'] );
	        	} else {
	        		//location.reload();
	        	}
	        },
            error: function()
            {
            	hideSpinner( '#formMailchimpSubscribeContainer' );
                alert( "SYSTEM ERROR!!!" );
            }
	    });
    });
});

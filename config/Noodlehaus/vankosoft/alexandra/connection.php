<?php

return array(
	'connection'	=> array(
		'DataStax'	=> array(
			'driver'			=> 'datastax',
			'port'				=> 9042,
			'contact_points'	=> array( 'localhost' ),
			'keyspace'			=> 'vs_dev',
			'page_size'			=> 5000
		),
		/////////////////////////////////////////////////////////////////
	    // EvseevNN driver is deprecated and not maintained anymore.
	    // Please use: https://github.com/duoshuo/php-cassandra
	    /////////////////////////////////////////////////////////////////
		'EvseevNN'	=> array(
			'driver'			=> 'evseevnn',
			'port'				=> 9042,
			'contact_points'	=> array( 'localhost' ),
			'keyspace'			=> 'vs_dev',
			'page_size'			=> 5000
		),
	    ////////////////////////////////////////////////////////////////////
	    // Manual HowTo Connect: https://github.com/duoshuo/php-cassandra
	    ///////////////////////////////////////////////////////////////////
	    'DuoShuo'	=> array(
	        'driver'			=> 'duoshuo',
	        'port'				=> 9042,
	        'contact_points'	=> array( 'localhost' ),
	        'keyspace'			=> 'vs_dev',
	        'page_size'			=> 5000
	    )
	),
	
	'logger'	=> array(
		// Define log chanels
		'QueryTrace'	=> array(
			'handlers' =>array(
				'file'	=> array(
					'file'	=>	'/vagrant/logs/vankosoft/alexandra/query.log'
				),
				//'firephp'	=> array()
			)
		),
		
		'ErrorLog'	=> array(
			'handlers' =>array(
				'file'	=> array(
					'file'	=>	'/vagrant/logs/vankosoft/alexandra/error.log'
				),
				//'firephp'	=> array()
			)
		)
	)
);

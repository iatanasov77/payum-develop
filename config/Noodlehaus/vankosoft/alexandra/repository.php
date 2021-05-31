<?php

return array(
	'repository' => array(
		'Main::Products' => array(
			'table'         => 'products',
			'repository'    => '\VankoSoft\Alexandra\ODM\Repository\Repository',
			'entity'        => '\App\Entity\Cassandra\Product'
		)
	)
);

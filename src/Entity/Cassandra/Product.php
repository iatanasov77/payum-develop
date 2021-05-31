<?php namespace App\Entity\Cassandra;

use VankoSoft\Alexandra\ODM\Entity\Entity;

class Product extends Entity
{
	public $productId;
	
	public $title;
	
	public $qty;
	
	public $price;
	
	public $categories;
}

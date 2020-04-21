<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use VS\ApplicationBundle\Model\Taxonomy as BaseTaxonomy;

/**
 * @ORM\Table(name="APP_Taxonomy")
 * @ORM\Entity
 */
class Taxonomy extends BaseTaxonomy
{
    
}

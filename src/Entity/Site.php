<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use VS\ApplicationBundle\Model\Settings as BaseSettings;

/**
 * @ORM\Table(name="APP_Sites")
 * @ORM\Entity
 */
class Site extends BaseSettings
{
    
}

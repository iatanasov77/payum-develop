<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use VS\ApplicationBundle\Model\Settings as BaseSettings;

/**
 * @ORM\Table(name="VSAPP_Settings")
 * @ORM\Entity
 */
class Settings extends BaseSettings
{
}

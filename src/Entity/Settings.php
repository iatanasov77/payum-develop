<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use VS\ApplicationBundle\Model\Settings as BaseSettings;

/**
 * @ORM\Table(name="APP_Settings")
 * @ORM\Entity
 */
class Settings extends BaseSettings
{
    const SITE_ADMIN    = 3;    // admin.vankosoft.org
    const SITE_BLOG     = 4;    // blog.vankosoft.org
    const SITE_MAIN     = 5;    // vankosoft.org
}

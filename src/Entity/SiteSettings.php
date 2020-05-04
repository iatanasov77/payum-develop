<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use VS\ApplicationBundle\Model\SiteSettings as BaseSiteSettings;

/**
 * @ORM\Table(name="APP_SiteSettings")
 * @ORM\Entity
 */
class SiteSettings extends BaseSiteSettings
{
    /*
    const SITE_ADMIN    = 3;    // admin.vankosoft.org
    const SITE_BLOG     = 4;    // blog.vankosoft.org
    const SITE_MAIN     = 5;    // vankosoft.org
    */
    
    const TAXONOMY_ID = 3;
}

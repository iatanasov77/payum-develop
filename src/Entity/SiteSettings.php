<?php namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use VS\ApplicationBundle\Model\SiteSettings as BaseSiteSettings;

/**
 * @ORM\Table(name="VSAPP_SiteSettings")
 * @ORM\Entity
 */
class SiteSettings extends BaseSiteSettings
{
    const TAXONOMY_ID   = 5;
    const SITE_TEST  = 15;
    
    /*
     const SITE_ADMIN    = 3;    // admin.vankosoft.org
     const SITE_BLOG     = 4;    // blog.vankosoft.org
     const SITE_MAIN     = 5;    // vankosoft.org
     */
}

<?php namespace App\Entity\Cms;

use Doctrine\ORM\Mapping as ORM;
use VS\CmsBundle\Model\PageCategoryRelation as BasePageCategoryRelation;

/**
 * PageCategoryRelation
 *
 * @ORM\Table(name="VSCMS_Pages_Categories")
 * @ORM\Entity
 */
class PageCategoryRelation extends BasePageCategoryRelation
{
    
}

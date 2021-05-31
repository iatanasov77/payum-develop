<?php namespace App\Entity\Cms;

use Doctrine\ORM\Mapping as ORM;
use VS\CmsBundle\Model\PageCategory as BasePageCategory;

/**
 * @ORM\Entity
 * @ORM\Table(name="VSCMS_PageCategories")
 */
class PageCategory extends BasePageCategory
{

}

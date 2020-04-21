<?php namespace App\Entity\Cms;

use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use VS\CmsBundle\Model\PageCategory as BasePageCategory;

/**
 * @Gedmo\TranslationEntity(class="App\Entity\Translation")
 * @Gedmo\Tree(type="nested")
 * @ORM\Table(name="IACMS_PageCategories")
 * @ORM\Entity(repositoryClass="VS\CmsBundle\Repository\PageCategoryRepository")
 */
class PageCategory extends BasePageCategory
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", precision=0, scale=0, nullable=false, unique=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    protected $id;
    
    
}

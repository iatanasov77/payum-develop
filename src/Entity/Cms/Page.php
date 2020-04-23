<?php namespace App\Entity\Cms;

use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use VS\CmsBundle\Model\Page as BasePage;

/**
 * Page
 *
 * @Gedmo\TranslationEntity(class="App\Entity\Translation")
 * @ORM\Table(name="IACMS_Pages")
 * @ORM\Entity
 */
class Page extends BasePage
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

<?php namespace App\Entity\Cms;

use Gedmo\Mapping\Annotation as Gedmo;
use Doctrine\ORM\Mapping as ORM;
use VS\CmsBundle\Model\Page as BasePage;

/**
 *
 * @Gedmo\Loggable(logEntryClass="App\Entity\LogEntry")
 * @ORM\Table(name="TEST_PageVersion")
 * @ORM\Entity
 */
class TestPageVersion
{
    /**
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;
    
    /**
     * @Gedmo\Versioned
     * @ORM\Column(name="title", type="string", length=8)
     */
    private $title;
    
    public function getId()
    {
        return $this->id;
    }
    
    public function setTitle($title)
    {
        $this->title = $title;
    }
    
    public function getTitle()
    {
        return $this->title;
    }
}

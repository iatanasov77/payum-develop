<?php namespace App\Entity\Taxonomy;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

/**
 * Test Categorization of products with sylius taxonomy
 *
 * @ORM\Table(name="TEST_Products")
 * @ORM\Entity
 */
class Product
{
    /**
     * @ORM\Column(name="id", type="integer", precision=0, scale=0, nullable=false, unique=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    protected $id;
    
    /**
     * @ORM\ManyToMany(targetEntity="Sylius\Component\Taxonomy\Model\TaxonInterface")
     * @ORM\JoinTable(name="TEST_Products_Taxons",
     *      joinColumns={@ORM\JoinColumn(name="product_id", referencedColumnName="id", nullable=false )},
     *      inverseJoinColumns={@ORM\JoinColumn(name="taxon_id", referencedColumnName="id", nullable=false)}
     * )
     */
    protected $taxons;
    
    /**
     * @ORM\Column(type="string", length=64, nullable=false)
     */
    protected $name;
    
    public function __construct()
    {
        $this->taxons = new ArrayCollection();
    }
    
    public function getId()
    {
        return $this->id;
    }
    
    public function getTaxons()
    {
        return $this->taxons;
    }
    
    public function setTaxons(Collection $taxons)
    {
        $this->taxons = $taxons;
    }
    
    public function getName()
    {
        return $this->name;
    }
    
    public function setName($name)
    {
        $this->name = $name;
    }
}

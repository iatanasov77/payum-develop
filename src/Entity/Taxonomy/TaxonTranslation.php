<?php namespace App\Entity\Taxonomy;

use Doctrine\ORM\Mapping as ORM;
use VS\ApplicationBundle\Model\TaxonTranslation as BaseTaxonTranslation;

/**
 * @ORM\Entity
 * @ORM\Table(name="APP_TaxonTranslations")
 */
class TaxonTranslation extends BaseTaxonTranslation
{

}

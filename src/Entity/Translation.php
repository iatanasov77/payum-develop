<?php  namespace App\Entity;
<<<<<<< HEAD
=======

>>>>>>> 1f36122... Commit
/**
namespace Gedmo\Translatable\Entity;

@E TVA E: Taa pederastiq parvo iska gorniq namespace i kato dade gre6ka si sloji namespace App\Entity; i vsi4ko po4va da raboti
    
*/

<<<<<<< HEAD
use Doctrine\ORM\Mapping as ORM;
use VS\ApplicationBundle\Model\Translation as BaseTranslation;

/**
 * @ORM\Table(name="VSAPP_Translations")
 * @ORM\Entity
=======
use Doctrine\ORM\Mapping\Table;
use Doctrine\ORM\Mapping\Index;
use Doctrine\ORM\Mapping\UniqueConstraint;
use Doctrine\ORM\Mapping\Entity;

use VS\ApplicationBundle\Model\Translation as BaseTranslation;

/**
 * @Table(
 *         name="VSAPP_Translations",
 *         options={"row_format":"DYNAMIC"},
 *         indexes={@Index(name="translations_lookup_idx", columns={
 *             "locale", "object_class", "foreign_key"
 *         })},
 *         uniqueConstraints={@UniqueConstraint(name="lookup_unique_idx", columns={
 *             "locale", "object_class", "field", "foreign_key"
 *         })}
 * )
 * @Entity
>>>>>>> 1f36122... Commit
 */
class Translation extends BaseTranslation
{
     
}

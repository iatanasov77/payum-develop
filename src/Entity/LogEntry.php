<?php  namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use VS\ApplicationBundle\Model\LogEntry as BaseLogEntry;

/**
 * @ORM\Table(name="VSAPP_LogEntries")
 * @ORM\Entity
 */
class LogEntry extends BaseLogEntry
{
     
}

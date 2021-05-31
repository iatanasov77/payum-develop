<?php namespace App\Entity\UsersSubscriptions;

use Doctrine\ORM\Mapping as ORM;
use VS\UsersSubscriptionsBundle\Model\MailchimpAudience as MailchimpAudienceBase;

/**
 * @ORM\Entity
 * @ORM\Table(name="VSUS_MailchimpAudiences")
 */
class MailchimpAudience extends MailchimpAudienceBase
{
    
}

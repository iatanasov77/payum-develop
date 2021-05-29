<?php namespace App\Entity\UsersSubscriptions;

use Doctrine\ORM\Mapping as ORM;
use VS\UsersSubscriptionsBundle\Model\NewsletterSubscription as NewsletterSubscriptionBase;

/**
 * @ORM\Entity
 * @ORM\Table(name="VSUS_NewsletterSubscriptions")
 */
class NewsletterSubscription extends NewsletterSubscriptionBase
{
    
}

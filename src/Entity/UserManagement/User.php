<?php namespace App\Entity\UserManagement;

use Doctrine\ORM\Mapping as ORM;
use VS\UsersBundle\Model\User as BaseUser;

/**
 * @ORM\Entity
 * @ORM\Table(name="IAUM_Users")
 */
class User extends BaseUser
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;
    
    /**
     * @ORM\OneToOne(targetEntity="App\Entity\UserManagement\UserInfo", cascade={"persist"})
     * @ORM\JoinColumn(name="user_info_id", referencedColumnName="id")
     */
    protected $userInfo;
    
    public function getUserInfo()
    {
        return $this->userInfo;
    }
    
    public function setUserInfo( $userInfo )
    {
        $this->userInfo = $userInfo;
        
        return $this;
    }
    
    public function __construct()
    {
        parent::__construct();
    }
}

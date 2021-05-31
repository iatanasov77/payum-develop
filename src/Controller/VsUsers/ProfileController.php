<?php namespace App\Controller\VsUsers;

use Symfony\Component\Routing\Annotation\Route;
use VS\UsersBundle\Controller\ProfileController as BaseProfileController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ProfileController extends BaseProfileController
{
    /**
     * @Route("/profile", name="vsusers_profile")
     */
    public function showAction( Request $request ) : Response
    {
        return parent::showAction( $request );
    }
}


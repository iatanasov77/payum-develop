<?php namespace App\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    public function index()
    {
        return $this->render( 'admin/pages/home.html.twig' );
    }
    
    public function gotoAdmin() {
        return $this->redirectToRoute( 'app_home' );
    }
}

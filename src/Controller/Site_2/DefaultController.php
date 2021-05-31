<?php namespace App\Controller\Site_2;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    public function index()
    {
        return $this->render( 'site_2/pages/home.html.twig' );
    }
}

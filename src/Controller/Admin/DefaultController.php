<?php namespace App\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends Controller
{
    public function index()
    {
        return $this->redirectToRoute( 'vs_application_dashboard' );
    }
    
    /**
     * @Route("/set_lang/{lang}", name="app_set_lang")
     */
    public function setLanguage( Request $request ): Response
    {
        $lang   = $request->attributes->get( 'lang' );
        $request->getSession()->set( '_locale', $lang );
        
        return $this->redirect( $request->headers->get( 'referer' ) );
    }
}

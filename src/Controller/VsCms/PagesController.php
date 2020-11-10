<?php namespace App\Controller\VsCms;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

class PagesController extends Controller
{
    /**
     * @Route("/vs_cms/pages", name="vs_cms-pages-index")
     */
    public function indexAction( Request $request ): Response
    {
        $er = $this->getDoctrine()->getRepository( 'App\Entity\Cms\Page' );
        
        return $this->render( 'vs_cms/pages/index.html.twig', [
            'items'         => $er->findAll(),
        ]);
    }
    
    /**
     * @Route("/vs_cms/pages/{id}", name="vs_cms-pages-show")
     */
    public function show( Request $request ): Response
    {
        $id     = $request->attributes->get( 'id' );
        $page   = $this->getDoctrine()->getRepository( 'App\Entity\Cms\Page' )->find( $id );

        return $this->render( 'vs_cms/pages/show.html.twig', [
            'page' => $page
        ]);
    }
}
